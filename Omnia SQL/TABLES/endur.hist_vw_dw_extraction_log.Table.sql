/****** Object:  Table [endur].[hist_vw_dw_extraction_log]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_dw_extraction_log](
	[EXTRACTION_ID] [int] NULL,
	[SIM_RUN_ID] [int] NULL,
	[SIM_DEF_ID] [int] NULL,
	[SCENARIO_SEQ_NUM] [int] NULL,
	[REVISION] [int] NULL,
	[ROW_CREATION] [date] NULL,
	[SYSTEM_DATE] [date] NULL,
	[RUN_TYPE] [int] NULL,
	[SIM_DEF_NAME] [varchar](32) NULL,
	[SCENARIO_NAME] [varchar](32) NULL,
	[PFOLIO] [int] NULL,
	[DB_STATUS] [int] NULL,
	[EXTRACTION_STATUS] [int] NULL,
	[EXTRACTION_TIMESTAMP] [datetime] NULL,
	[ETL_STATUS] [int] NULL,
	[ETL_TIMESTAMP] [datetime] NULL,
	[DB_TIMESTAMP] [datetime] NULL,
	[DB_TIMESTAMP_H] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_dw_extraction_log]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_EXTR_ID_SCEN_SEQ_NUM]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_EXTR_ID_SCEN_SEQ_NUM] ON [endur].[hist_vw_dw_extraction_log]
(
	[EXTRACTION_ID] ASC,
	[SCENARIO_SEQ_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
