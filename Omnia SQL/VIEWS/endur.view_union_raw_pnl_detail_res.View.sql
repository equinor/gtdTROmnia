/****** Object:  View [endur].[view_union_raw_pnl_detail_res]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [endur].[view_union_raw_pnl_detail_res]

AS
SELECT        a.[EXTRACTION_ID]
      ,a.[RUN_TYPE]
      ,a.[RESULT_TYPE]
      ,a.[DEAL_NUM]
      ,a.[TRAN_NUM]
      ,a.[DEAL_LEG]
      ,a.[DEAL_LEG_1]
      ,a.[DEAL_PDC]
      ,a.[INS_SEQ_NUM]
      ,a.[PRICE_BAND]
      ,a.[PRICE_BAND_SEQ_NUM]
      ,a.[COMM_OPT_EXERCISED_FLAG]
      ,a.[CFLOW_TYPE]
      ,a.[BROKER_FEE_TYPE]
      ,a.[START_DATE]
      ,a.[END_DATE]
      ,a.[RATE_DTMN_DATE]
      ,a.[PYMT_DATE]
      ,a.[CURRENCY_ID]
      ,a.[SETTLEMENT_TYPE]
      ,a.[VOLUME]
      ,a.[PRICE]
      ,a.[STRIKE]
      ,a.[PYMT]
      ,a.[TOTAL_VALUE]
      ,a.[REALIZED_VALUE]
      ,a.[UNREALIZED_VALUE]
      ,a.[BASE_TOTAL_VALUE]
      ,a.[BASE_REALIZED_VALUE]
      ,a.[BASE_UNREALIZED_VALUE]
      ,a.[DF]
      ,a.[TRAN_STATUS]
      ,a.[RATE_STATUS]
      ,a.[YEST_PYMT]
      ,a.[YEST_TOTAL_VALUE]
      ,a.[YEST_REALIZED_VALUE]
      ,a.[YEST_UNREALIZED_VALUE]
      ,a.[YEST_BASE_TOTAL_VALUE]
      ,a.[YEST_BASE_REALIZED_VALUE]
      ,a.[YEST_BASE_UNREALIZED_VALUE]
      ,a.[CHANGE_IN_TOT_PNL]
      ,a.[YEST_TRAN_STATUS]
      ,a.[NEW_DEAL]
      ,a.[INS_SOURCE_ID]
      ,a.[EVENT_SOURCE_ID]
      ,a.[DB_TIMESTAMP], '9999-12-31' AS VALID_TO
FROM            endur.vw_vw_dw_raw_pnl_detail_res a inner join endur.view_union_extraction_log b on a.extraction_id=b.extraction_id and b.DB_STATUS<>2
UNION all
SELECT       a.[EXTRACTION_ID]
      ,a.[RUN_TYPE]
      ,a.[RESULT_TYPE]
      ,a.[DEAL_NUM]
      ,a.[TRAN_NUM]
      ,a.[DEAL_LEG]
      ,a.[DEAL_LEG_1]
      ,a.[DEAL_PDC]
      ,a.[INS_SEQ_NUM]
      ,a.[PRICE_BAND]
      ,a.[PRICE_BAND_SEQ_NUM]
      ,a.[COMM_OPT_EXERCISED_FLAG]
      ,a.[CFLOW_TYPE]
      ,a.[BROKER_FEE_TYPE]
      ,a.[START_DATE]
      ,a.[END_DATE]
      ,a.[RATE_DTMN_DATE]
      ,a.[PYMT_DATE]
      ,a.[CURRENCY_ID]
      ,a.[SETTLEMENT_TYPE]
      ,a.[VOLUME]
      ,a.[PRICE]
      ,a.[STRIKE]
      ,a.[PYMT]
      ,a.[TOTAL_VALUE]
      ,a.[REALIZED_VALUE]
      ,a.[UNREALIZED_VALUE]
      ,a.[BASE_TOTAL_VALUE]
      ,a.[BASE_REALIZED_VALUE]
      ,a.[BASE_UNREALIZED_VALUE]
      ,a.[DF]
      ,a.[TRAN_STATUS]
      ,a.[RATE_STATUS]
      ,a.[YEST_PYMT]
      ,a.[YEST_TOTAL_VALUE]
      ,a.[YEST_REALIZED_VALUE]
      ,a.[YEST_UNREALIZED_VALUE]
      ,a.[YEST_BASE_TOTAL_VALUE]
      ,a.[YEST_BASE_REALIZED_VALUE]
      ,a.[YEST_BASE_UNREALIZED_VALUE]
      ,a.[CHANGE_IN_TOT_PNL]
      ,a.[YEST_TRAN_STATUS]
      ,a.[NEW_DEAL]
      ,a.[INS_SOURCE_ID]
      ,a.[EVENT_SOURCE_ID]
      ,a.[DB_TIMESTAMP]
	  ,a.[DB_TIMESTAMP_H]
FROM            endur.hist_vw_vw_dw_raw_pnl_detail_res a inner join endur.view_union_extraction_log b on a.extraction_id=b.extraction_id and b.DB_STATUS<>2
GO
