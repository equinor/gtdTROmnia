/****** Object:  UserDefinedFunction [dbo].[first_next_year]    Script Date: 13/11/2019 14:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[first_next_year](@idate date)
RETURNS datetime AS
BEGIN
declare @resDate datetime

set @resDate = (select dateadd(mm,12,(dateadd(year,datediff(yyyy,0,@idate),0))) )

	return @resDate
  
END
GO
