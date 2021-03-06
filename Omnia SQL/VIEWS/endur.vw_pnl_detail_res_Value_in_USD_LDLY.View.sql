/****** Object:  View [endur].[vw_pnl_detail_res_Value_in_USD_LDLY]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE   VIEW [endur].[vw_pnl_detail_res_Value_in_USD_LDLY]
AS
			select r.system_date, r.bu_name, r.Portfolio as book ,r.extraction_id, sum(total_value*FX_To_Use) as Base_reult,sum(total_value * FX_To_Use * FX.FX_Rate) as USD_Value,
				r.SCENARIO_CURRENCY 
								from endur.vw_pnl_detail_res_LDLY r with(NOLOCK)
				left join (select max(system_date) sys_date from endur.vw_dw_extraction_log with(nolock)) l on 1=1
			
				left join endur.BW_fixed_FX_Rates FX  with(NOLOCK)on (FX.FX_FROM = r.SCENARIO_CURRENCY and FX.Date= dbo.First_Of_Month(r.SYSTEM_DATE))
				where r.In_Official_PnL='Yes'
				 and r.end_date>=dbo.cut_off_date(l.sys_date) 
				group by r.system_date,r.bu_name, r.Portfolio,r.SCENARIO_CURRENCY,r.EXTRACTION_ID
GO
