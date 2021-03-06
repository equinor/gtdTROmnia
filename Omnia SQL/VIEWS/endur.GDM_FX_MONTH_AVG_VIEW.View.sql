/****** Object:  View [endur].[GDM_FX_MONTH_AVG_VIEW]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE    VIEW [endur].[GDM_FX_MONTH_AVG_VIEW]   
AS
	select r.FX_FROM, FX_TO, FX_START_DATE as FX_DATE, 1/FX_MULTIPLICATOR as FX_MULTIPLICATOR,r.VALID_FROM,r.VALID_TO   from endur.gdm_FX_MONTH_BASE_VIEW r where r.valid_to='2990-01-01 00:00:00.000'
UNION ALL  			
	select fx1.FX_To as FX_From, fx2.FX_TO as FX_From, fx1.FX_start_Date as FX_Date, round(fx1.FX_Multiplicator/fx2.FX_Multiplicator,6) as FX_MULTIPLICATOR, fx1.VALID_FROM,fx1.VALID_TO
	from endur.gdm_FX_MONTH_BASE_VIEW FX1,  endur.gdm_FX_MONTH_BASE_VIEW fx2
	where fx1.FX_START_Date = fx2.FX_START_Date
	and fx1.Valid_to='2990-01-01 00:00:00.000'
	and fx2.valid_to=fx1.valid_to
GO
