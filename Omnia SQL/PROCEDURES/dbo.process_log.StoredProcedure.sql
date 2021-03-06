/****** Object:  StoredProcedure [dbo].[process_log]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[process_log] 

       @p_Process NVARCHAR(255), 
       @p_Task NVARCHAR(40), 
       @p_Other_Comments NVARCHAR(4000) 

AS
       BEGIN
             SET IMPLICIT_TRANSACTIONS ON;

             INSERT INTO dbo.TOOL_PROCESSLOG
             (PROCESS, TASK, OTHER_COMMENTS)
             Values
             (@p_Process, @p_Task, @p_Other_Comments);


             COMMIT TRANSACTION;


       END;

GO
