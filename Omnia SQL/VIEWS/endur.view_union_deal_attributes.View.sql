/****** Object:  View [endur].[view_union_deal_attributes]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [endur].[view_union_deal_attributes]

AS
select       c.[EXTRACTION_ID]
      ,c.[RESULT_TYPE]
      ,c.[TRAN_NUM]
      ,c.[TRAN_GROUP]
      ,c.[DEAL_NUM]
      ,c.[TRAN_TYPE]
      ,c.[TRAN_STATUS]
      ,c.[ASSET_TYPE]
      ,c.[INS_NUM]
      ,c.[INS_TYPE]
      ,c.[INS_CLASS]
      ,c.[TOOLSET]
      ,c.[BUY_SELL]
      ,c.[REFERENCE]
      ,c.[STRATEGY]
      ,c.[DEAL_CLASSIFICATION]
      ,c.[INT_EXT]
      ,c.[INTERNAL_BUNIT]
      ,c.[INTERNAL_LENTITY]
      ,c.[EXTERNAL_BUNIT]
      ,c.[EXTERNAL_LENTITY]
      ,c.[INTERNAL_PORTFOLIO]
      ,c.[EXTERNAL_PORTFOLIO]
      ,c.[INTERNAL_CONTACT]
      ,c.[EXTERNAL_CONTACT]
      ,c.[BOOK]
      ,c.[TRADE_DATE]
      ,c.[INPUT_DATE]
      ,c.[SETTLE_DATE]
      ,c.[POSITION]
      ,c.[PRICE]
      ,c.[RATE]
      ,c.[CURRENCY]
      ,c.[CFLOW_TYPE]
      ,c.[VERSION_NUMBER]
      ,c.[PROCEEDS]
      ,c.[MVALUE]
      ,c.[LAST_UPDATE]
      ,c.[INS_SUB_TYPE]
      ,c.[BROKER_ID]
      ,c.[START_DATE]
      ,c.[MATURITY_DATE]
      ,c.[PERPETUAL_POS_DATE]
      ,c.[TRADE_TIME]
      ,c.[OFFSET_TRAN_NUM]
      ,c.[OFFSET_TRAN_TYPE]
      ,c.[ASSOCIATED_FX_JOURNAL]
      ,c.[TRADE_FLAG]
      ,c.[CURRENT_FLAG]
      ,c.[FX_YLD_BASIS_1]
      ,c.[FX_YLD_BASIS_2]
      ,c.[UNIT]
      ,c.[LOCK_TYPE]
      ,c.[IDX_GROUP]
      ,c.[IDX_SUBGROUP]
      ,c.[TEMPLATE_TRAN_NUM]
      ,c.[OTC_CLEARING_BROKER_ID]
      ,c.[PORTFOLIO_GROUP_ID]
      ,c.[BASE_INS_ID]
      ,c.[INCLUDE_IN_DW]
      ,c.[PEGAS_FUTURE]
      ,c.[DB_TIMESTAMP]
	  , c.VALID_TO 
from(
SELECT        a.[EXTRACTION_ID]
      ,a.[RESULT_TYPE]
      ,a.[TRAN_NUM]
      ,a.[TRAN_GROUP]
      ,a.[DEAL_NUM]
      ,a.[TRAN_TYPE]
      ,a.[TRAN_STATUS]
      ,a.[ASSET_TYPE]
      ,a.[INS_NUM]
      ,a.[INS_TYPE]
      ,a.[INS_CLASS]
      ,a.[TOOLSET]
      ,a.[BUY_SELL]
      ,a.[REFERENCE]
      ,a.[STRATEGY]
      ,a.[DEAL_CLASSIFICATION]
      ,a.[INT_EXT]
      ,a.[INTERNAL_BUNIT]
      ,a.[INTERNAL_LENTITY]
      ,a.[EXTERNAL_BUNIT]
      ,a.[EXTERNAL_LENTITY]
      ,a.[INTERNAL_PORTFOLIO]
      ,a.[EXTERNAL_PORTFOLIO]
      ,a.[INTERNAL_CONTACT]
      ,a.[EXTERNAL_CONTACT]
      ,a.[BOOK]
      ,a.[TRADE_DATE]
      ,a.[INPUT_DATE]
      ,a.[SETTLE_DATE]
      ,a.[POSITION]
      ,a.[PRICE]
      ,a.[RATE]
      ,a.[CURRENCY]
      ,a.[CFLOW_TYPE]
      ,a.[VERSION_NUMBER]
      ,a.[PROCEEDS]
      ,a.[MVALUE]
      ,a.[LAST_UPDATE]
      ,a.[INS_SUB_TYPE]
      ,a.[BROKER_ID]
      ,a.[START_DATE]
      ,a.[MATURITY_DATE]
      ,a.[PERPETUAL_POS_DATE]
      ,a.[TRADE_TIME]
      ,a.[OFFSET_TRAN_NUM]
      ,a.[OFFSET_TRAN_TYPE]
      ,a.[ASSOCIATED_FX_JOURNAL]
      ,a.[TRADE_FLAG]
      ,a.[CURRENT_FLAG]
      ,a.[FX_YLD_BASIS_1]
      ,a.[FX_YLD_BASIS_2]
      ,a.[UNIT]
      ,a.[LOCK_TYPE]
      ,a.[IDX_GROUP]
      ,a.[IDX_SUBGROUP]
      ,a.[TEMPLATE_TRAN_NUM]
      ,a.[OTC_CLEARING_BROKER_ID]
      ,a.[PORTFOLIO_GROUP_ID]
      ,a.[BASE_INS_ID]
      ,a.[INCLUDE_IN_DW]
      ,a.[PEGAS_FUTURE]
      ,a.[DB_TIMESTAMP], '9999-12-31' AS VALID_TO
FROM             endur.vw_user_dw_deal_attributes a --inner join endur.view_union_extraction_log b on a.extraction_id=b.extraction_id and b.DB_STATUS<>2
UNION all
SELECT             a.[EXTRACTION_ID]
      ,a.[RESULT_TYPE]
      ,a.[TRAN_NUM]
      ,a.[TRAN_GROUP]
      ,a.[DEAL_NUM]
      ,a.[TRAN_TYPE]
      ,a.[TRAN_STATUS]
      ,a.[ASSET_TYPE]
      ,a.[INS_NUM]
      ,a.[INS_TYPE]
      ,a.[INS_CLASS]
      ,a.[TOOLSET]
      ,a.[BUY_SELL]
      ,a.[REFERENCE]
      ,a.[STRATEGY]
      ,a.[DEAL_CLASSIFICATION]
      ,a.[INT_EXT]
      ,a.[INTERNAL_BUNIT]
      ,a.[INTERNAL_LENTITY]
      ,a.[EXTERNAL_BUNIT]
      ,a.[EXTERNAL_LENTITY]
      ,a.[INTERNAL_PORTFOLIO]
      ,a.[EXTERNAL_PORTFOLIO]
      ,a.[INTERNAL_CONTACT]
      ,a.[EXTERNAL_CONTACT]
      ,a.[BOOK]
      ,a.[TRADE_DATE]
      ,a.[INPUT_DATE]
      ,a.[SETTLE_DATE]
      ,a.[POSITION]
      ,a.[PRICE]
      ,a.[RATE]
      ,a.[CURRENCY]
      ,a.[CFLOW_TYPE]
      ,a.[VERSION_NUMBER]
      ,a.[PROCEEDS]
      ,a.[MVALUE]
      ,a.[LAST_UPDATE]
      ,a.[INS_SUB_TYPE]
      ,a.[BROKER_ID]
      ,a.[START_DATE]
      ,a.[MATURITY_DATE]
      ,a.[PERPETUAL_POS_DATE]
      ,a.[TRADE_TIME]
      ,a.[OFFSET_TRAN_NUM]
      ,a.[OFFSET_TRAN_TYPE]
      ,a.[ASSOCIATED_FX_JOURNAL]
      ,a.[TRADE_FLAG]
      ,a.[CURRENT_FLAG]
      ,a.[FX_YLD_BASIS_1]
      ,a.[FX_YLD_BASIS_2]
      ,a.[UNIT]
      ,a.[LOCK_TYPE]
      ,a.[IDX_GROUP]
      ,a.[IDX_SUBGROUP]
      ,a.[TEMPLATE_TRAN_NUM]
      ,a.[OTC_CLEARING_BROKER_ID]
      ,a.[PORTFOLIO_GROUP_ID]
      ,a.[BASE_INS_ID]
      ,a.[INCLUDE_IN_DW]
      ,a.[PEGAS_FUTURE]
      ,a.[DB_TIMESTAMP]
	  ,a.[DB_TIMESTAMP_H]
FROM             endur.hist_vw_user_dw_deal_attributes a) c inner join endur.view_union_extraction_log b on c.extraction_id=b.extraction_id and b.DB_STATUS<>2
GO
