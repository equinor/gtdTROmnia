/****** Object:  StoredProcedure [dbo].[show_table_row_count]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[show_table_row_count]
(
    -- Add the parameters for the stored procedure here
   @Schema varchar(50)
)
AS
BEGIN
  declare c_tables cursor fast_forward for
select a.table_name from information_schema.tables a where a.TABLE_SCHEMA=@Schema order by a.TABLE_NAME

open c_tables
declare @tablename varchar(255)
declare @stmt nvarchar(2000)
declare @rowcount int
fetch next from c_tables into @tablename

while @@fetch_status = 0
begin

    select @stmt = 'select @rowcount = count(*) from ' +@Schema + '.' + @tablename

    exec sp_executesql @stmt, N'@rowcount int output', @rowcount=@rowcount OUTPUT

    print N'table: ' + @tablename + ' has ' + convert(nvarchar(1000),@rowcount) + ' rows'

    fetch next from c_tables into @tablename

end

close c_tables
deallocate c_tables
END
GO
