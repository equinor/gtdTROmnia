/****** Object:  UserDefinedFunction [dbo].[cut_off_date]    Script Date: 13/11/2019 14:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[cut_off_date](@idate date)
RETURNS datetime AS
BEGIN
declare @resDate datetime

set @resDate = (select dateadd(mm,-3,(dateadd(year,datediff(yy,0,@idate),0))))


	return @resDate
  
END
GO
