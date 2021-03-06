/****** Object:  View [endur].[view_deal_level_year_end_adj]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [endur].[view_deal_level_year_end_adj]
AS
select el.EXTRACTION_ID, da.* from endur.vw_deal_level_year_end_adj da
  left join endur.hist_vw_dw_extraction_log el on da.book_id = el.PFOLIO
  where el.DB_STATUS <> 2
  and el.SCENARIO_SEQ_NUM = 1
  and el.RUN_TYPE = 1
  and da.sys_date = el.SYSTEM_DATE
  and da.BOOK NOT IN('Marketing Temp Flex' , 'Temperature Indexed')

GO
