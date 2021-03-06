/****** Object:  View [endur].[view_union_extraction_log]    Script Date: 13/11/2019 14:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [endur].[view_union_extraction_log]
WITH SCHEMABINDING
AS
SELECT   distinct     [EXTRACTION_ID]
      ,[SIM_RUN_ID]
      ,[SIM_DEF_ID]
      ,[SCENARIO_SEQ_NUM]
      ,[REVISION]
      ,[ROW_CREATION]
      ,[SYSTEM_DATE]
      ,[RUN_TYPE]
      ,[SIM_DEF_NAME]
      ,[SCENARIO_NAME]
      ,[PFOLIO]
      ,[DB_STATUS]
   --   ,[EXTRACTION_STATUS]
   --   ,[EXTRACTION_TIMESTAMP]
      ,[ETL_STATUS]
      ,[ETL_TIMESTAMP]
    --  ,[DB_TIMESTAMP], '9999-12-31' AS VALID_TO
FROM            endur.vw_dw_extraction_log where DB_STATUS<>2
UNION
SELECT    distinct    [EXTRACTION_ID]
      ,[SIM_RUN_ID]
      ,[SIM_DEF_ID]
      ,[SCENARIO_SEQ_NUM]
      ,[REVISION]
      ,[ROW_CREATION]
      ,[SYSTEM_DATE]
      ,[RUN_TYPE]
      ,[SIM_DEF_NAME]
      ,[SCENARIO_NAME]
      ,[PFOLIO]
      ,[DB_STATUS]
    --  ,[EXTRACTION_STATUS]
    --  ,[EXTRACTION_TIMESTAMP]
      ,[ETL_STATUS]
      ,[ETL_TIMESTAMP]
    --  ,[DB_TIMESTAMP]
	--  ,[DB_TIMESTAMP_H]
FROM            endur.hist_vw_dw_extraction_log where DB_STATUS<>2

GO
