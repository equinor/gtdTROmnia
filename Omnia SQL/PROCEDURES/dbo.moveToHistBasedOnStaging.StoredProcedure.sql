/****** Object:  StoredProcedure [dbo].[moveToHistBasedOnStaging]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- 
-- Description: NOT USED
-- =============================================
CREATE procedure [dbo].[moveToHistBasedOnStaging]
(	--NOT USED
    -- Add the parameters for the stored procedure here
	@TableName varchar(50),
	@Schema varchar(50)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	declare @histTable  varchar(100);
	declare @stagingTable  varchar(100);
	declare @curTable  varchar(100);
	declare @keyCols  varchar(MAX);
	declare @keyCol  varchar(MAX);
	declare @sql  nvarchar(max);
	declare @sqlWhere  nvarchar(max);
	declare @count  int;
	declare @count1  int;
	
	set @stagingTable=concat(@Schema,'.stag_',@TableName);
	set @histTable=concat(@Schema,'.hist_',@TableName);
	set @curTable=concat(@Schema,'.',@TableName);
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
	set  @sqlWhere=concat( @sqlWhere,' tbl2.',@keyCol,'=NULL');
	set @sql=concat('insert into ',@histTable,' tbl1.* from ',@curTable,' a left join  ',@stagingTable,' tbl2 on ',@sqlWhere)
	set @sql=concat('delete from ',@curTable,' a left join  ',@stagingTable,' tbl2 on ',@sqlWhere)
END
GO
