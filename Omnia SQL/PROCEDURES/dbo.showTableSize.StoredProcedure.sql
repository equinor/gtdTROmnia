/****** Object:  StoredProcedure [dbo].[showTableSize]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[showTableSize]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
SELECT [o].[name], [i].[index_id], [i].[name], [p].[rows],  
(8*SUM([au].[used_pages]))/1024 AS [IndexSize(MB)], [p].[data_compression_desc]
FROM [sys].[allocation_units] [au]
JOIN [sys].[partitions] [p]
	ON [au].[container_id] = [p].[partition_id]
JOIN [sys].[objects] [o] 
	ON [p].[object_id] = [o].[object_id]
JOIN [sys].[indexes] [i]
	ON [p].[object_id] = [i].[object_id] AND [p].[index_id] = [i].[index_id]
WHERE [o].[is_ms_shipped] = 0
GROUP BY [o].[name], [i].[index_id], [i].[name], [p].[rows], [p].[data_compression_desc]
ORDER BY [o].[name], [i].[index_id];
END
GO
