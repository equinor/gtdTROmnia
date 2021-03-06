/****** Object:  StoredProcedure [dbo].[processSwitchTableNames]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[processSwitchTableNames]
(
        @TableName varchar(50),
		@Schema varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	declare @stagingTable  varchar(100);
	declare @curTable  varchar(100);
	declare @sql  nvarchar(max);
	declare @scriptstart datetime;
	declare @cnt as int

	set @TableName=lower(@TableName)
	set @stagingTable=concat(@Schema,'.stag_',@TableName);
	set @curTable=concat(@Schema,'.',@TableName);
    -- Insert statements for procedure here
	update dbo.refresh_config set switch_name=1 where upper(table_name)=upper(''+@TableName+'')

	-- checking current db tables
	select @cnt=count(a.table_name)  from information_schema.tables a where a.TABLE_SCHEMA=@Schema and table_name=+concat('temp_',@TableName)
	if (@cnt = 1) begin
		select @cnt=count(a.table_name)  from information_schema.tables a where a.TABLE_SCHEMA=@Schema and table_name=concat('stag_',@TableName)
		if (@cnt = 0) begin
			set @sql=concat('exec sp_rename ''',@Schema,'.temp_',@TableName,''', ''stag_',@TableName,'''')
			EXECUTE sp_executesql @sql;
		end
		select @cnt=count(a.table_name) from information_schema.tables a where a.TABLE_SCHEMA=@Schema and table_name=@TableName
		if (@cnt = 0) begin
			set @sql=concat('exec sp_rename ''',@Schema,'.temp_',@TableName,''', ''',@TableName,'''')
			EXECUTE sp_executesql @sql;
		end
		-- if unable to change name the temp table will still exist, exit procedure
		select  @cnt=count(a.table_name) from information_schema.tables a where a.TABLE_SCHEMA=@Schema and table_name=concat('temp_',@TableName)
		if (@cnt = 1) begin
			return
		end
	end
	-- end Check

    set @sql=concat('exec sp_rename ''',@stagingTable,''', ''temp_',@TableName,'''')
	EXECUTE sp_executesql @sql;
	select @cnt=count(a.table_name) from information_schema.tables a where a.TABLE_SCHEMA=@Schema and table_name=concat('temp_',@TableName)
	
	if (@cnt = 1) begin
		set @sql=concat('exec sp_rename ''',@curTable,''', ''stag_',@TableName,'''')
		EXECUTE sp_executesql @sql;
		select @cnt=count(a.table_name) from information_schema.tables a where a.TABLE_SCHEMA=@Schema and table_name=concat('stag_',@TableName)
		if (@cnt = 1) begin
			set @sql=concat('exec sp_rename ''',@Schema,'.temp_',@TableName,''', ''',@TableName,'''')
			EXECUTE sp_executesql @sql;
			select @cnt=count(a.table_name)  from information_schema.tables a where a.TABLE_SCHEMA=@Schema and table_name=''+@TableName+''	
			if (@cnt = 1) begin
				set @sql=concat('update dbo.refresh_config set switch_name=0 where upper(table_name)=upper(''',@TableName,''')')
				EXECUTE sp_executesql @sql;
			end
		else
			set @sql=concat('exec sp_rename ''',@Schema,'.temp_',@TableName,''','' stag_''',@TableName)
			EXECUTE sp_executesql @sql;
		end
	end
END
GO
