/****** Object:  View [endur].[vw_pnl_detail_res_LDLY_Org]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   VIEW [endur].[vw_pnl_detail_res_LDLY_Org]
AS
select
p_ext.BU_ID,
p_ext.BU_NAME,
p_ext.TA_ID,
p_ext.TA_NAME,
p_ext.PA_ID,
p_ext.PA_Name,
p_ext.name as Portfolio,
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
       r.COMM_OPT_EXERCISED_FLAG,
       r.CFLOW_TYPE,
       r.BROKER_FEE_TYPE,
       r.START_DATE,
       r.END_DATE,
       r.RATE_DTMN_DATE,
       r.PYMT_DATE,
       r.CURRENCY_ID,
       c.name as CURRENCY_NAME,
       r.SETTLEMENT_TYPE,
       stype.name as SETTLEMENT_TYPE_NAME,
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
                               AND R.START_DATE <=dateadd(mm,12,(dateadd(year,datediff(yyyy,0,l.system_date),0)))
                          THEN
                             R.total_VALUE
                          WHEN     R.SETTLEMENT_TYPE = 2
                               AND deal.TOOLSET = 36
                               AND R.START_DATE <=dateadd(mm,12,(dateadd(year,datediff(yyyy,0,l.system_date),0)))
                          THEN
                            R.UNREALIZED_VALUE
                          WHEN     R.SETTLEMENT_TYPE = 2
                               AND R.START_DATE <=dateadd(mm,12,(dateadd(year,datediff(yyyy,0,l.system_date),0)))
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
                   WHEN R.START_DATE <= dateadd(mm,12,(dateadd(year,datediff(yyyy,0,m.max_system_date),0)))  /* Changed system_date here */
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
	   tstatus.NAME as Tran_Status_Name,
       r.RATE_STATUS,
       r.NEW_DEAL,
       r.INS_SOURCE_ID,
       r.EVENT_SOURCE_ID,
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
      deal.TRAN_TYPE,   /* remove?  */
      deal.ASSET_TYPE,  /* remover? */
      deal.INS_NUM,
      deal.INS_TYPE,
      deal.INS_CLASS,
      deal.TOOLSET,
      tool.name as Toolset_Name,
      deal.BUY_SELL,
      deal.REFERENCE,
      deal.STRATEGY,
      deal.DEAL_CLASSIFICATION,
      deal.INT_EXT,
      deal.INTERNAL_BUNIT,
      deal.INTERNAL_LENTITY,
      deal.EXTERNAL_BUNIT,
      deal.EXTERNAL_LENTITY,
      deal.INTERNAL_PORTFOLIO,
      deal.EXTERNAL_PORTFOLIO,
      deal.INTERNAL_CONTACT,
      deal.EXTERNAL_CONTACT,
      deal.BOOK,
      deal.TRADE_DATE,
      deal.INPUT_DATE,
      deal.SETTLE_DATE,
      deal.POSITION,
      deal.PRICE as deal_price,
      deal.RATE,
      deal.CURRENCY,
      deal.VERSION_NUMBER,
      deal.PROCEEDS,
      deal.MVALUE,
      deal.LAST_UPDATE,
      deal.INS_SUB_TYPE,
      deal.BROKER_ID,
      deal.PERPETUAL_POS_DATE,
      deal.TRADE_TIME,
      deal.OFFSET_TRAN_NUM,
      deal.OFFSET_TRAN_TYPE,
      deal.ASSOCIATED_FX_JOURNAL,
      deal.TRADE_FLAG,
      deal.CURRENT_FLAG,
      deal.FX_YLD_BASIS_1,
      deal.FX_YLD_BASIS_2,
      deal.UNIT,
      deal.LOCK_TYPE,
      deal.IDX_GROUP,
      deal.IDX_SUBGROUP,
      deal.TEMPLATE_TRAN_NUM,
      deal.OTC_CLEARING_BROKER_ID,
      deal.PORTFOLIO_GROUP_ID,
      deal.BASE_INS_ID,
      deal.INCLUDE_IN_DW,
	  CASE 
	    WHEN
		deal.PEGAS_FUTURE ='' THEN 'No'
            ELSE
	        deal.PEGAS_FUTURE
	    END as PEGAS_FUTURE,
      deal.DB_TIMESTAMP,
      si.SCENARIO_CURRENCY,
	  leg.fin_location_id,
	  loc.LOCATION_NAME AS Fin_Location_Name
  from endur.hist_vw_vw_dw_raw_pnl_detail_res r
    INNER JOIN endur.hist_vw_user_dw_deal_attributes deal on (deal.extraction_id=r.extraction_id and deal.deal_num=r.deal_num )
    INNER JOIN endur.hist_vw_user_dw_deal_leg_attributes leg on (leg.extraction_id=r.extraction_id and leg.deal_num=r.deal_num and leg.param_seq_num=r.deal_leg)
    INNER JOIN endur.hist_vw_dw_extraction_log l on (l.extraction_id=r.extraction_id AND L.SCENARIO_SEQ_NUM = 1 and l.run_type=1)
    LEFT JOIN endur.vw_portfolio_extended p_ext on (p_ext.id_number = deal.internal_portfolio)
    LEFT JOIN endur.hist_vw_user_dw_scenario_info si ON (si.extraction_id = l.extraction_id)  /* this is to be able to find the base_currency */
    LEFT JOIN endur.vw_CURRENCY C on (C.ID_NUMBER=r.currency_ID)
    LEFT JOIN endur.vw_settle_type stype on (stype.id_number = r.settlement_type)
    LEFT JOIN endur.vw_toolsets tool on (tool.id_number = deal.toolset)
    LEFT JOIN endur.vw_trans_status tstatus on (tstatus.trans_status_id = r.tran_status)
    LEFT JOIN endur.vw_gas_phys_location loc on (loc.LOCATION_ID=leg.FIN_LOCATION_ID)
    LEFT JOIN endur.GDM_FX_MONTH_AVG_VIEW FX on (FX.fx_from = c.name and FX_To = si.SCENARIO_CURRENCY and convert(CHAR(7),(FX_Date)) = convert(CHAR(7),(r.start_date)))
    LEFT JOIN endur.GDM_FX_MONTH_AVG_VIEW FX2 on (FX2.fx_from = c.name and FX2.FX_To = 'USD' and convert(CHAR(7),(FX2.FX_DATE)) = convert(CHAR(7),(r.start_date)))
	LEFT JOIN endur.vw_idx_historical_fx_rates FX_Spot on (FX_spot.FX_RATE_DATE=l.SYSTEM_DATE and FX_Spot.CURRENCY_ID=c.id_number) 
	left join endur.max_system_date m on (1=1)
    WHERE     r.run_type = 1
		  AND l.DB_STATUS=1
		  and l.SCENARIO_SEQ_NUM=1
		  AND (P_Ext.BW_Exclude IS NULL OR P_Ext.BW_Exclude = 0) /* Excluding books marked as not going to BW - swing and MAR East and the book for holding the deals used for the refernce index */
          AND NOT (    L.PFOLIO IN (20268,20233,20307,20234) AND deal.INS_TYPE IN (48605, 48610)) /*Exclude cpacity from 4 old SUP books */
          AND deal.INS_TYPE NOT IN (1000015, 48025) /* Exclude Instructions and CTL's   */
          /*AND NOT (    R.DEAL_NUM = 1265156  AND R.CFLOW_TYPE = 138 AND DATEDIFF(day,r.end_date,r.start_date) >31) */
  		  and r.end_date >= dateadd(mm,-3,(dateadd(year,datediff(yyyy,0,m.max_system_date ),0)))
		  and r.end_date <  dateadd(mm,48,(dateadd(year,datediff(yyyy,0,m.max_system_date),0)))   
		  and l.SYSTEM_DATE= (select max(sd.date) from dbo.BW_STOREDATES sd where sd.date < dateadd(yyyy,0,(dateadd(year,datediff(yyyy,0,
		  m.max_system_date),0))))

GO
