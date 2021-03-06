/****** Object:  Table [endur].[vw_user_dw_scenario_info]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_user_dw_scenario_info](
	[EXTRACTION_ID] [int] NULL,
	[SIM_DEF_ID] [float] NULL,
	[SIM_DEF_NAME] [varchar](32) NULL,
	[SCENARIO_ID] [float] NULL,
	[SCENARIO_NAME] [varchar](32) NULL,
	[CURRENCY_ID] [float] NULL,
	[SCENARIO_CURRENCY] [varchar](32) NULL,
	[BMO] [varchar](32) NULL,
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_user_dw_scenario_info]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
