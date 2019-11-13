/****** Object:  UserDefinedFunction [dbo].[first_of_month]    Script Date: 13/11/2019 14:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[first_of_month](@idate date)
RETURNS datetime AS
BEGIN
declare @resDate datetime

set @resDate = (select CONVERT(DATE,dateadd(dd,-(day(@idate)-1),@idate)) )

	return @resDate
  
END
GO
