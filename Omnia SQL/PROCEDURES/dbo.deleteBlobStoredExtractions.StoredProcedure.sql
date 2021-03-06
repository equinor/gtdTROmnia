/****** Object:  StoredProcedure [dbo].[deleteBlobStoredExtractions]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[deleteBlobStoredExtractions]
(
    -- Add the parameters for the stored procedure here
	@TableName varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	declare @histTable  varchar(100);
	declare @sql  nvarchar(max);
	set @histTable=concat('endur.hist_',@TableName);
    -- Insert statements for procedure here

 set @sql=concat('delete a from ', @histTable,' a inner join endur.hist_vw_dw_extraction_log b on a.extraction_id=b.extraction_id 
				where b.SYSTEM_DATE not in (select c.Date from endur.view_reporting_dates c) 
				and b.system_date <dateadd(day,-14,getdate()) or b.DB_STATUS=2')
				print @sql;
EXECUTE sp_executesql @sql;
END
GO
