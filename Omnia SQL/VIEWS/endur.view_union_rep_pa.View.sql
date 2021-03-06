/****** Object:  View [endur].[view_union_rep_pa]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [endur].[view_union_rep_pa] as
select PA_ID,PA_NAME, DATEADD(yy, DATEDIFF(yy, 0, DB_TIMESTAMP), 0) VAILD_FROM, DB_TIMESTAMP from endur.vw_vw_rep_PA
union
select a.PA_ID,a.PA_NAME, DATEADD(yy, DATEDIFF(yy, 0, a.DB_TIMESTAMP), 0), a.DB_TIMESTAMP_H from endur.hist_vw_vw_rep_PA a inner join 
 (select max(db_timestamp_H) MAX_TS,PA_ID from endur.hist_vw_vw_rep_PA group by PA_ID) b on  a.DB_TIMESTAMP_H=MAX_TS and a.PA_ID=b.PA_ID where concat(a.PA_ID, DATEADD(yy, DATEDIFF(yy, 0, a.DB_TIMESTAMP), 0)) not in (select concat( PA_ID, DATEADD(yy, DATEDIFF(yy, 0, DB_TIMESTAMP), 0)) from endur.vw_vw_rep_PA) 
GO
