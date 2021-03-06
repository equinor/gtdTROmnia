/****** Object:  Table [endur].[vw_gas_phys_pipelines]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_gas_phys_pipelines](
	[PIPELINE_ID] [int] NULL,
	[PIPELINE_NAME] [varchar](32) NULL,
	[INS_TYPE] [int] NULL,
	[BUNIT] [int] NULL,
	[LENTITY] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[DNS_NUMBER] [varchar](32) NULL,
	[CASHOUT] [int] NULL,
	[FUEL_CALC_CODE] [int] NULL,
	[GISB] [int] NULL,
	[ACTIVE] [int] NULL,
	[ACTIVE_START_DATE] [date] NULL,
	[ACTIVE_END_DATE] [date] NULL,
	[VERSION_NUM] [int] NULL,
	[REGION_ID] [int] NULL,
	[UNIT] [int] NULL,
	[OWNERSHIP] [int] NULL,
	[STANDARD_PRESSURE_BASE] [float] NULL,
	[ENFORCE_UNIQUE_METER_ID] [int] NULL,
	[ALLOC_SCRIPT_ID] [int] NULL,
	[MEASUREMENT_IMPORT_SCRIPT_ID] [int] NULL,
	[VOLUME_PRECISION] [int] NULL,
	[DAY_START_TIME] [int] NULL,
	[PIPE_DESCRIPTION] [varchar](256) NULL,
	[TIME_ZONE] [int] NULL,
	[TRANSPORT_CLASS] [int] NULL,
	[PROCESSING_TYPE] [int] NULL,
	[ALLOW_PATHING] [int] NULL,
	[ENFORCE_UNIQUE_GEO_LOC_ID] [int] NULL,
	[CONFIG_FILENAME] [varchar](256) NULL,
	[ENDUR_NOM_TYPE] [int] NULL,
	[PIPELINE_ALLOW_FUEL_GAIN] [int] NULL,
	[ALLOW_OPTIONAL_PATH] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_gas_phys_pipelines]
(
	[PIPELINE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
