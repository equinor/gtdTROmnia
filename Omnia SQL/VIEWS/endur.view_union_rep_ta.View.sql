/****** Object:  View [endur].[view_union_rep_ta]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [endur].[view_union_rep_ta] as
select TA_ID,TA_NAME, DATEADD(yy, DATEDIFF(yy, 0, DB_TIMESTAMP), 0) VAILD_FROM, DB_TIMESTAMP from endur.vw_vw_rep_ta
union
select a.TA_ID,a.TA_NAME, DATEADD(yy, DATEDIFF(yy, 0, a.DB_TIMESTAMP), 0), a.DB_TIMESTAMP_H from endur.hist_vw_vw_rep_TA a inner join 
 (select max(db_timestamp_H) MAX_TS,TA_ID from endur.hist_vw_vw_rep_TA group by TA_ID) b on  a.DB_TIMESTAMP_H=MAX_TS and a.TA_ID=b.TA_ID where concat(a.TA_ID, DATEADD(yy, DATEDIFF(yy, 0, a.DB_TIMESTAMP), 0)) not in (select concat( TA_ID, DATEADD(yy, DATEDIFF(yy, 0, DB_TIMESTAMP), 0)) from endur.vw_vw_rep_TA) 
GO
