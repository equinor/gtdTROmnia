/****** Object:  User [pnlnoidatafactory]    Script Date: 13/11/2019 14:31:55 ******/
CREATE USER [pnlnoidatafactory] FOR LOGIN [pnlnoidatafactorydev] WITH DEFAULT_SCHEMA=[endur]
GO
sys.sp_addrolemember @rolename = N'role_pnl_noi_reader', @membername = N'pnlnoidatafactory'
GO
