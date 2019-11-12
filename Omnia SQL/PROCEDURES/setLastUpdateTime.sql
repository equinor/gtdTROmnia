-- =======================================================
-- Create Stored Procedure Template for Azure SQL Database
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Davjoh, , Name>
-- Create Date: <11/07/2019, , >
-- Description: <Setting the Last Updated time on a specific table >
-- =============================================
CREATE PROCEDURE [dbo].[setLastUpdateTime]
@TableName varchar(50),
@TimeStamp varchar(50)

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    update [dbo].REFRESH_CONFIG set LAST_REFRESH_CHECK=@TimeStamp where TABLE_NAME=@TableName;
END
GO