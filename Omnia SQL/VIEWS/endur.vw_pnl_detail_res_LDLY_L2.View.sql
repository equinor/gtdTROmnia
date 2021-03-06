/****** Object:  View [endur].[vw_pnl_detail_res_LDLY_L2]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [endur].[vw_pnl_detail_res_LDLY_L2]
AS
select
r.*  from endur.vw_pnl_detail_res_LDLY  r 
	inner join (select max(system_date) max_date from endur.vw_dw_extraction_log where run_type=1 and db_status=1 ) b on 1=1

  where
  		
	r.END_DATE >=dbo.Cut_Off_Date(b.max_date)
	and  r.In_Official_PnL='Yes' 
	
/*		 r.end_date >= dateadd(mm,-3,(dateadd(year,datediff(yyyy,0,(b.max_date)),0)))
		 and r.end_date <  dateadd(mm,48,(dateadd(year,datediff(yyyy,0,(b.max_date)),0)))

	 */

GO
