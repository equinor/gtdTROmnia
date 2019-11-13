/****** Object:  View [endur].[view_hist_curr_extration_id_mapping]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [endur].[view_hist_curr_extration_id_mapping] as
select a.extraction_id HIST_EXTRACTION_ID, b.extraction_id EXTRACTION_ID from endur.view_union_extraction_log a inner join endur.vw_dw_extraction_log b  on b.PFOLIO=a.PFOLIO and b.RUN_TYPE=a.RUN_TYPE
and b.SCENARIO_NAME=a.SCENARIO_NAME and b.SCENARIO_SEQ_NUM=a.SCENARIO_SEQ_NUM and b.SIM_DEF_ID=a.SIM_DEF_ID
GO
