/****** Object:  View [endur].[GDM_FX_MONTH_BASE_VIEW]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE    VIEW [endur].[GDM_FX_MONTH_BASE_VIEW]
AS


select PRODUCT FX_PRODUCT,convert(float,price)FX_MULTIPLICATOR , substring(product,8,6) FX_CODE, substring(product,8,3) FX_FROM,substring(product,11,3) FX_TO, convert(date,CAST([PRICING PERIOD] - 2 as SmallDateTime))FX_START_DATE,dateadd(d,-1,dateadd(m,1,convert(date,cast([PRICING PERIOD] - 2 as smalldatetime)))) FX_END_DATE, DB_TIMESTAMP VALID_FROM,isnull(DB_TIMESTAMP_H,'2990-01-01') VALID_TO from endur.hist_fxcurves where price not like 'NaN'
UNION
select PRODUCT,convert(float,price) , substring(product,8,6) FX_CODE,substring(product,8,3),substring(product,11,3), convert(date,CAST([PRICING PERIOD] - 2 as SmallDateTime)),dateadd(d,-1,dateadd(m,1,convert(date,cast([PRICING PERIOD] - 2 as smalldatetime)))) , DB_TIMESTAMP ,'2990-01-01' from endur.fxcurves where price not like 'NaN'


GO
