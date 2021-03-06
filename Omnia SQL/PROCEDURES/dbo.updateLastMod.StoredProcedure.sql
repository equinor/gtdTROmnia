/****** Object:  StoredProcedure [dbo].[updateLastMod]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[updateLastMod]
(
    @TableName varchar(50),
	@Schema varchar(50),
	@LastModCol varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    -- SET NOCOUNT ON
	
	declare @stagingTable  varchar(100);
	declare @sql  nvarchar(max);
	set @stagingTable=concat(@Schema,'.stag_',@TableName);
    -- Insert statements for procedure here
    set @sql=concat('update [dbo].[REFRESH_CONFIG]	set	[LATEST_TIMESTAMP]=(SELECT MAX(',@LastModCol,') from ',@stagingTable,') where TABLE_NAME=','''',@TableName,'''')
	EXECUTE sp_executesql @sql;
END
GO
