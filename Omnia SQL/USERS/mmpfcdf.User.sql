/****** Object:  User [mmpfcdf]    Script Date: 13/11/2019 14:31:55 ******/
CREATE USER [mmpfcdf] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[endur]
GO
sys.sp_addrolemember @rolename = N'role_dbo_reader', @membername = N'mmpfcdf'
GO
sys.sp_addrolemember @rolename = N'role_endur_reader', @membername = N'mmpfcdf'
GO
