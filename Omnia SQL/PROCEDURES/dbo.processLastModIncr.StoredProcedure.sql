/****** Object:  StoredProcedure [dbo].[processLastModIncr]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[processLastModIncr]
(
	@TableName varchar(50),
	@Schema varchar(50),
	@CopyToHist bit =1
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- SET NOCOUNT ON
	declare @histTable  varchar(100);
	declare @stagingTable  varchar(100);
	declare @curTable  varchar(100);
	declare @keyCols  varchar(MAX);
	declare @keyCol  varchar(MAX);
	declare @sql  nvarchar(max);
	declare @sqlWhere  nvarchar(max);
	declare @count  int;
	declare @count1  int;
	declare @timeStamp varchar(20);
	declare @timeCol varchar(40);
	
	set @stagingTable=concat(@Schema,'.stag_',@TableName);
	set @histTable=concat(@Schema,'.hist_',@TableName);
	set @curTable=concat(@Schema,'.',@TableName);
	Select  @keyCols=KEY_COLUMNS  from [dbo].[REFRESH_CONFIG] where TABLE_NAME=@TableName;
	Select  @timeCol=TIME_STAMP_COL  from [dbo].[REFRESH_CONFIG] where TABLE_NAME=@TableName;
	if @timeCol<>''begin
			set @timeCol=concat(',tbl2.',@timeCol,' AS VALID_TO ')
		end
	set @sqlWhere='';
	set @count=0;
	

	declare FirstCursor cursor for select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where upper(TABLE_NAME) = upper(@TableName) and upper(TABLE_SCHEMA)=upper(@Schema)
 
	open FirstCursor 
	--fetch first from FirstCursor
	fetch next from FirstCursor into @keyCol
	while @@FETCH_STATUS=0
	begin 
				if(@keyCol<>'DB_TIMESTAMP') begin
			if (@count>0) begin
				set @sqlWhere=concat(@sqlWhere,' AND ');
			end 
			set  @sqlWhere=concat( @sqlWhere,' tbl1.',@keyCol,'= tbl2.',@keyCol);
			set @count=1;
			end
			fetch next from FirstCursor into @keyCol
		  end
	   close FirstCursor 
	   deallocate FirstCursor 
	  
	set @sql=Concat('DELETE tbl1 from ',@stagingTable,' tbl1 with(TABLOCK) inner join ',@curTable,' tbl2 ON (',@sqlWhere,')'); 

	EXECUTE sp_executesql @sql;
	set @sqlWhere='';
	set @count=0;
	while len(@keyCols) > 0
	begin
	
		if (@count>0) begin
			set @sqlWhere=concat(@sqlWhere,' AND ');
		end 
		set @keyCol= trim(left(@keyCols, charindex(',', @keyCols+',')-1));
		set  @sqlWhere=concat( @sqlWhere,' tbl1.',@keyCol,'= tbl2.',@keyCol);
		set @keyCols = stuff(@keyCols, 1, charindex(',', @keyCols+','), '');
		set @count=1;
	end

	declare FirstCursor cursor for select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where upper(TABLE_NAME) = upper(concat('hist_',@TableName)) and upper(TABLE_SCHEMA)=upper(@Schema)
 
	open FirstCursor 
	--fetch first from FirstCursor
	fetch next from FirstCursor into @keyCol
		

	while @@FETCH_STATUS=0
	begin 
		
			if(@keyCol='DB_TIMESTAMP_H') begin
				
				set @timeStamp=',getdate()'
			end 
			fetch next from FirstCursor into @keyCol
		  end
	   close FirstCursor 
	   deallocate FirstCursor 

	if (@CopyToHist=1) begin
		set @sql=concat('insert into ', @histTable,' with(TABLOCK) select tbl1.*',@timeStamp,@timeCol,' from ',@curTable,' tbl1, ',@stagingTable,' tbl2 where ',@sqlWhere);
		print @sql;
		EXECUTE sp_executesql @sql;
	end
	set @sql=concat('DELETE tbl1 FROM ', @curTable, ' tbl1  inner join ',@stagingTable,' tbl2 ON (',@sqlWhere,')'); 

	EXECUTE sp_executesql @sql;
	set @sql=concat('INSERT INTO ', @curTable, ' WITH(TABLOCK) select *  from ',@stagingTable); 

	EXECUTE sp_executesql @sql;
END
GO
