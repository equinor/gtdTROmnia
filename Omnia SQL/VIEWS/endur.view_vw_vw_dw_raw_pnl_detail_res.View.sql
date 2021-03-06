/****** Object:  View [endur].[view_vw_vw_dw_raw_pnl_detail_res]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [endur].[view_vw_vw_dw_raw_pnl_detail_res]
AS
select 
r.[EXTRACTION_ID],
	r.[RUN_TYPE], 
	[RESULT_TYPE],
	[DEAL_NUM]  ,
	[TRAN_NUM]  ,
	[DEAL_LEG]  ,
	[DEAL_LEG_1]  ,
	[DEAL_PDC]  ,
	[INS_SEQ_NUM]  ,
	[PRICE_BAND]  ,
	[PRICE_BAND_SEQ_NUM]  ,
	[COMM_OPT_EXERCISED_FLAG]  ,
	[CFLOW_TYPE]  ,
	[BROKER_FEE_TYPE]  ,
	[START_DATE]  ,
	[END_DATE]  ,
	[RATE_DTMN_DATE]  ,
	[PYMT_DATE]  ,
	[CURRENCY_ID]  ,
	[SETTLEMENT_TYPE]  ,
	[VOLUME]  ,
	[PRICE]  ,
	[STRIKE]  ,
	[PYMT]  ,
	[TOTAL_VALUE]  ,
	[BASE_TOTAL_VALUE]  ,
	[REALIZED_VALUE]  ,
	[UNREALIZED_VALUE]  ,
	[DF]  ,
	[TRAN_STATUS]  ,
	[RATE_STATUS]  ,
	[NEW_DEAL]  ,
	[INS_SOURCE_ID]  ,
	[EVENT_SOURCE_ID]  ,
	r.[DB_TIMESTAMP]  
	from endur.vw_vw_dw_raw_pnl_detail_res r
	INNER JOIN endur.vw_dw_extraction_log l on (l.EXTRACTION_ID=r.EXTRACTION_ID and l.DB_STATUS=1 and l.RUN_TYPE=1 and l.SCENARIO_SEQ_NUM=1)
	where r.END_DATE < DATEADD(month, DATEDIFF(month, 0,l.system_date)-1, 0)
	and l.system_date = (select max(system_date) from endur.vw_dw_extraction_log l2 where l2.DB_STATUS=1 and l2.RUN_TYPE=1 and l2.SCENARIO_SEQ_NUM=1)

GO
