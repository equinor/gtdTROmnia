/****** Object:  StoredProcedure [dbo].[processCopyToHistEntireTable]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[processCopyToHistEntireTable]
(
	@TableName varchar(50),
	@Schema varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON	
	declare @histTable  varchar(100);
	declare @curTable  varchar(100);
	declare @stagTable  varchar(100);
	set @histTable=concat(@Schema,'.hist_',@TableName);
	set @curTable=concat(@Schema,'.',@TableName);
	set @stagTable=concat(@Schema,'.stag_',@TableName);
	declare @sql  nvarchar(max);
	declare @sqlWhere  nvarchar(max);
	declare @count  nvarchar(max);
	declare @keyCol  nvarchar(max);
	declare @keyCol1  nvarchar(max);

	declare FirstCursor cursor for select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where upper(TABLE_NAME) = upper(@TableName) and upper(TABLE_SCHEMA)=upper(@Schema)
 
	open FirstCursor 
	--fetch first from FirstCursor
	fetch next from FirstCursor into @keycol
	while @@FETCH_STATUS=0
	begin 
			if(@keyCol<>'DB_TIMESTAMP') begin
				if (@count>0) begin
					set @sqlWhere=concat(@sqlWhere,' AND ');
				end 
				set  @sqlWhere=concat( @sqlWhere,' tbl1.[',@keyCol,']= tbl2.[',@keyCol,']');
				set @keyCol1=@keyCol
				set @count=1;
			end 
			fetch next from FirstCursor into @keycol
	end
	close FirstCursor 
	deallocate FirstCursor 

	set @sql=Concat('insert into ',@histTable,' with (TABLOCK) select tbl1.*, getDate() from ',@curTable,' tbl1 left join ',@stagTable,' tbl2 on ',@sqlWhere,' where  tbl2.[',@keyCol1,'] is null') 
	--print @sql
	EXECUTE sp_executesql @sql;	
	set @sql=Concat('DELETE tbl1 from ',@stagTable,' tbl1 with(TABLOCK) inner join ',@curTable,' tbl2 ON (',@sqlWhere,')'); 
	--print @sql
	EXECUTE sp_executesql @sql;
	set @sql=Concat('DELETE tbl1 from ',@curTable,' tbl1 with(TABLOCK) inner join ',@histTable,' tbl2 ON (',@sqlWhere,')'); 
	--print @sql
	EXECUTE sp_executesql @sql;
	set @sql=concat('INSERT INTO ', @curTable, ' with (TABLOCK) select *, getDate()  from ',@stagTable); 
	--print @sql
	EXECUTE sp_executesql @sql;
	
END
GO
