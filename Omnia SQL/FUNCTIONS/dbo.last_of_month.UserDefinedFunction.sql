/****** Object:  UserDefinedFunction [dbo].[last_of_month]    Script Date: 13/11/2019 14:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create Stored Procedure Template for Azure SQL Database
create FUNCTION [dbo].[last_of_month](@idate date)
RETURNS datetime AS
BEGIN
declare @resDate datetime

set @resDate =(select dateadd(s,-1,dateadd(mm,datediff(m,0,@idate)+1,0))) 
	return @resDate
  
END

GO
