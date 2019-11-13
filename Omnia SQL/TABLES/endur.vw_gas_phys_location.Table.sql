/****** Object:  Table [endur].[vw_gas_phys_location]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_gas_phys_location](
	[LOCATION_ID] [int] NULL,
	[LOCATION_NAME] [varchar](32) NULL,
	[ZONE_ID] [int] NULL,
	[LOCATION_TYPE] [int] NULL,
	[INTERCONNECT_LOC_ID] [int] NULL,
	[INDEX_ID] [int] NULL,
	[RATE_ID] [int] NULL,
	[ACTIVE] [int] NULL,
	[PIPELINE_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[DAILY_INDEX_ID] [int] NULL,
	[METER_ID] [varchar](32) NULL,
	[DRN_NUMBER] [varchar](32) NULL,
	[LOC_LONG_NAME] [varchar](80) NULL,
	[VPOOL_ID] [int] NULL,
	[STATE_ID] [int] NULL,
	[LOC_DIR_ID] [int] NULL,
	[CONSTRAINED] [int] NULL,
	[LOC_GROUP_DESC] [varchar](32) NULL,
	[ACTIVE_START_DATE] [date] NULL,
	[ACTIVE_END_DATE] [date] NULL,
	[VERSION_NUM] [int] NULL,
	[IDX_SUBGROUP] [int] NULL,
	[GEO_LOC_ID] [int] NULL,
	[DESC1] [varchar](256) NULL,
	[DESC2] [varchar](256) NULL,
	[DESC3] [varchar](256) NULL,
	[DESC4] [varchar](256) NULL,
	[DESC5] [varchar](256) NULL,
	[DAYS_OFFSET] [int] NULL,
	[TIME_ZONE_ID] [int] NULL,
	[DENSITY_ADJUSTMENT] [float] NULL,
	[MEASURE_GROUP_ID] [int] NULL,
	[MILEPOST] [float] NULL,
	[ALLOCATION_METHOD_ID] [int] NULL,
	[PERCENT_DECLINE] [float] NULL,
	[MIN_ENTRY_CAPACITY] [float] NULL,
	[MIN_EXIT_CAPACITY] [float] NULL,
	[VPOOL_ALT_ID] [int] NULL,
	[INDEX_ALT_ID] [int] NULL,
	[FACILITY_ID] [int] NULL,
	[NETWORK_PATH_ID] [int] NULL,
	[LOC_ADJ_UDP] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_gas_phys_location]
(
	[LOCATION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
