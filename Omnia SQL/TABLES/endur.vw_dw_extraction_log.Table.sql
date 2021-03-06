/****** Object:  Table [endur].[vw_dw_extraction_log]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_dw_extraction_log](
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
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_dw_extraction_log]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[vw_dw_extraction_log] ADD  DEFAULT (getdate()) FOR [DB_TIMESTAMP]
GO
