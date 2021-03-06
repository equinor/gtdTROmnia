/****** Object:  View [endur].[view_union_rep_bu]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [endur].[view_union_rep_bu] as
select BU_ID,BU_NAME, DATEADD(yy, DATEDIFF(yy, 0, DB_TIMESTAMP), 0) VAILD_FROM, DB_TIMESTAMP from endur.vw_vw_rep_bu
union
select a.bu_ID,a.bu_NAME, DATEADD(yy, DATEDIFF(yy, 0, a.DB_TIMESTAMP), 0), a.DB_TIMESTAMP_H from endur.hist_vw_vw_rep_bu a inner join 
 (select max(db_timestamp_H) MAX_TS,BU_ID from endur.hist_vw_vw_rep_bu group by BU_ID) b on  a.DB_TIMESTAMP_H=MAX_TS and a.BU_ID=b.BU_ID where concat(a.bu_ID, DATEADD(yy, DATEDIFF(yy, 0, a.DB_TIMESTAMP), 0)) not in (select concat( bu_ID, DATEADD(yy, DATEDIFF(yy, 0, DB_TIMESTAMP), 0)) from endur.vw_vw_rep_bu) 
GO
