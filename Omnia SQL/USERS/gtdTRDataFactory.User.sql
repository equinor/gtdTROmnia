/****** Object:  User [gtdTRDataFactory]    Script Date: 13/11/2019 14:31:55 ******/
CREATE USER [gtdTRDataFactory] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'role_physical_writer', @membername = N'gtdTRDataFactory'
GO
