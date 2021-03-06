/****** Object:  View [endur].[view_union_pnl_usdr]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [endur].[view_union_pnl_usdr]
as
SELECT a.[EXTRACTION_ID]
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
      ,a.[CFLOW_TYPE]
      ,a.[BROKER_FEE_TYPE]
      ,a.[START_DATE]
      ,a.[END_DATE]
      ,a.[CURRENCY_ID]

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
       ,b.[INS_NUM]
      ,b.[INS_TYPE]
      ,b.[TOOLSET]
      ,b.[BUY_SELL]
      ,b.[REFERENCE]
      ,b.[INT_EXT]
      ,b.[INTERNAL_LENTITY]
      ,b.[EXTERNAL_LENTITY]
      ,b.[INTERNAL_PORTFOLIO]

      ,c.[FIN_DEL_REC]
      ,c.[FIN_LOCATION_ID]
  
      ,c.[PRICE_UNIT]
      ,c.[ORG_FX]
      ,c.[UNIT]
      ,c.[SETTLEMENT_TYPE]
      ,c.[NOTNL]
      ,c.[FX_FLT]
      ,a.[DB_TIMESTAMP]
  FROM [endur].[vw_vw_dw_raw_pnl_detail_res] a
  inner join [endur].[vw_user_dw_deal_attributes] b on (a.EXTRACTION_ID=b.EXTRACTION_ID and a.DEAL_NUM=b.deal_num )
  inner join[endur].[vw_user_dw_deal_leg_attributes] c on (a.EXTRACTION_ID=c.EXTRACTION_ID and a.DEAL_NUM=c.deal_num  and c.param_seq_num=a.deal_leg)
 -- inner join endur.view_union_extraction_log d on a.extraction_id=d.extraction_id and d.DB_STATUS<>2
  union
  SELECT a.[EXTRACTION_ID]
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
      ,a.[CFLOW_TYPE]
      ,a.[BROKER_FEE_TYPE]
      ,a.[START_DATE]
      ,a.[END_DATE]
      ,a.[CURRENCY_ID]

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
       ,b.[INS_NUM]
      ,b.[INS_TYPE]
      ,b.[TOOLSET]
      ,b.[BUY_SELL]
      ,b.[REFERENCE]
      ,b.[INT_EXT]
      ,b.[INTERNAL_LENTITY]
      ,b.[EXTERNAL_LENTITY]
      ,b.[INTERNAL_PORTFOLIO]

      ,c.[FIN_DEL_REC]
      ,c.[FIN_LOCATION_ID]
  
      ,c.[PRICE_UNIT]
      ,c.[ORG_FX]
      ,c.[UNIT]
      ,c.[SETTLEMENT_TYPE]
      ,c.[NOTNL]
      ,c.[FX_FLT]
      ,a.[DB_TIMESTAMP]
  FROM [endur].[hist_vw_vw_dw_raw_pnl_detail_res] a
  inner join [endur].[hist_vw_user_dw_deal_attributes] b on (a.EXTRACTION_ID=b.EXTRACTION_ID and a.DEAL_NUM=b.deal_num )
  inner join[endur].[hist_vw_user_dw_deal_leg_attributes] c on (a.EXTRACTION_ID=c.EXTRACTION_ID and a.DEAL_NUM=c.deal_num  and c.param_seq_num=a.deal_leg)
--   inner join endur.view_union_extraction_log d on a.extraction_id=d.extraction_id and d.DB_STATUS<>2
GO
