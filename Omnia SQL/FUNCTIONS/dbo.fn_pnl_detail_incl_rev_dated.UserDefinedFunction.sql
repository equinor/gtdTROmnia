/****** Object:  UserDefinedFunction [dbo].[fn_pnl_detail_incl_rev_dated]    Script Date: 13/11/2019 14:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[fn_pnl_detail_incl_rev_dated] 
(
	-- Add the parameters for the function here
	@pnlDate Date)
RETURNS 
  TABLE 

AS
	RETURN
	with
dates as (
select distinct l.system_date,l.pfolio, l.EXTRACTION_ID, dateadd(mm,12,(dateadd(year,datediff(yyyy,0,l.system_date),0))) NEXT_YEAR, dateadd(mm,-3,(dateadd(year,datediff(yyyy,0,l.system_date),0))) HIST_CUT_OFF, dateadd(mm,48,(dateadd(year,datediff(yyyy,0,l.system_date),0))) FUT_CUT_OFF,dateadd(MONTH,-1,dbo.first_of_month(l.system_date)) PREV_MONTH
from endur.view_union_extraction_log l inner join endur.view_reporting_dates sd on l.system_date=@pnlDate where l.SCENARIO_SEQ_NUM = 1 and l.run_type=1 )

select
'UR'source,
r.deal_num,
r.cflow_type,
rep_dat.reporting_date,
l.SYSTEM_DATE,
IIF((P_Ext.BW_Exclude IS NULL OR P_Ext.BW_Exclude = 0 and not(  L.PFOLIO IN (20268,20233,20307,20234) AND deal.INS_TYPE IN (48605, 48610)) ),'Yes','No') as In_Official_PnL,
l.pfolio as portfolio_id,
p_ext.BU_ID,
p_ext.BU_NAME,
p_ext.TA_ID,
p_ext.TA_NAME,
p_ext.PA_ID,
p_ext.PA_Name,
p_ext.name as Portfolio,
p_ext.ID_NUMBER as INTERNAL_PORTFOLIO,
si.SCENARIO_CURRENCY,
deal.INS_TYPE,
ins.NAME as INSTRUMENT_NAME,
r.EXTRACTION_ID,
       r.START_DATE,
       r.END_DATE,
       r.CURRENCY_ID,
       c.name as CURRENCY_NAME,
        CASE
                    WHEN P_ext.Pnl_Logic = 'Rest of current Year'
                    THEN
                       CASE
                          -- Realized value for cash legs in past months
                          WHEN     R.SETTLEMENT_TYPE = 1
                               AND R.START_DATE <=NEXT_YEAR
                          THEN
                             R.total_VALUE
                          WHEN     R.SETTLEMENT_TYPE = 2
                               AND deal.TOOLSET = 36
                               AND R.START_DATE <=NEXT_YEAR
                          THEN
                            R.UNREALIZED_VALUE
                          WHEN     R.SETTLEMENT_TYPE = 2
                               AND R.START_DATE <=NEXT_YEAR
                          THEN
                             R.total_VALUE
                          ELSE
                             0.0 
                       END
                    WHEN (    deal.INTERNAL_LENTITY IN (20005, 20451, 20487)
                          AND deal.TOOLSET = 36
                          AND R.SETTLEMENT_TYPE = 2
                          AND EOMONTH (R.START_DATE) <= EOMONTH (d.SYSTEM_DATE))
                    THEN
                       CAST (r.UNREALIZED_VALUE AS FLOAT)
                    ELSE
                       CAST (r.TOTAL_VALUE AS FLOAT)
                 END
             AS TOTAL_VALUE,
        CASE
                    WHEN (    deal.INTERNAL_LENTITY IN (20005, 20451, 20487)
                          AND deal.TOOLSET = 36
                          AND R.SETTLEMENT_TYPE = 2
                          AND EOMONTH (R.START_DATE) <= EOMONTH (d.SYSTEM_DATE))
                    THEN
                       0.00
                    ELSE
                       r.REALIZED_VALUE
                 END
             AS REALIZED_VALUE,
       	CASE
             WHEN P_ext.Pnl_Logic = 'Rest of current Year'
             THEN
                CASE
                   WHEN R.START_DATE <= NEXT_YEAR
                   THEN
                      R.UNREALIZED_VALUE
                   ELSE
                      0.0
                END
             ELSE
                r.UNREALIZED_VALUE
          END
             AS UNREALIZED_VALUE,

       CASE 
            WHEN
		(convert(CHAR(7),(d.system_date)) > convert(CHAR(7),(r.end_date))) Then
       		fx.FX_Multiplicator
            WHEN
		r.total_value =0.0 THEN 1.0
            ELSE
       		r.base_total_value / r.total_value
	  END as FX_To_Use,
	  	  CASE 
            WHEN
		(convert(CHAR(7),(d.system_date)) > convert(CHAR(7),(r.end_date))) Then
       		   FX2.FX_MULTIPLICATOR
            ELSE
       			1/FX_Spot.FX_RATE_MID
	  END as FX_To_USD_From_deal
	
 from endur.view_union_raw_pnl_detail_res r
    INNER JOIN endur.view_union_deal_attributes deal on (deal.extraction_id=r.extraction_id and deal.deal_num=r.deal_num AND deal.INS_TYPE NOT IN (1000015, 48025) )
    INNER JOIN endur.view_union_deal_leg_attributes leg on (leg.extraction_id=r.extraction_id and leg.deal_num=r.deal_num and leg.param_seq_num=r.deal_leg)
  INNER JOIN endur.view_union_extraction_log l WITH(NOLOCK) on (l.extraction_id=r.extraction_id and  l.SCENARIO_SEQ_NUM = 1 and l.run_type=1 and l.SYSTEM_DATE=@pnlDate )
   inner join dates d  WITH(NOLOCK)on(d.system_date=l.system_date and d.EXTRACTION_ID=l.EXTRACTION_ID)
   inner join endur.view_reporting_dates rep_dat WITH(NOLOCK) on rep_dat.date=l.SYSTEM_DATE
      inner JOIN endur.vw_portfolio_extended_dated p_ext on (p_ext.id_number = l.PFOLIO and p_ext.date=l.system_date)
    inner JOIN endur.view_union_scenario_info si ON (si.extraction_id = l.extraction_id)  /* this is to be able to find the base_currency */
    inner JOIN endur.vw_CURRENCY C on (C.ID_NUMBER=r.currency_ID)
    inner JOIN endur.vw_settle_type stype on (stype.id_number = r.settlement_type)
    inner JOIN endur.vw_toolsets tool on (tool.id_number = deal.toolset)
    inner JOIN endur.vw_trans_status tstatus on (tstatus.trans_status_id = r.tran_status)
    LEFT JOIN endur.view_union_gas_phys_location loc on (loc.LOCATION_ID=leg.FIN_LOCATION_ID and loc.valid_from<=l.system_date and loc.valid_to>=l.system_date)
 	inner JOIN endur.GDM_FX_MONTH_AVG_VIEW FX on (FX.fx_from = c.name and FX_To = si.SCENARIO_CURRENCY and FX_Date=DATEADD(month, DATEDIFF(month, 0, r.END_DATE), 0))
    inner JOIN endur.GDM_FX_MONTH_AVG_VIEW FX2 on (FX2.fx_from = c.name and FX2.FX_To = 'USD' and FX2.FX_DATE = DATEADD(month, DATEDIFF(month, 0, r.END_DATE), 0))
	LEFT JOIN endur.vw_idx_historical_fx_rates FX_Spot on (FX_spot.FX_RATE_DATE=l.SYSTEM_DATE and FX_Spot.CURRENCY_ID=c.id_number)
	LEFT JOIN endur.vw_idx_unit idx on (idx.UNIT_ID=leg.UNIT)
	LEFT JOIN endur.vw_idx_unit idxp on (idxp.UNIT_ID=leg.PRICE_UNIT)
	inner JOIN endur.vw_instruments ins on (ins.ID_NUMBER=deal.INS_TYPE)
    WHERE    
 /* Excluding books marked as not going to BW - swing and MAR East and the book for holding the deals used for the refernce index */
         not (    L.PFOLIO IN (20268,20233,20307,20234) AND deal.INS_TYPE IN (48605, 48610)) /*Exclude cpacity from 4 old SUP books */
           /* Exclude Instructions and CTL's   */
  		and r.end_date >= d.HIST_CUT_OFF
		 and r.end_date < d.FUT_CUT_OFF
		  and r.end_date >= d.PREV_MONTH
		 -- AND deal.INS_TYPE NOT IN (1000015, 48025)
		  	 
UNION all

select
'R' source,
r.deal_num,
r.cflow_type,
rep_dat.reporting_date,
d.SYSTEM_DATE,
IIF((P_Ext.BW_Exclude IS NULL OR P_Ext.BW_Exclude = 0),'Yes','No') as In_Official_PnL,
l.pfolio as portfolio_id,
p_ext.BU_ID,
p_ext.BU_NAME,
p_ext.TA_ID,
p_ext.TA_NAME,
p_ext.PA_ID,
p_ext.PA_Name,
p_ext.name as Portfolio,
p_ext.ID_NUMBER as INTERNAL_PORTFOLIO,
si.SCENARIO_CURRENCY,
r.INS_TYPE,
ins.NAME as INSTRUMENT_NAME,
r.EXTRACTION_ID,
       r.START_DATE,
       r.END_DATE,
       r.CURRENCY_ID,
       c.name as CURRENCY_NAME,
        CASE
                    WHEN P_ext.Pnl_Logic = 'Rest of current Year'
                    THEN
                       CASE
                          -- Realized value for cash legs in past months
                          WHEN     R.SETTLEMENT_TYPE = 1
                               AND R.START_DATE <=NEXT_YEAR
                          THEN
                             R.total_VALUE
                          WHEN     R.SETTLEMENT_TYPE = 2
                               AND r.TOOLSET = 36
                               AND R.START_DATE <=NEXT_YEAR
                          THEN
                            R.UNREALIZED_VALUE
                          WHEN     R.SETTLEMENT_TYPE = 2
                               AND R.START_DATE <=NEXT_YEAR
                          THEN
                             R.total_VALUE
                          ELSE
                             0.0 
                       END
                    WHEN (    r.INTERNAL_LENTITY IN (20005, 20451, 20487)
                          AND r.TOOLSET = 36
                          AND r.SETTLEMENT_TYPE = 2
                          AND EOMONTH (R.START_DATE) <= EOMONTH (d.SYSTEM_DATE))
                    THEN
                       CAST (r.UNREALIZED_VALUE AS FLOAT)
                    ELSE
                       CAST (r.TOTAL_VALUE AS FLOAT)
                 END
             AS TOTAL_VALUE,
        CASE
                    WHEN (   r.INTERNAL_LENTITY IN (20005, 20451, 20487)
                          AND r.TOOLSET = 36
                          AND R.SETTLEMENT_TYPE = 2
                          AND EOMONTH (R.START_DATE) <= EOMONTH (d.SYSTEM_DATE))
                    THEN
                       0.00
                    ELSE
                       r.REALIZED_VALUE
                 END
             AS REALIZED_VALUE,
       	CASE
             WHEN P_ext.Pnl_Logic = 'Rest of current Year'
             THEN
                CASE
                   WHEN R.START_DATE <= NEXT_YEAR
                   THEN
                      R.UNREALIZED_VALUE
                   ELSE
                      0.0
                END
             ELSE
                r.UNREALIZED_VALUE
          END
             AS UNREALIZED_VALUE,
       CASE 
            WHEN
		(convert(CHAR(7),(d.system_date)) > convert(CHAR(7),(r.end_date))) Then
       		fx.FX_Multiplicator
            WHEN
		r.total_value =0.0 THEN 1.0
            ELSE
       		r.base_total_value / r.total_value
	  END as FX_To_Use,
	  	  CASE 
            WHEN
		(convert(CHAR(7),(d.system_date)) > convert(CHAR(7),(r.end_date))) Then
       		   FX2.FX_MULTIPLICATOR
            ELSE
       			1/FX_Spot.FX_RATE_MID
	  END as FX_To_USD_From_deal
from  (select * from
endur.view_union_pnl_realized  WITH(NOLOCK)where valid_from<=@pnlDate and valid_to >=@pnlDate AND INS_TYPE NOT IN (1000015, 48025) ) r
	INNER JOIN endur.view_union_extraction_log l WITH(NOLOCK) on (l.extraction_id=r.extraction_id and  l.SCENARIO_SEQ_NUM = 1 and l.run_type=1 )
	inner join dates d  WITH(NOLOCK)on(d.PFOLIO=l.PFOLIO)
	inner join endur.view_reporting_dates rep_dat  WITH(NOLOCK)on rep_dat.date=d.SYSTEM_DATE
	inner JOIN endur.vw_instruments ins on (ins.ID_NUMBER=r.INS_TYPE)
	LEFT JOIN endur.vw_portfolio_extended_dated p_ext  WITH(NOLOCK)on (p_ext.id_number = l.PFOLIO and p_ext.date=d.system_date)
    LEFT JOIN endur.view_union_scenario_info si  WITH(NOLOCK)ON (si.extraction_id = d.EXTRACTION_ID)  /* this is to be able to find the base_currency */
    LEFT JOIN endur.vw_CURRENCY C  WITH(NOLOCK)on (C.ID_NUMBER=r.currency_ID)
	LEFT JOIN endur.view_union_gas_phys_location loc  WITH(NOLOCK)on (loc.LOCATION_ID=r.FIN_LOCATION_ID and loc.valid_from<=d.system_date and loc.valid_to>=d.system_date)
	LEFT JOIN endur.GDM_FX_MONTH_AVG_VIEW FX  WITH(NOLOCK)on (FX.fx_from = c.name and FX_To = si.SCENARIO_CURRENCY and FX_Date=DATEADD(month, DATEDIFF(month, 0, r.END_DATE), 0))
    LEFT JOIN endur.GDM_FX_MONTH_AVG_VIEW FX2  WITH(NOLOCK)on (FX2.fx_from = c.name and FX2.FX_To = 'USD' and FX2.FX_DATE = DATEADD(month, DATEDIFF(month, 0, r.END_DATE), 0))
	LEFT JOIN endur.vw_idx_historical_fx_rates FX_Spot  WITH(NOLOCK)on (FX_spot.FX_RATE_DATE=d.SYSTEM_DATE and FX_Spot.CURRENCY_ID=c.id_number) 
	LEFT JOIN endur.vw_idx_unit idx  WITH(NOLOCK)on (idx.UNIT_ID=r.UNIT)
	LEFT JOIN endur.vw_idx_unit idxp  WITH(NOLOCK)on (idxp.UNIT_ID=r.PRICE_UNIT)
    WHERE  not (    L.PFOLIO IN (20268,20233,20307,20234) AND r.INS_TYPE IN (48605, 48610)) /*Exclude cpacity from 4 old SUP books */
        /* Exclude Instructions and CTL's   */
  		  and r.end_date >= d.HIST_CUT_OFF
		  and r.end_date < d.FUT_CUT_OFF
		  and r.end_date < d.PREV_MONTH
		 
GO
