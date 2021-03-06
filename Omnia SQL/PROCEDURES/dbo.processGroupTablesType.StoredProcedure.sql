/****** Object:  StoredProcedure [dbo].[processGroupTablesType]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[processGroupTablesType]
(
	@TableName varchar(50),
	@Schema varchar(50),
	@Type int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	declare @histTable  varchar(100);
	declare @childTable  varchar(100);
	declare @masterTable  varchar(100);
	declare @stagingTable  varchar(100);
	declare @curTable  varchar(100);
	declare @keyCols  varchar(MAX);
	declare @keyCol  varchar(MAX);
	declare @sql  nvarchar(max);
	declare @sqlWhere  nvarchar(max);
	declare @count  int;



	declare tableCursor cursor for select a.TABLE_NAME,a.KEY_COLUMNS  from dbo.REFRESH_CONFIG a 
			join dbo.REFRESH_CONFIG b on a.UPDATE_GROUP=b.UPDATE_GROUP and b.TABLE_NAME=@TableName  and a.TABLE_NAME<>@TableName and a.GROUP_OR_PRIORITY=@Type
	open tableCursor 
	set @masterTable=concat(@Schema,'.',@TableName);
	fetch next from tableCursor into @childTable, @keyCols
	while @@FETCH_STATUS=0
		begin 
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
		set  @sqlWhere=concat(@sqlWhere,' where tbl2.',@keyCol,' is NULL');
		set @stagingTable=concat(@Schema,'.stag_',@childTable);
		set @histTable=concat(@Schema,'.hist_',@childTable);
		set @curTable=concat(@Schema,'.',@childTable);
		set @sql=concat('insert into ',@histTable,' with(TABLOCK) select tbl1.* from ',@curTable,' tbl1 left join  ',@masterTable,' tbl2 on ',@sqlWhere)
		print @sql;
		EXECUTE sp_executesql @sql;
		set @sql=concat('delete tbl1 from ',@curTable,' tbl1 with(TABLOCK) left join  ',@masterTable,' tbl2 on ',@sqlWhere)
		print @sql;
		EXECUTE sp_executesql @sql;
		fetch next from tableCursor into @childTable, @keyCols
	end
	close tableCursor 
	deallocate tableCursor 
END
GO
