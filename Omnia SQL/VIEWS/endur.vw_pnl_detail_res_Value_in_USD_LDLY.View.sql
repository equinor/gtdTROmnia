/****** Object:  View [endur].[vw_pnl_detail_res_Value_in_USD_LDLY]    Script Date: 12/11/2019 12:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   VIEW [endur].[vw_pnl_detail_res_Value_in_USD_LDLY]
AS
			select r.system_date, r.bu_name, r.Portfolio as book ,r.extraction_id, sum(total_value*FX_To_Use) as Base_reult,sum(total_value * FX_To_Use * FX.FX_Rate) as USD_Value,
				r.SCENARIO_CURRENCY 
				from endur.vw_pnl_detail_res_LDLY r
			
				left join endur.BW_fixed_FX_Rates FX on (FX.FX_FROM = r.SCENARIO_CURRENCY and FX.Date= dbo.First_Of_Month(r.SYSTEM_DATE))
				group by r.system_date,r.bu_name, r.Portfolio,r.SCENARIO_CURRENCY,r.EXTRACTION_ID
GO
