/****** Object:  View [endur].[VW_PORTFOLIO_EXTENDED]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE     VIEW [endur].[VW_PORTFOLIO_EXTENDED]
AS
	SELECT a.ID_NUMBER AS ID_NUMBER,
          SUBSTRING (a.NAME, 1, 40)  AS NAME,
          SUBSTRING (a.LONG_NAME, 1, 60) AS LONG_NAME,
		  a.PORTFOLIO_TYPE AS PORTFOLIO_TYPE,
		  a.RESTRICTED,
		  a.LAST_UPDATE,
          a.PORTFOLIO_VERSION,
		  portBusinesUnit.INFO_VALUE AS BU_ID,
		  repbu.BU_NAME,
          SUBSTRING (UPPER (portTradingArea.info_value), 1, 5)  AS TA_ID,
		  repta.ta_name as TA_NAME,
		  reppa.pa_id as PA_ID,
          portProfitArea.info_value as PA_Name,
		  CASE WHEN portHedgeSpecInd.INFO_VALUE = 'Spec' then 'P' else 'B' end as Base_Spec,
		  CASE WHEN portActive_Passive.INFO_VALUE = 'Passive' then 'Passive' else 'Active' end as Active_Passive,
	      isnull(PnL_Val_Method.INFO_VALUE,'Normal') as PnL_Logic,
		  PI2.info_value as BW_Exclude,
		  CASE WHEN portMAR.INFO_VALUE = 'Yes' then 'Yes' when sapg.tax_regime='Offshore' and substring(sap_cg.info_value,1,3) not in ('M24','M30','M33')  then 'Yes' else 'No' end as Acc_Remove_Unrealized,
		  SAP_CG.INFO_VALUE as SAP_Customer_Group,
		  portReson.info_value as PortfolioReason,
		  sapg.TAX_REGIME as TAX_REGIME,
		  CASE WHEN portMAR.INFO_VALUE = 'Yes' then 'Yes' else 'No' end as Marketing
		    
         		  
     FROM endur.vw_portfolio a
          LEFT JOIN endur.vw_portfolio_info portBusinesUnit ON ( portBusinesUnit.PORTFOLIO_ID = A.ID_NUMBER AND portBusinesUnit.INFO_type_id = 20003)
          LEFT JOIN endur.vw_portfolio_info portTradingArea  ON (portTradingArea.PORTFOLIO_ID = A.ID_NUMBER  AND portTradingArea.INFO_type_id = 20005) 
		  LEFT JOIN endur.vw_portfolio_info portProfitArea   ON (portProfitArea.PORTFOLIO_ID = A.ID_NUMBER   AND portProfitArea.INFO_type_id = 20004)
          LEFT JOIN endur.vw_portfolio_info portHedgeSpecInd ON (portHedgeSpecInd.PORTFOLIO_ID = A.ID_NUMBER AND portHedgeSpecInd.INFO_type_id = 20008)
		  LEFT JOIN endur.vw_portfolio_info PI2 on (PI2.portfolio_id=A.ID_NUMBER and PI2.INFO_TYPE_ID=20007) /* Exclude from BW */
		  LEFT JOIN endur.vw_portfolio_info portActive_Passive ON (portActive_Passive.PORTFOLIO_ID = A.ID_NUMBER AND portActive_Passive.INFO_type_id = 20013)
		  LEFT JOIN endur.vw_portfolio_info portMAR ON (portMAR.PORTFOLIO_ID = A.ID_NUMBER AND portMAR.INFO_type_id = 20014)  
		  LEFT JOIN endur.vw_portfolio_info portReson ON (portReson.PORTFOLIO_ID = A.ID_NUMBER AND portReson.INFO_type_id = 20012) 
		  LEFT JOIN endur.vw_portfolio_info PnL_Val_Method ON ( PnL_Val_Method.PORTFOLIO_ID = A.ID_NUMBER AND PnL_Val_Method.INFO_type_id = 20006)
		  LEFT JOIN endur.vw_portfolio_info SAP_CG ON ( SAP_CG.PORTFOLIO_ID = A.ID_NUMBER AND SAP_CG.INFO_type_id = 20011)
		  LEFT JOIN endur.vw_vw_rep_bu repbu on (repbu.BU_ID=portBusinesUnit.INFO_VALUE collate SQL_Latin1_General_CP1_CS_AS)
		  LEFT JOIN endur.vw_vw_rep_TA repta on (repta.ta_ID= SUBSTRING (UPPER (portTradingArea.info_value), 1, 5) collate SQL_Latin1_General_CP1_CS_AS)
		  LEFT JOIN endur.vw_vw_rep_PA reppa on (reppa.pa_name= portProfitArea.info_value COLLATE SQL_Latin1_General_CP1_CS_AS)
		  left join endur.vw_user_st_sap_customer_group sapg on (sapg.CUSTOMER_GROUP=substring(sap_cg.info_value,1,3) collate SQL_Latin1_General_CP1_CS_AS and sapg.STATUS='Current' )
		   

GO
