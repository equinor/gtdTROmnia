/****** Object:  Table [endur].[hist_vw_gas_phys_loc_type]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_gas_phys_loc_type](
	[LOC_TYPE_ID] [int] NULL,
	[LOC_TYPE_NAME] [varchar](32) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[VERSION_NUM] [int] NULL,
	[LOC_TYPE_POOL_FLAG] [int] NULL,
	[LOC_TYPE_OBA_FLAG] [int] NULL,
	[AGGREGATE] [int] NULL,
	[LOC_TYPE_CTP_FLAG] [int] NULL,
	[PLANT_INLET] [int] NULL,
	[PLANT_TAILGATE] [int] NULL,
	[NON_SCHED_LOC] [int] NULL,
	[FACILITY_LOC] [int] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_gas_phys_loc_type]
(
	[LOC_TYPE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
