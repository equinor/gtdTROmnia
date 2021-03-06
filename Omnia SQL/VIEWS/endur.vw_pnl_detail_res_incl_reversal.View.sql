/****** Object:  View [endur].[vw_pnl_detail_res_incl_reversal]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


















CREATE VIEW [endur].[vw_pnl_detail_res_incl_reversal]
AS
with
 extract_log as (
select *,dateadd(mm,12,(dateadd(year,datediff(yyyy,0,system_date),0))) NEXT_YEAR, dateadd(mm,-3,(dateadd(year,datediff(yyyy,0,system_date),0))) HIST_CUT_OFF, dateadd(mm,48,(dateadd(year,datediff(yyyy,0,system_date),0))) FUT_CUT_OFF,DATEADD(month, DATEDIFF(month, 0, system_date)-1, 0)  PREV_MONTH
from endur.vw_dw_extraction_log where SCENARIO_SEQ_NUM = 1 and run_type=1 and system_date= (select max(system_date) from  endur.vw_dw_extraction_log l2 where l2.RUN_TYPE=1 and l2.DB_STATUS=1 and l2.SCENARIO_SEQ_NUM=1))

select
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
deal.INTERNAL_LENTITY,
deal.EXTERNAL_LENTITY,
deal.INS_TYPE,
ins.NAME as INSTRUMENT_NAME,
deal.INT_EXT,
l.SYSTEM_DATE,
r.EXTRACTION_ID,
       r.RUN_TYPE,
       r.RESULT_TYPE,
       r.DEAL_NUM,
       r.TRAN_NUM,
       r.DEAL_LEG,
       r.DEAL_LEG_1,
       r.DEAL_PDC,
       r.INS_SEQ_NUM,
       r.PRICE_BAND,
       r.PRICE_BAND_SEQ_NUM,
    
       r.CFLOW_TYPE,
       r.BROKER_FEE_TYPE,
       r.START_DATE,
       r.END_DATE,
       r.CURRENCY_ID,
       c.name as CURRENCY_NAME,
       r.SETTLEMENT_TYPE,
       r.VOLUME,
       r.PRICE,
       r.STRIKE,
       r.PYMT,
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
                          AND EOMONTH (R.START_DATE) <= EOMONTH (L.SYSTEM_DATE))
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
                          AND EOMONTH (R.START_DATE) <= EOMONTH (L.SYSTEM_DATE))
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
       r.DF,
       r.TRAN_STATUS,
       CASE 
            WHEN
		(convert(CHAR(7),(l.system_date)) > convert(CHAR(7),(r.end_date))) Then
       		fx.FX_Multiplicator
            WHEN
		r.total_value =0.0 THEN 1.0
            ELSE
       		r.base_total_value / r.total_value
	  END as FX_To_Use,
	  	  CASE 
            WHEN
		(convert(CHAR(7),(l.system_date)) > convert(CHAR(7),(r.end_date))) Then
       		   FX2.FX_MULTIPLICATOR
            ELSE
       			1/FX_Spot.FX_RATE_MID
	  END as FX_To_USD_From_deal,
	  leg.fin_location_id,
	  loc.location_name,
	  case  leg.FIN_DEL_REC when 1 then 'DEL' else 'REC' end as FIN_DEL_REC,
	  leg.NOTNL,
	  leg.ORG_FX,
	  leg.PRICE_UNIT,
	  idxp.unit_label as Price_Unit_Name,
	  case idxp.unit_type_id when 0 then 'NONE' when 1 then 'Mass' when 2 then 'Volume' when 3 then 'Energy' when 4 then 'Currency' else 'Time' end as Price_Unit_Type,
	  case leg.FX_FLT when 0 then 'FLOAT' else 'FIXED' end as FIXED_FLOAT,
	  CASE leg.SETTLEMENT_TYPE when 1 then'Cash Settlement' else 'Physical Settlement' end as Settlemt_Type,
	  leg.UNIT,
	  idx.UNIT_LABEL as Volume_Unit_Name,
	  case idx.unit_type_id when 0 then 'NONE' when 1 then 'Mass' when 2 then 'Volume' when 3 then 'Energy' when 4 then 'Currency' else 'Time' end as Volume_Unit_Type

  from endur.vw_vw_dw_raw_pnl_detail_res r
    INNER JOIN endur.vw_user_dw_deal_attributes deal on (deal.extraction_id=r.extraction_id and deal.deal_num=r.deal_num )
    INNER JOIN endur.vw_user_dw_deal_leg_attributes leg on (leg.extraction_id=r.extraction_id and leg.deal_num=r.deal_num and leg.param_seq_num=r.deal_leg)
   INNER JOIN extract_log l on (l.extraction_id=r.extraction_id)

    inner JOIN endur.vw_portfolio_extended p_ext on (p_ext.id_number = l.PFOLIO)
    LEFT JOIN endur.vw_user_dw_scenario_info si ON (si.extraction_id = l.extraction_id)  /* this is to be able to find the base_currency */
    LEFT JOIN endur.vw_CURRENCY C on (C.ID_NUMBER=r.currency_ID)
    LEFT JOIN endur.vw_settle_type stype on (stype.id_number = r.settlement_type)
    LEFT JOIN endur.vw_toolsets tool on (tool.id_number = deal.toolset)
    LEFT JOIN endur.vw_trans_status tstatus on (tstatus.trans_status_id = r.tran_status)
    LEFT JOIN endur.vw_gas_phys_location loc on (loc.LOCATION_ID=leg.FIN_LOCATION_ID)
 	LEFT JOIN endur.GDM_FX_MONTH_AVG_VIEW FX on (FX.fx_from = c.name and FX_To = si.SCENARIO_CURRENCY and FX_Date=DATEADD(month, DATEDIFF(month, 0, r.END_DATE), 0))
    LEFT JOIN endur.GDM_FX_MONTH_AVG_VIEW FX2 on (FX2.fx_from = c.name and FX2.FX_To = 'USD' and FX2.FX_DATE = DATEADD(month, DATEDIFF(month, 0, r.END_DATE), 0))
	LEFT JOIN endur.vw_idx_historical_fx_rates FX_Spot on (FX_spot.FX_RATE_DATE=l.SYSTEM_DATE and FX_Spot.CURRENCY_ID=c.id_number)
	LEFT JOIN endur.vw_idx_unit idx on (idx.UNIT_ID=leg.UNIT)
	LEFT JOIN endur.vw_idx_unit idxp on (idxp.UNIT_ID=leg.PRICE_UNIT)
	LEFT JOIN endur.vw_instruments ins on (ins.ID_NUMBER=deal.INS_TYPE)
    WHERE     r.run_type = 1
    	 -- AND (P_Ext.BW_Exclude IS NULL OR P_Ext.BW_Exclude = 0) /* Excluding books marked as not going to BW - swing and MAR East and the book for holding the deals used for the refernce index */
         -- AND NOT (    L.PFOLIO IN (20268,20233,20307,20234) AND deal.INS_TYPE IN (48605, 48610)) /*Exclude cpacity from 4 old SUP books */
          AND deal.INS_TYPE NOT IN (1000015, 48025) /* Exclude Instructions and CTL's   */
  		  and r.end_date >= l.HIST_CUT_OFF
		  and r.end_date < l.FUT_CUT_OFF
		  and r.end_date >= l.PREV_MONTH

UNION all

select
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
deal.INTERNAL_LENTITY,
deal.EXTERNAL_LENTITY,
deal.INS_TYPE,
ins.NAME as INSTRUMENT_NAME,
deal.INT_EXT,
l.SYSTEM_DATE,
r.EXTRACTION_ID,
       r.RUN_TYPE,
       r.RESULT_TYPE,
       r.DEAL_NUM,
       r.TRAN_NUM,
       r.DEAL_LEG,
       r.DEAL_LEG_1,
       r.DEAL_PDC,
       r.INS_SEQ_NUM,
       r.PRICE_BAND,
       r.PRICE_BAND_SEQ_NUM,
       r.CFLOW_TYPE,
       r.BROKER_FEE_TYPE,
       r.START_DATE,
       r.END_DATE,
       r.CURRENCY_ID,
       c.name as CURRENCY_NAME,
       r.SETTLEMENT_TYPE,
       r.VOLUME,
       r.PRICE,
       r.STRIKE,
       r.PYMT,
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
                          AND leg.SETTLEMENT_TYPE = 2
                          AND EOMONTH (R.START_DATE) <= EOMONTH (L.SYSTEM_DATE))
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
                          AND EOMONTH (R.START_DATE) <= EOMONTH (L.SYSTEM_DATE))
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
       r.DF,
       r.TRAN_STATUS,
     
       CASE 
            WHEN
		(convert(CHAR(7),(l.system_date)) > convert(CHAR(7),(r.end_date))) Then
       		fx.FX_Multiplicator
            WHEN
		r.total_value =0.0 THEN 1.0
            ELSE
       		r.base_total_value / r.total_value
	  END as FX_To_Use,
	  	  CASE 
            WHEN
		(convert(CHAR(7),(l.system_date)) > convert(CHAR(7),(r.end_date))) Then
       		   FX2.FX_MULTIPLICATOR
            ELSE
       			1/FX_Spot.FX_RATE_MID
	  END as FX_To_USD_From_deal,
	  leg.fin_location_id,
	  loc.location_name,
	  case  leg.FIN_DEL_REC when 1 then 'DEL' else 'REC' end as FIN_DEL_REC,
	  leg.NOTNL,
	  leg.ORG_FX,
	  leg.PRICE_UNIT,
	  idxp.unit_label as Price_Unit_Name,
	  case idxp.unit_type_id when 0 then 'NONE' when 1 then 'Mass' when 2 then 'Volume' when 3 then 'Energy' when 4 then 'Currency' else 'Time' end as Price_Unit_Type,
	  case leg.FX_FLT when 0 then 'FLOAT' else 'FIXED' end as FIXED_FLOAT,
	  CASE leg.SETTLEMENT_TYPE when 1 then'Cash Settlement' else 'Physical Settlement' end as Settlemt_Type,
	  leg.UNIT,
	  idx.UNIT_LABEL as Volume_Unit_Name,
	  case idx.unit_type_id when 0 then 'NONE' when 1 then 'Mass' when 2 then 'Volume' when 3 then 'Energy' when 4 then 'Currency' else 'Time' end as Volume_Unit_Type
      

  from endur.vw_pnl_realized r
  	inner join endur.view_hist_curr_extration_id_mapping hl on (r.EXTRACTION_ID=hl.HIST_EXTRACTION_ID)
	INNER JOIN extract_log l on (l.extraction_id=hl.extraction_id)
    left JOIN endur.vw_user_dw_deal_attributes deal on (deal.extraction_id=l.extraction_id and deal.deal_num=r.deal_num )
    left JOIN endur.vw_user_dw_deal_leg_attributes leg on (leg.extraction_id=l.extraction_id and leg.deal_num=r.deal_num and leg.param_seq_num=r.deal_leg)
    LEFT JOIN endur.vw_portfolio_extended p_ext on (p_ext.id_number = l.PFOLIO)
    LEFT JOIN endur.vw_user_dw_scenario_info si ON (si.extraction_id = l.EXTRACTION_ID)  /* this is to be able to find the base_currency */
    LEFT JOIN endur.vw_CURRENCY C on (C.ID_NUMBER=r.currency_ID)
	LEFT JOIN endur.vw_gas_phys_location loc on (loc.LOCATION_ID=leg.FIN_LOCATION_ID)
	LEFT JOIN endur.GDM_FX_MONTH_AVG_VIEW FX on (FX.fx_from = c.name and FX_To = si.SCENARIO_CURRENCY and FX_Date=DATEADD(month, DATEDIFF(month, 0, r.END_DATE), 0))
    LEFT JOIN endur.GDM_FX_MONTH_AVG_VIEW FX2 on (FX2.fx_from = c.name and FX2.FX_To = 'USD' and FX2.FX_DATE = DATEADD(month, DATEDIFF(month, 0, r.END_DATE), 0))
	LEFT JOIN endur.vw_idx_historical_fx_rates FX_Spot on (FX_spot.FX_RATE_DATE=l.SYSTEM_DATE and FX_Spot.CURRENCY_ID=c.id_number) 
	LEFT JOIN endur.vw_idx_unit idx on (idx.UNIT_ID=leg.UNIT)
	LEFT JOIN endur.vw_idx_unit idxp on (idxp.UNIT_ID=leg.PRICE_UNIT)
	LEFT JOIN endur.vw_instruments ins on (ins.ID_NUMBER=deal.INS_TYPE)
    WHERE     r.run_type = 1

    	--  AND (P_Ext.BW_Exclude IS NULL OR P_Ext.BW_Exclude = 0) /* Excluding books marked as not going to BW - swing and MAR East and the book for holding the deals used for the refernce index */
        --  AND NOT (    L.PFOLIO IN (20268,20233,20307,20234) AND deal.INS_TYPE IN (48605, 48610)) /*Exclude cpacity from 4 old SUP books */
          AND deal.INS_TYPE NOT IN (1000015, 48025) /* Exclude Instructions and CTL's   */
  		  and r.end_date >= l.HIST_CUT_OFF
		  and r.end_date < l.FUT_CUT_OFF
		  and r.end_date < l.PREV_MONTH

GO
