/****** Object:  User [gtdTRDataFactoryProd]    Script Date: 13/11/2019 14:31:55 ******/
CREATE USER [gtdTRDataFactoryProd] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'role_physical_writer', @membername = N'gtdTRDataFactoryProd'
GO
