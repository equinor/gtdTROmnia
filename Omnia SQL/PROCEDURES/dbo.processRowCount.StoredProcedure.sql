/****** Object:  StoredProcedure [dbo].[processRowCount]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[processRowCount]
(
    -- Add the parameters for the stored procedure here
    @TableName varchar(50),
	@rowCount int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    update dbo.REFRESH_CONFIG  set ROW_COUNT = @rowCount where TABLE_NAME=@TableName
END
GO
