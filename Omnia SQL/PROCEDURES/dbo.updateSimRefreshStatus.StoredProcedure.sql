/****** Object:  StoredProcedure [dbo].[updateSimRefreshStatus]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[updateSimRefreshStatus]
(
       @Update smallint
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
   if @update=1 
   begin
		update endur.sim_refresh_status set refresh_status=1
	end
	else
	begin
		update endur.sim_refresh_status set refresh_status=0
	end
END
GO
