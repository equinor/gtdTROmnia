/****** Object:  View [endur].[view_reporting_dates]    Script Date: 13/11/2019 14:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [endur].[view_reporting_dates] 

as
select distinct system_date  as date, system_date as reporting_date from endur.view_union_extraction_log a where a.system_date>getdate()-14 
union
select distinct system_date, EOMONTH(system_date) from endur.view_union_extraction_log a where
a.system_date in(select date from dbo.BW_STOREDATES) 
GO
