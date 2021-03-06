/****** Object:  View [endur].[vw_pnl_detail_res_Value_in_USD_LDLY2]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE  VIEW [endur].[vw_pnl_detail_res_Value_in_USD_LDLY2]
AS
				select r.system_date,  r.bu_name, r.Portfolio as book ,r.extraction_id, sum(r.total_value*r.FX_To_Use) as  Base_reult,sum(total_value * FX_To_Use * FX.FX_Rate) as USD_Value,
				r.SCENARIO_CURRENCY 
				from endur.vw_pnl_detail_res_LDLY_L2 r
			
				left join endur.BW_fixed_FX_Rates FX on (FX.FX_FROM = r.SCENARIO_CURRENCY and FX.Date= dbo.first_next_year(r.SYSTEM_DATE))
				group by r.system_date,r.bu_name, r.Portfolio,r.SCENARIO_CURRENCY,r.EXTRACTION_ID
GO
