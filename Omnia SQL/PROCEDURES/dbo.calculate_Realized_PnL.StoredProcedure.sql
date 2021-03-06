/****** Object:  StoredProcedure [dbo].[calculate_Realized_PnL]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: 
1.	Deleted Deals, moves deals that are no longer with status Validated/Matured into the deletedDeals table
2.	Moves trans that are in the deleted deals table to the histtable from the current table
3.	Deletes the trans that are in the deleted deals table from the current table
4.	If the pnltable is empty no logic is needed and all the data from the staging table is copies into the currenttable/view directly
5.	If there are already rows in the pnltable all values from the currenttable/view are copied into the temp table where the extraction_id is still in the current view_vw_dw_extraction_log table
6.	Insert the primarykeys from the temp table in the T1, indicating if the this is related to a new or historical system_date, based on the max system_date in the vw_dw_extraction_log table and only if the row does not already as a row in the pnl table (so only new rows are entered into the T1 table)
7.	All new rows with a system_date >=max(vw_dw_extraction_log.system_date) are added to the pnl table
8.	Insert all rows from the temp table that exist in the pnl table, but have changed into the updatetable, indicating the primary keys and the valid dates of both old and new data. If the valid from date in the temp table is >= to the valid_from date in the pnl table then is_newer=1
9.	Insert all data into the histtable from the pnltable where the row in the temp table is_newer=1 based on the updatetable from 8
10.	Delete the rows from the pnltable that have been moved to the histtable in step 9 based on the updatetable and is_newer=1
11.	Insert into the pnl table all rows from the temp table that are is_newer=1 based on the updatetable


12.	Insert historical deals into the pnl table direct that do not yet exist in the pnl table and still have the tran status validated or matured. 
13.	Remove rows from the temp table that already exist and are equal in the historical table with a valid from/to date that is covered by the period in the histtable
14.	Insert values into the temp_t1 table where the rows exists in the histable but with different values, if the valid from date in the temp table is greater then the valid from date in the hist table then is_newer=1 (should be adjusted to rows that only cover the valid_from period of the new rows?)
15.	Update histtable for rows that are replaced by new rows. The Valid to date of the old rows is adjusted to valid_from -1 from the new row 
16.	Insert into hist table all rows that are in the temp table. If the row is_newer=1 then set the valid_to date to the old valid_to date from the original row else it will be valid_from-1 from the old row.

17.	Insert into hist table directly deals that are no longer in a valid status from TEMP_T1 and is_new=2 (is this correct should the valid from/to date be adjusted somehow)
18. Update valid_from in pnl table when identical value is valid before existing valid_from date
19. Update valid_from in hist table when identical value is valid before existing valid_from date
-- =============================================*/
CREATE procedure [dbo].[calculate_Realized_PnL]
/*
(
  @TableName varchar(50),
	@Schema varchar(50),
	@keyCol  varchar(250)
)
	*/

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	declare @v_Process NVARCHAR(255) = 'LOAD INTO PNL_REALIZED';
    declare @v_Task NVARCHAR(40) = 'MAIN';
    declare @v_Other_Comments NVARCHAR(4000) = '';

	declare @TableName varchar(100);
	declare @TableOrigName varchar(100);
	declare @TableCopyName varchar(100);
	declare @Schema varchar(50);
	declare @keyCol  varchar(250);
	declare @stagingTable  varchar(100);
	declare @curTable  varchar(100);
	declare @PnLTableTemp  varchar(100);
	declare @PnLTable  varchar(100);
	declare @PnLTableOrig  varchar(100);
	declare @PnLTableUpd  varchar(100);
	declare @PnLhistTable  varchar(100);
	declare @PnLMissingRows varchar(100);
	declare @PnLDeletedDeal varchar(100);
	declare @cntView  varchar(100);
	declare @sql  nvarchar(max);
	declare @cols  nvarchar(max);
	declare @count  int;
	declare @keyCols  varchar(MAX);
	declare @PnLRows int;
	declare @PnLNewRows int;
	declare @OpenDate DATE = '9999-12-31';
	declare @FromDate DATE;
	declare @Where_Same varchar(max);
	declare @values varchar(max);
	declare @values_equal varchar(max);
	declare @valid varchar(max);
	declare @MyStart_Value int;
	declare @PnLTableTemp_T  varchar(100);
	declare @ProcessTable  varchar(100);
	declare @Process varchar(20)='PNL_REALIZED'
	

	set @Schema='endur'
	set @TableName='view_pnl_usdr'
	set @TableOrigName='vw_pnl_realized'
	set @TableCopyName='vw_pnl-realized_cp'
	set @PnLTableOrig=concat(@schema,'.','vw_pnl_realized')
	set @PnLTable=concat(@schema,'.','vw_pnl_realized_cp')
	set @PnLTableTemp=concat(@schema,'.','vw_pnl_realized_Temp')
	set @curTable=concat(@Schema,'.','view_pnl_usdr')
	set @PnLTableTemp_T=concat(@schema,'.','vw_pnl_realized_Temp_T1')
	Set @PnLTableUpd=concat(@schema,'.','vw_pnl_realized_Temp_Update')
	Set @PnLhistTable=concat(@schema,'.','hist_vw_pnl_realized')
	Set @PnLMissingRows= concat(@schema,'.','vw_pnl_realized_Missing_Rows');
	Set @PnLDeletedDeal= concat(@schema,'.','vw_pnl_realized_Deleted_Deals');
	Set @ProcessTable= concat(@schema,'.','PROCESS_STATUS');
	
	set @Where_Same='s.[DEAL_NUM]=t.[DEAL_NUM] AND 
s.[DEAL_LEG]=t.[DEAL_LEG] AND 
s.[DEAL_LEG_1]=t.[DEAL_LEG_1] AND 
s.[DEAL_PDC]=t.[DEAL_PDC] AND 
s.[INS_SEQ_NUM]=t.[INS_SEQ_NUM] AND 
s.[PRICE_BAND]=t.[PRICE_BAND] AND 
s.[PRICE_BAND_SEQ_NUM]=t.[PRICE_BAND_SEQ_NUM] AND 
s.[CFLOW_TYPE]=t.[CFLOW_TYPE] AND 
s.[START_DATE]=t.[START_DATE] AND 
s.[END_DATE]=t.[END_DATE] AND 
s.[CURRENCY_ID]=t.[CURRENCY_ID] AND 
s.[INS_NUM]=t.[INS_NUM] AND 
s.[BUY_SELL]=t.[BUY_SELL] AND 
s.[REFERENCE]=t.[REFERENCE] AND 
s.[INT_EXT]=t.[INT_EXT] AND 
s.[INTERNAL_LENTITY]=t.[INTERNAL_LENTITY] AND 
s.[EXTERNAL_LENTITY]=t.[EXTERNAL_LENTITY] AND 
s.[INTERNAL_PORTFOLIO]=t.[INTERNAL_PORTFOLIO] AND 
s.[FIN_DEL_REC]=t.[FIN_DEL_REC] AND 
s.[FIN_LOCATION_ID]=t.[FIN_LOCATION_ID] AND 
s.[PRICE_UNIT]=t.[PRICE_UNIT] AND 
s.[SETTLEMENT_TYPE]=t.[SETTLEMENT_TYPE] AND 
s.[FX_FLT]=t.[FX_FLT] '
	
	set @Values = ' and (abs(s.Total_Value - t.total_value) > 0.001 or abs(s.VOLUME - t.VOLUME) > 0.0001) '
	set @Values_equal = ' and abs(s.Total_Value - t.total_value) <= 0.001 and abs(s.VOLUME - t.VOLUME) <= 0.0001 '
	set @Valid =' and t.valid_from<= s.valid_from and t.valid_to>= s.valid_From ' 

	/* set Start*/
	set @sql = concat('update ', @ProcessTable,' set STATUS=1, START_TIME=getdate(), END_TIME=NULL where PROCESS=''',@Process,'''')
	execute sp_executesql @sql;
	/* clean up before start*/
	set @sql = concat('truncate table ', @PnLTableTemp)
	--execute sp_executesql @sql;
	set @sql = concat('truncate table ', @PnLTableTemp_T)
	execute sp_executesql @sql;
	set @sql = concat('truncate table ', @PnLTableUpd)
	execute sp_executesql @sql;
	set @sql = concat('truncate table ', @PnLMissingRows)
	execute sp_executesql @sql;
	set @sql = concat('truncate table ', @PnLDeletedDeal)
	execute sp_executesql @sql;
	
	
	declare FirstCursor cursor for select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where upper(TABLE_NAME) = upper(@TableName) and upper(TABLE_SCHEMA)=upper(@Schema)

	open FirstCursor 
	--fetch first from FirstCursor
	fetch next from FirstCursor into @keycols
	while @@FETCH_STATUS=0
	begin 
		if (@count>0) begin
			set @cols=concat(@cols,' , ');
		end 
		set  @cols=concat( @cols,'a.',@keyCols);
		set @count=1;
			
			
		fetch next from FirstCursor into @keycols
	end
	close FirstCursor 
	deallocate FirstCursor 
	IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = @schema 
                 AND  TABLE_NAME = @TableCopyName))
BEGIN
    set @sql = concat('drop table ', @PnLTable)
	execute sp_executesql @sql;
END
	
	set @sql = concat('Select * into ', @PnLTable, ' from ', @PnLTableOrig ,' a') 
	execute sp_executesql @sql;
	--Add indexes and keys
	set @sql =concat('CREATE NONCLUSTERED INDEX [INDEX_1] ON ',@PnlTable,' 
		(
			[EXTRACTION_ID] ASC,
			[VALID_FROM] ASC,
			[VALID_TO] ASC
		)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
		
		CREATE NONCLUSTERED INDEX [INDEX_2] ON ',@PnlTable,' 
		(
			[EXTRACTION_ID] ASC,
			[DEAL_NUM] ASC,
			[VALID_FROM] ASC,
			[VALID_TO] ASC
		)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
		
		CREATE NONCLUSTERED INDEX [INDEX_3] ON ',@PnlTable,'
		(
			[EXTRACTION_ID] ASC,
			[DEAL_NUM] ASC,
			[DEAL_LEG] ASC,
			[VALID_FROM] ASC,
			[VALID_TO] ASC
		)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
		
		CREATE NONCLUSTERED INDEX [INDEX_4] ON ',@PnlTable,' 
		(
			[VALID_FROM] ASC,
			[VALID_TO] ASC,
			[EXTRACTION_ID] ASC
		)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
		
		ALTER TABLE ',@PnlTable,'  ADD PRIMARY KEY CLUSTERED 
		(
			[PRIMARYKEY] ASC
		)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
		')

print @sql;
	execute sp_executesql @sql;
	select @FromDate= max(l.system_date) from endur.vw_dw_extraction_log l  where l.RUN_TYPE=1 and l.DB_STATUS=1 ;	
	--execute('select ' + @PnLRows + '= count(*) from '+@PnLTable);  /* endur.vw_pnl_realized;  */
		/*This should be re written */
	select @PnLRows = count(*) from endur.vw_pnl_realized; 
	/*Rows that are missing - reversal or deleted - only deleted needs action */
		print '/*deleted deals */'
-- sql #1
		set @sql=concat('INSERT INTO ', @PnLDeletedDeal, ' with (TABLOCK)  select distinct a.tran_num from ',@PnLTable,' a inner join endur.vw_ab_tran b on a.TRAN_NUM=b.TRAN_NUM and b.TRAN_STATUS not in (3,4)')
		print @sql;
		execute sp_executesql @sql;
-- sql #2
		set @sql=concat('INSERT INTO ', @PnLhistTable, ' with (TABLOCK)   select a.primarykey,',@cols,', a.VALID_FROM ,IIF(a.VALID_FROM>''',DATEADD(day,-1,@FromDate),''',a.VALID_FROM,''',DATEADD(day,-1,@FromDate),''')  from ',@PnLTable,' a  inner join ',@PnLDeletedDeal ,' b on a.TRAN_NUM=b.TRAN_NUM' )
		print @sql;
		execute sp_executesql @sql;
-- sql #3
		set @sql=concat('Delete a  with (TABLOCK) from ',@PnLTable,' a inner join ',@PnLDeletedDeal,' b  on a.TRAN_NUM=b.TRAN_NUM')
		print @sql;
		execute sp_executesql @sql;
		/* Empty vw_pnl_realized table - first insert */
		if @PnLrows = 0 begin
-- sql #4
			set @sql=concat('INSERT INTO ', @PnLTableOrig, ' with (TABLOCK)  select NEXT VALUE FOR dbo.SEQ_PRIMARYKEY1 , ', @cols,',b.SYSTEM_DATE,''',@OpenDate,''' from ',  @curTable,' a inner join endur.view_vw_extraction_log b on a.extraction_id=b.extraction_id and  b.SCENARIO_SEQ_NUM = 1 and b.run_type=1 and db_status=1'  ); 
			print 'filling empty Realized PnL table';
			print @sql;
			execute sp_executesql @sql;
		END;
		ELSE BEGIN /* We already do have rows in PnL and need to copy it somwhere else to compare */

			print 'filling  Realized PnL temp table';
-- sql #5
			set @sql = concat('drop table ', @PnLTableTemp)
			execute sp_executesql @sql;
			set @sql=concat('SELECT  NEXT VALUE FOR dbo.SEQ_PRIMARYKEY1 primarykey, ', @cols,',b.system_date VALID_FROM,''',@OpenDate,''' VALID_TO,b.SYSTEM_DATE into ', @PnLTableTemp ,' from ',  @curTable, ' a inner join endur.view_vw_extraction_log b on a.extraction_id=b.extraction_id'  ); 
			print @sql;
			execute sp_executesql @sql;
			
		END;

		print '/*  New Rows - insert the row id from the temp */'
		print 'update table _T'	
-- sql #6
		set @sql = concat('insert into ', @PnLTableTemp_T,' with (TABLOCK)  ( PRIMARYKEY_NEW,IS_NEW ) select s.primarykey,iif(s.VALID_FROM>=''',@FromDate,''',1,2) from ',@PnLTableTemp,' s left join ',@PnLTable,' t on ', @where_Same, ' where t.primarykey is null');
		print @sql;
		execute sp_executesql @sql;

		Set @v_Other_Comments = concat('inserting new rows ',@sql);       
		exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;
		select @PnLNewRows = count(*) from endur.vw_pnl_realized_temp_T1;
		if @PnLNewRows > 0 begin
-- sql #7
			set @sql=concat('INSERT INTO ', @PnLTable, ' with (TABLOCK)  select PRIMARYKEY, ', @cols,', a.VALID_FROM, a.VALID_TO from ',@PnLTableTemp,' a inner join  ',@PnLTableTemp_T,' b on a.PRIMARYKEY= b.PRIMARYKEY_NEW and IS_NEW=1' ); 
			print @sql;
			execute sp_executesql @sql;
       end;

		print '/* Rows that are updated */'
-- sql #8
		set @sql = concat('insert into ', @PnLTableUpd,' ( PRIMARYKEY_NEW_ROW, PRIMARYKEY_OLD_ROW, VALID_FROM_NEW, VALID_TO_NEW, VALID_FROM_OLD ,VALID_TO_OLD, IS_NEWER ) 
		select s.primarykey, t.primarykey,s.VALID_FROM,s.VALID_TO,T.VALID_FROM,t.VALID_TO,iif(s.VALID_FROM >= t.VALID_FROM,1,2) from ',@PnLTableTemp,' s, ',@PnLTable,' t where ', @Where_Same,@values );
		print @sql;
		Set @v_Other_Comments = concat('updating rows ',@sql);       
	--	exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;
		execute sp_executesql @sql;
-- sql #8a
		select @PnLRows = count(*) from endur.vw_pnl_realized_temp; 
		if @PnLrows = 0 begin
		set @sql = concat('insert into ', @PnLTableUpd,' ( PRIMARYKEY_NEW_ROW, PRIMARYKEY_OLD_ROW, VALID_FROM_NEW, VALID_TO_NEW, VALID_FROM_OLD ,VALID_TO_OLD, IS_NEWER ) 
		select null, t.primarykey,null,null,T.VALID_FROM,t.VALID_TO,1 from ',@PnLTable,' t left join ',@PnLTableTemp,' s ON ', @Where_Same,' WHERE s.primarykey is null' );
		print @sql;
		Set @v_Other_Comments = concat('updating rows ',@sql);       
	--	exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;
		execute sp_executesql @sql;
		end;
		select @PnLRows = count(*) from endur.vw_pnl_realized_temp_Update;
		if @PnLRows > 0 begin
			print '	/* insert into hist table */'
-- sql #9
			set @sql= concat('insert into ', @PnLhistTable,' select a.primarykey, ',@cols,', a.VALID_FROM, dateadd(day,-1, u.VALID_FROM_NEW) from ',
			@PnLTable,' a inner join ',@PnLTableUpd,' u on a.primarykey= u.PRIMARYKEY_OLD_ROW  and u.IS_NEWER=1' );
			--print 'Insert for hist tabell';
			Set @v_Other_Comments = concat('inserting in hist table ',@sql);       
			--      exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;
			print @sql;
			execute sp_executesql @sql;
					
			print '	/* delete from realized_table */'
-- sql #10
			set @sql= concat('delete a from ', @PnLTable,' a inner join ',@PnLTableUpd,' b  on a.primarykey=b.PRIMARYKEY_OLD_ROW and IS_NEWER=1');
			--print 'delete for realisert tabell';
			print @sql;
			execute sp_executesql @sql;
			Set @v_Other_Comments = concat('delete for realisert tabell ',@sql);       
			--	exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;										
			print '	/* insert the new rows into the realized table */'
-- sql #11
			set @sql = concat('insert into ',@PnLTable,' select a.primarykey,',@cols,', a.VALID_FROM, a.VALID_TO from ',@PnLTableTemp,' a inner join ',@PnLTableUpd,' b on b.primarykey_new_row=a.primarykey and IS_NEWER=1 ');
			print 'Insert for realisert tabell';
			print @sql;
			execute sp_executesql @sql;
		END;
-- sql #18
			set @sql = concat('update t set t.valid_from=s.valid_from from ',@PnLTable,' t inner join ',@PnLTableTemp, ' s on ',@Where_Same,@values_equal,' and s.valid_from<t.valid_from')
			print 'Update realized PNL with earlier valid from date';
			print @sql;
			execute sp_executesql @sql;
--------------------------------------

			print '	/* insert reversed deals from historical import into realized table directly*/'
-- sql #12
			set @sql=concat('INSERT INTO ', @PnLTable, ' with (TABLOCK)  select a.PRIMARYKEY, ', @cols,', a.VALID_FROM, a.VALID_TO from ',@PnLTableTemp,' a  inner join ',@PnLTableTemp_T,' b on a.PRIMARYKEY=b.PRIMARYKEY_NEW AND IS_NEW=2 inner join endur.vw_ab_tran t on a.tran_num=t.tran_num and t.CURRENT_FLAG=1 and t.TRAN_STATUS in (3,4)  ' ); 
			print @sql;
			execute sp_executesql @sql;
			print '	/* identify already reported deals new deals from historical import that already exist in historical table*/'
-- sql #13
			set @sql=concat('Delete a  with (TABLOCK) from  ', @PnLTableTemp_T, ' a inner join ' ,@PnLTableTemp ,' s  on a.PRIMARYKEY_NEW=s.PRIMARYKEY inner join ',  @PnLHistTable, ' t on ',@Where_Same,@values_equal,@Valid)
			print @sql;
			execute sp_executesql @sql;
			print '	/* identify existing deals in the hist table */'
			set @sql = concat('truncate table ', @PnLTableUpd)
			print @sql;
			execute sp_executesql @sql;
-- sql #14
			set @sql = concat('insert into ', @PnLTableUpd,'  with (TABLOCK) ( PRIMARYKEY_NEW_ROW, PRIMARYKEY_OLD_ROW, VALID_FROM_NEW, VALID_TO_NEW, VALID_FROM_OLD ,VALID_TO_OLD, IS_NEWER ) 
			select s.primarykey, t.primarykey,s.VALID_FROM,s.VALID_TO,T.VALID_FROM,t.VALID_TO,iif((s.VALID_FROM >= t.VALID_FROM) AND (t.VALID_TO > s.VALID_FROM),1,2) from ',@PnLTableTemp,' s, ',@PnLHistTable,' t where ', @Where_Same,@values );
			print @sql;
			execute sp_executesql @sql;
-- sql #19
			set @sql = concat('update t set t.valid_from=s.valid_from from ',@PnLhistTable,' t inner join ',@PnLTableTemp, ' s on ',@Where_Same,@values_equal,' and s.valid_from<t.valid_from')
			print 'Update realized PNL with earlier valid from date';
			print @sql;
			execute sp_executesql @sql;
-- sql #15
			set @sql = concat('update  a with (TABLOCK) set a.VALID_TO = dateadd(day,-1,b.VALID_FROM_NEW) from ', @PnLHistTable,' a inner join ',@PnLTableUpd ,' b on b.IS_NEWER=1 and a.PRIMARYKEY=b.primarykey_old_row');
			print @sql;
			execute sp_executesql @sql;
-- sql #16
			set @sql= concat('insert into ', @PnLhistTable,' select a.primarykey, ',@cols,', a.VALID_FROM, iif(u.IS_NEWER=1,u.VALID_TO_OLD,a.VALID_FROM) from ',
			@PnLTable,' a inner join ',@PnLTableUpd,' u on a.primarykey=u.PRIMARYKEY_OLD_ROW ' );
			print @sql;
			execute sp_executesql @sql;
			print '/* insert deals from historical import into historical table directly*/'

-- sql #17
			set @sql=concat('INSERT INTO ', @PnLHistTable, ' with (TABLOCK)  select a.PRIMARYKEY, ', @cols,', a.VALID_FROM, a.VALID_FROM from ',@PnLTableTemp,' a  inner join ',@PnLTableTemp_T,' b on a.PRIMARYKEY=b.PRIMARYKEY_NEW AND b.IS_NEW=2 inner join endur.vw_ab_tran t on a.tran_num=t.tran_num and t.CURRENT_FLAG=1 and t.TRAN_STATUS not in (3,4)  ' ); 
			print @sql;
			execute sp_executesql @sql;		
		
		
					/*	set @sql= concat('insert into ',@PnLMissingDeal,'(PRIMARYKEY,DEAL_NUM,RESULT_TYPE ) select distinct PRIMARYKEY,deal_num,result_type from ',@PnLTable,' left join
						(select primarykey,deal_num,result_type from ',@PnLTableTemp,
						' where TRAN_NUM not in (select t.tran_num from endur.vw_ab_tran t where t.CURRENT_FLAG=1 and t.TRAN_STATUS not in (3,4)) )')*/
						
				/*		print @sql;
					--	execute sp_executesql @sql;
					/* this is to handle if somepne has deleted a period back in time for a valid deal */

					/*remove from realised if deleted  - move to hist table and delete from PnLTable*/
					print ('remove from realized if deal is deleted');
				set @sql= concat('insert into ',@PnLhistTable,' select a.primarykey,',@cols,', a.VALID_FROM ''',DATEADD(day,-1,@FromDate),''',  from ',@PnLTable,' a where exists (select deal_num,RESULT_TYPE from ',@PnLTable,')');
				    print @sql;
					--execute sp_executesql @sql;
		--			set @sql= concat('delete from ',@PnLTable,' where exists (select primarykey, deal_num,RESULT_TYPE from ',@PnLTable,')');
		--			print @sql;
		--			execute sp_executesql @sql;
		*/
		--set @sql=concat('exec sp_rename ''', @PnLTableOrig,''', ''',@TableOrigName,'_del''')
		set @sql = concat('drop table ', @PnLTableOrig)
			execute sp_executesql @sql;
		set @sql=concat('exec sp_rename ''', @PnLTable,''', ''',@TableOrigName,'''')
		EXECUTE sp_executesql @sql;
		set @sql = concat('update ', @ProcessTable,' set STATUS=0,  END_TIME=getdate() where PROCESS=''',@Process,'''')
		execute sp_executesql @sql;




END
GO
