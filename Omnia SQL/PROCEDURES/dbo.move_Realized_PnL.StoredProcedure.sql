/****** Object:  StoredProcedure [dbo].[move_Realized_PnL]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[move_Realized_PnL]
(
    -- Add the parameters for the stored procedure here
    @TableName varchar(50),
	@Schema varchar(50),
	@keyCol  varchar(250)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

		declare @stagingTable  varchar(100);
		declare @curTable  varchar(100);
		declare @histTable  varchar(100);
		declare @PnLTable  varchar(100);
		declare @cntView  varchar(100);
		declare @sql  nvarchar(max);
		declare @cols  nvarchar(max);
		declare @count  int;
		declare @keyCols  varchar(MAX);
		declare @OpenDate DATE = '9999-12-31';
		declare @FromDate DATE
		

	set @curTable=concat(@Schema,'.',@TableName);
	set @PnLTable=concat(@Schema,'.','vw_pnl_realized')
	set @histTable=concat(@Schema,'.hist_',@TableName)
	set @cntView=concat(@Schema,'.vw_count_',@TableName)

		declare FirstCursor cursor for select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where upper(TABLE_NAME) = upper(@TableName) and upper(TABLE_SCHEMA)=upper(@Schema)
 
	open FirstCursor 
	--fetch first from FirstCursor
	fetch next from FirstCursor into @keycols
	while @@FETCH_STATUS=0
	begin 
				
			if (@count>0) begin
				set @cols=concat(@cols,' , ');
			end 
			set  @cols=concat( @cols,@keyCols);
			set @count=1;
			
			
			fetch next from FirstCursor into @keycols
		  end
	   close FirstCursor 
	   deallocate FirstCursor 
	  
/*	set @sql=concat('alter table ',@curTable, ' add TEMP_COL int null')   
	--print @sql;
	EXECUTE sp_executesql @sql;
	set @sql=concat('UPDATE ', @curTable, ' with (TABLOCK) set TEMP_COL=1 from ',@CurTable,' a join (select d.',@keyCol,' from ',
	@stagingTable,' d left join ',@cntView,' b on d.',@keyCol,'=b.',@keyCol,' where b.',@keyCol,' is null) c on a.',@keyCol,'=c.',@keyCol);
	--print @sql;
	EXECUTE sp_executesql @sql; */
	select @FromDate= max(l.system_date) from endur.vw_dw_extraction_log l  where l.RUN_TYPE=1 and l.DB_STATUS=1 ;
	
	set @sql=concat('INSERT INTO ', @PnLTable, ' with (TABLOCK)  select ', @cols,',''',@FromDate,''',''',@OpenDate,''' from ',  @curTable ); 
	--print @sql;;
	EXECUTE sp_executesql @sql; 

/*	set @sql=concat('alter table ',@curTable, ' drop  column TEMP_COL')
	--print @sql;
	EXECUTE sp_executesql @sql;  */


	
END
GO
