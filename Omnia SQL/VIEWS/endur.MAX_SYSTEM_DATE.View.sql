/****** Object:  View [endur].[MAX_SYSTEM_DATE]    Script Date: 12/11/2019 12:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [endur].[MAX_SYSTEM_DATE]   
AS
	select max(system_date) as MAX_SYSTEM_DATE from endur.stag_vw_dw_extraction_log r where r.DB_STATUS=1 and r.RUN_TYPE=1
GO
