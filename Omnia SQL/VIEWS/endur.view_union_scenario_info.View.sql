/****** Object:  View [endur].[view_union_scenario_info]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [endur].[view_union_scenario_info]

AS
SELECT        a.[EXTRACTION_ID]
      ,a.[SIM_DEF_ID]
      ,a.[SIM_DEF_NAME]
      ,a.[SCENARIO_ID]
      ,a.[SCENARIO_NAME]
      ,a.[CURRENCY_ID]
      ,a.[SCENARIO_CURRENCY]
      ,a.[BMO]
      ,a.[DB_TIMESTAMP], '9999-12-31' AS VALID_TO
FROM             endur.vw_user_dw_scenario_info a inner join endur.view_union_extraction_log b on a.extraction_id=b.extraction_id and b.DB_STATUS<>2
UNION ALL
SELECT       a.[EXTRACTION_ID]
      ,a.[SIM_DEF_ID]
      ,a.[SIM_DEF_NAME]
      ,a.[SCENARIO_ID]
      ,a.[SCENARIO_NAME]
      ,a.[CURRENCY_ID]
      ,a.[SCENARIO_CURRENCY]
      ,a.[BMO]
      ,a.[DB_TIMESTAMP]
	  ,a.[DB_TIMESTAMP_H]
FROM             endur.hist_vw_user_dw_scenario_info a inner join endur.view_union_extraction_log b on a.extraction_id=b.extraction_id and b.DB_STATUS<>2
GO
