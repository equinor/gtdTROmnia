/****** Object:  StoredProcedure [dbo].[processLastModRep]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [dbo].[processLastModRep]
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
	declare @curTable  varchar(100);
	declare @keyCols  varchar(MAX);
	declare @keyCol  varchar(MAX);
	declare @sql  nvarchar(max);
	declare @sqlWhere  nvarchar(max);
	declare @count  int;
	set @stagingTable=concat(@Schema,'.stag_',@TableName);

	set @curTable=concat(@Schema,'.',@TableName);
	Select  @keyCols=KEY_COLUMNS  from [dbo].[REFRESH_CONFIG] where TABLE_NAME=@TableName;
	print @keyCols
	set @sqlWhere='';
	set @count=0;
	while len(@keyCols) > 0
	begin
	--print left(@S, charindex(',', @S+',')-1)
		if (@count>0) begin
			set @sqlWhere=concat(@sqlWhere,' AND ');
		end 
		set @keyCol= trim(left(@keyCols, charindex(',', @keyCols+',')-1));
		set  @sqlWhere=concat( @sqlWhere,' tbl1.',@keyCol,'= tbl2.',@keyCol);
		set @keyCols = stuff(@keyCols, 1, charindex(',', @keyCols+','), '');
		set @count=@count+1;
	end

	
	EXECUTE sp_executesql @sql;
	set @sql=concat('DELETE tbl1 FROM ', @stagingTable, ' tbl1  inner join ',@curTable,' tbl2 ON (',@sqlWhere,')'); 
	print @sql;EXECUTE sp_executesql @sql;
	set @sql=concat('INSERT INTO ', @curTable, ' with(TABLOCK) select *  from ',@stagingTable); 
	EXECUTE sp_executesql @sql;
END
GO
