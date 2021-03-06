/****** Object:  View [endur].[vw_report_data]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [endur].[vw_report_data]  as 

select distinct l.system_date,l.pfolio, l.EXTRACTION_ID, dateadd(mm,12,(dateadd(year,datediff(yyyy,0,l.system_date),0))) NEXT_YEAR, dateadd(mm,-3,(dateadd(year,datediff(yyyy,0,l.system_date),0))) HIST_CUT_OFF, dateadd(mm,48,(dateadd(year,datediff(yyyy,0,l.system_date),0))) FUT_CUT_OFF,dateadd(MONTH,-1,l.system_date) PREV_MONTH
from endur.view_union_extraction_log l inner join endur.view_reporting_dates sd on l.system_date=sd.date where l.SCENARIO_SEQ_NUM = 1 and l.run_type=1 
GO
