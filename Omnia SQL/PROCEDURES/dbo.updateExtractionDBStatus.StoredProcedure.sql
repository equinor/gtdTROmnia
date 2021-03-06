/****** Object:  StoredProcedure [dbo].[updateExtractionDBStatus]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[updateExtractionDBStatus]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

update d  set d.db_status=2 from endur.vw_dw_extraction_log d inner join  (select a.extraction_id from endur.vw_dw_extraction_log a left join (select max(c.extraction_id) max_id,c.pfolio,c.system_date,c.[SIM_DEF_ID]
      ,c.[SCENARIO_SEQ_NUM],c.[RUN_TYPE]
      ,c.[SIM_DEF_NAME]
      ,c.[SCENARIO_NAME] from (select *, '9999-12-31' Valid_To from endur.vw_dw_extraction_log union select * from endur.hist_vw_dw_extraction_log) c where db_status=1 group by c.pfolio,c.system_date,c.[SIM_DEF_ID]
      ,c.[SCENARIO_SEQ_NUM],c.[RUN_TYPE]
      ,c.[SIM_DEF_NAME]
      ,c.[SCENARIO_NAME]) b on a.EXTRACTION_ID=MAX_ID and  a.pfolio=b.pfolio and a.system_date=b.system_date aND a.[SIM_DEF_ID]=b.[SIM_DEF_ID] and 
      a.[SCENARIO_SEQ_NUM]=b.[SCENARIO_SEQ_NUM] AND a.[RUN_TYPE]=b.[RUN_TYPE] AND a.[SIM_DEF_NAME]=b.[SIM_DEF_NAME] AND a.[SCENARIO_NAME]=b.[SCENARIO_NAME] where max_id is null) e on d.extraction_id=e.extraction_id;

update d  set d.db_status=2 from endur.hist_vw_dw_extraction_log d inner join  (select a.extraction_id from endur.hist_vw_dw_extraction_log a left join (select max(c.extraction_id) max_id,c.pfolio,c.system_date,c.[SIM_DEF_ID]
      ,c.[SCENARIO_SEQ_NUM],c.[RUN_TYPE]
      ,c.[SIM_DEF_NAME]
      ,c.[SCENARIO_NAME] from (select *, '9999-12-31' Valid_To from endur.vw_dw_extraction_log union select * from endur.hist_vw_dw_extraction_log) c where db_status=1 group by c.pfolio,c.system_date,c.[SIM_DEF_ID]
      ,c.[SCENARIO_SEQ_NUM],c.[RUN_TYPE]
      ,c.[SIM_DEF_NAME]
      ,c.[SCENARIO_NAME]) b on a.EXTRACTION_ID=MAX_ID and  a.pfolio=b.pfolio and a.system_date=b.system_date aND a.[SIM_DEF_ID]=b.[SIM_DEF_ID] and 
      a.[SCENARIO_SEQ_NUM]=b.[SCENARIO_SEQ_NUM] AND a.[RUN_TYPE]=b.[RUN_TYPE] AND a.[SIM_DEF_NAME]=b.[SIM_DEF_NAME] AND a.[SCENARIO_NAME]=b.[SCENARIO_NAME] where max_id is null) e on d.extraction_id=e.extraction_id;
END
GO
