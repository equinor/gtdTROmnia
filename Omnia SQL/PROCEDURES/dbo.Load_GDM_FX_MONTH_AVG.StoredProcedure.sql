/****** Object:  StoredProcedure [dbo].[Load_GDM_FX_MONTH_AVG]    Script Date: 13/11/2019 14:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================

CREATE procedure [dbo].[Load_GDM_FX_MONTH_AVG]

       @p_SOURCE NVARCHAR(255)

AS
BEGIN
       SET IMPLICIT_TRANSACTIONS ON;
       SET NOCOUNT ON;

       -- Logging variable
       DECLARE 
             @v_Process NVARCHAR(255) = 'LOAD GDM FX MONTH AVG',
             @v_Task NVARCHAR(40) = 'MAIN',
             @v_Other_Comments NVARCHAR(4000) = '',

             @Rad_Max_Date DATE,


             @Num_Rows_Target INT,
             @Num_Rows_Source INT,
             @Num_Rows_Updated INT,
             @Num_Rows_New INT,

             @OpenDate DATE = '9999-12-31',
             @System_Date DATE = Convert(Date,GetDate()),
             
             @sql NVARCHAR(max),
             @ParamDef NVARCHAR(max);


             Set @v_Other_Comments = 'Running dbo.Load_GDM_FX_MONTH_AVG';
               
	exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;

       /************************************
         Fill Temp tables
       ************************************/
       DECLARE @v_Import_ID BIGINT;

       Set @v_Import_ID = NEXT VALUE FOR dbo.SEQ_IMPORT_ID;

       CREATE TABLE #TEMP_NEW
       (
             PRIMARYKEY_NEW BIGINT 
       );

       
       CREATE TABLE #TEMP_UPDATED
       (
             PRIMARYKEY_OLD BIGINT,
             PRIMARYKEY_NEW BIGINT
       );




       CREATE TABLE #TEMP_SOURCE
       (
               PRIMARYKEY        BIGINT,
               FX_Product        NVARCHAR(255),
               FX_Code           NVARCHAR(20),
               FX_To                           NVARCHAR(10),
               FX_From           NVARCHAR(10),
               FX_Date           Date,
               FX_Unit                  NVARCHAR(20),
               FX_Multiplicator  Float,
               VALID_FROM        Date,
               VALID_TO                 Date,
               IMPORT_ID                BIGINT,
               LOADTIME                 DateTime default GetDate(),
               RUNDATE                  DATE default Convert(Date,GetDate())
       );




             /**************************************
                    Fill Source Table
             ***************************************/

             Set @v_Other_Comments = 'Insert into source table';
               
             exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;

             truncate table #TEMP_SOURCE;

             commit transaction;

             -- Create temp Source Table from datahub
             set @sql =
             N'
             Insert into #TEMP_SOURCE
             (
                      PRIMARYKEY,
                      FX_Product,
                      FX_Code,
                      FX_To,
                      FX_From,
                      FX_Date,
                      FX_Unit,
                      FX_Multiplicator,
                      IMPORT_ID,
                    VALID_FROM, 
                    VALID_TO 
             )
             Select 
                     NEXT VALUE FOR dbo.SEQ_PRIMARYKEY,
                    fx.Product,
                    substring(fx.Product,8,6),
                      substring(fx.Product,8,3),
                      substring(fx.Product,11,3),
                      format(DateAdd(Day, fx.Pricing_Period-2, ''1900-01-01''),''yyyy-MM-dd''),
                    fx.Price_Unit,
                    convert(float,replace(fx.Price,'';'','''')),
                    {IMPORT_ID},
                    ''{System_Date}'' as VALID_FROM, 
                    ''{OpenDate}'' as VALID_TO 
             From {SOURCE} fx
             Where DateAdd(Day, fx.Pricing_Period-2, ''1900-01-01'') <= EOMONTH(GetDate(),-1)';


             set @sql = REPLACE(@sql,'{IMPORT_ID}',Convert(NVARCHAR(20),@v_Import_ID));
             set @sql = REPLACE(@sql,'{OpenDate}',Convert(NVARCHAR(20),@OpenDate));
             set @sql = REPLACE(@sql,'{System_Date}',Convert(NVARCHAR(20),@System_Date));
             set @sql = REPLACE(@sql,'{SOURCE}',@p_SOURCE);


             exec (@sql);

             commit transaction;

             Select 
                    @Num_Rows_Source = count(*)
             From
                    #TEMP_SOURCE;

       Set @v_Other_Comments = 'Rows in Source: ' + Convert(NVARCHAR(10),@Num_Rows_Source);

                    exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;


             /**************************** 
                    UPDATES 
             ****************************/

             Set @v_Other_Comments = 'Insert into update table';
               
             exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;


             truncate table #TEMP_UPDATED;

             commit transaction;

             INSERT INTO #TEMP_UPDATED
             (
                    PRIMARYKEY_NEW, 
                    PRIMARYKEY_OLD
             )
             Select distinct s.primarykey as New, t.primarykey as Old
             From #TEMP_SOURCE s, endur.GDM_FX_MONTH_AVG t
             Where 
                    -- Keys
                    s.FX_Code = t.FX_Code
                    and s.FX_Date = t.FX_Date
                    -- Values
                    and (abs(s.FX_Multiplicator - t.FX_Multiplicator) > 0
                           )
                    ;

             --commit transaction;

             Select 
                    @Num_Rows_Updated = count(*)
             From
                    #TEMP_UPDATED;

             /********************************
                    New Rows  (Only in Source)
             *********************************/

             Set @v_Other_Comments = 'Insert into new table';
               
             exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;

             truncate table #TEMP_NEW;

             commit transaction;

             INSERT INTO #TEMP_NEW
                    (
                           PRIMARYKEY_NEW
                    )
             Select s.primarykey
             From #TEMP_SOURCE s
             Where not exists 
             (
                    Select 1 
                    From endur.GDM_FX_MONTH_AVG t
                    Where t.FX_Code = s.FX_Code
                    and t.FX_Date = s.FX_Date
             );
                                  
             commit transaction;

             Select 
                    @Num_Rows_New = count(*)
             From
                    #TEMP_NEW;





             /********************************************************
                    Process updates
             *********************************************************/
             If (@Num_Rows_Updated > 0)
             BEGIN

                    -- Move old to History
                    Insert into endur.hist_GDM_FX_MONTH_AVG
                           (PRIMARYKEY,
                           FX_Product,
                           FX_Code, 
                           FX_To,
                           FX_From,
                           FX_Date,
                           FX_Unit,
                           FX_Multiplicator,
                           VALID_FROM,
                           VALID_TO,
                           IMPORT_ID,
                           LOADTIME,
                           RUNDATE
                           )
                    Select
                           t.PRIMARYKEY,
                           t.FX_Product,
                           t.FX_Code, 
                           t.FX_To,
                           t.FX_From,
                           t.FX_Date,
                           t.FX_Unit,
                           t.FX_Multiplicator,
                           t.VALID_FROM,
                           --Case When DateAdd(Day,-1,Convert(Date,GetDate())) > t.VALID_FROM Then  DateAdd(Day,-1,Convert(Date,GetDate())) else t.VALID_FROM End,  --VALID_TO,
                           Case When DateAdd(Day,-1,GetDate()) > t.VALID_FROM Then  DateAdd(Day,-1,GetDate()) else t.VALID_FROM End,  --VALID_TO,
                           t.IMPORT_ID,
                           t.LOADTIME,
                           t.RUNDATE
                    From endur.GDM_FX_MONTH_AVG t, #TEMP_UPDATED u
                    Where t.PRIMARYKEY = u.PRIMARYKEY_OLD;

                    -- Insert new values
                    Insert into endur.GDM_FX_MONTH_AVG
                    Select s.*
                    From #TEMP_SOURCE s, #TEMP_UPDATED u
                    Where s.PRIMARYKEY = u.PRIMARYKEY_NEW;


                    Commit Transaction;

             END
             ELSE
             BEGIN
                    Set @v_Other_Comments = 'No updated rows';

                    exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;

             END;






             /********************************************************
                    Process new rows
             *********************************************************/
             If (@Num_Rows_New > 0)
             BEGIN
                    

                    Insert into endur.GDM_FX_MONTH_AVG
                    Select s.*
                    From #TEMP_SOURCE s, #TEMP_NEW n
                    Where s.PRIMARYKEY = n.PRIMARYKEY_NEW;

                    Commit Transaction;

             END
             ELSE
             BEGIN
                    Set @v_Other_Comments = 'No new rows';
               
                    exec dbo.process_log @p_Process = @v_Process, @p_Task = @v_Task, @p_Other_Comments = @v_Other_Comments;
             END;


END;
GO
