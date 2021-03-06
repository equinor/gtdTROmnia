/****** Object:  View [endur].[VW_ENDUR_DEAL]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE   VIEW [endur].[VW_ENDUR_DEAL]
AS

	SELECT t.*, instr.NAME as instrument_name,tstatus.NAME as tran_status_name,tool.NAME as toolset_name, NG_DEALID.VALUE as NG_DEAL_ID ,
	ILE.short_name as Internal_Legal_Entity_name,ELE.SHORT_NAME as External_Legal_Etity_Name
	from endur.vw_ab_tran t

	inner join endur.vw_instruments instr on (instr.ID_NUMBER=t.INS_TYPE)
	inner join endur.vw_trans_status tstatus on (tstatus.TRANS_STATUS_ID =t.TRAN_STATUS )
	inner join endur.vw_toolsets tool on (tool.ID_NUMBER =t.TOOLSET )
	inner join endur.vw_party ILE on (ILE.PARTY_ID=t.INTERNAL_LENTITY)
	inner join endur.vw_party ELE on (ELE.PARTY_ID=t.EXTERNAL_LENTITY)
	left join endur.vw_ab_tran_info NG_DEALID on (NG_DEALID.TRAN_NUM=t.TRAN_NUM and NG_DEALID.TYPE_ID=20006)
	left join endur.vw_ab_tran_info ACC_TREATMENT on (ACC_TREATMENT.TRAN_NUM=t.TRAN_NUM and NG_DEALID.TYPE_ID=20024)
	left join endur.vw_ab_tran_info ncs_sourced on (ncs_sourced.TRAN_NUM=t.TRAN_NUM and ncs_sourced.TYPE_ID=20010)
	where t.MATURITY_DATE > dbo.cut_off_date(t.MATURITY_DATE)
     


GO
