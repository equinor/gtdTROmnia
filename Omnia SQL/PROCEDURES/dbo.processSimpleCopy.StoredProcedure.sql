/****** Object:  StoredProcedure [dbo].[processSimpleCopy]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[processSimpleCopy]
(
    @TableName varchar(50),
	@Schema varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    -- SET NOCOUNT ON

	declare @stagingTable  varchar(100);
	declare @stagingTable2  varchar(100);
	declare @curTable  varchar(100);
	declare @sql  nvarchar(max);
	declare @cols  nvarchar(max);
	declare @count  int;
	declare @keyCol  varchar(MAX);

	set @stagingTable=concat(@Schema,'.stag_',@TableName);
	set @stagingTable2=concat('stag_',@TableName);

	set @curTable=concat(@Schema,'.',@TableName);
		
	declare FirstCursor cursor for select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where upper(TABLE_NAME) = upper(@stagingTable2) and upper(TABLE_SCHEMA)=upper(@Schema)
 
	open FirstCursor 
	--fetch first from FirstCursor
	fetch next from FirstCursor into @keycol
	while @@FETCH_STATUS=0
	begin 
				if(@keyCol<>'DB_TIMESTAMP') begin
			if (@count>0) begin
				set @cols=concat(@cols,' , ');
			end 
			set  @cols=concat( @cols,@keyCol);
			set @count=1;
			end
			fetch next from FirstCursor into @keycol
		  end

	   close FirstCursor 
	   deallocate FirstCursor 
	  



	set @sql=concat('INSERT INTO ', @curTable, ' WITH (TABLOCK)  (',@cols,') select *  from ',@stagingTable); 
	EXECUTE sp_executesql @sql;
END
GO
