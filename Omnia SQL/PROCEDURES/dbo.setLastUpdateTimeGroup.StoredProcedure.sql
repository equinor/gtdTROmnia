/****** Object:  StoredProcedure [dbo].[setLastUpdateTimeGroup]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <Davjoh, , Name>
-- Create Date: <11/07/2019, , >
-- Description: <Setting the Last Updated time on a specific table >
-- =============================================
CREATE procedure [dbo].[setLastUpdateTimeGroup]
@TableName varchar(50),
@TimeStamp varchar(50)

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
    -- Insert statements for procedure here
	
	declare @refresh_type  nvarchar(20);
	select @refresh_type=REFRESH_TYPE from dbo.REFRESH_CONFIG where TABLE_NAME=@TableName;
    update [dbo].REFRESH_CONFIG set LAST_REFRESH_CHECK=@TimeStamp where REFRESH_TYPE=@refresh_type;
END
GO
