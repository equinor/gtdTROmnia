/****** Object:  Table [endur].[stag_vw_energy_conversion]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_energy_conversion](
	[PIPELINE_ID] [int] NULL,
	[ZONE_ID] [int] NULL,
	[LOCATION_ID] [int] NULL,
	[EFFECTIVE_GMT_DATE] [date] NULL,
	[SRC_UNIT_ID] [int] NULL,
	[DEST_UNIT_ID] [int] NULL,
	[CONVERSION_FACTOR] [float] NULL,
	[CONVERSION_COMMENTS] [varchar](255) NULL,
	[VERSION_NUMBER] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[CONTRACTED_VALUE] [float] NULL,
	[REPLACEMENT_VALUE] [float] NULL,
	[FORECASTED_VALUE] [float] NULL,
	[ALLOCATED_VALUE] [float] NULL
) ON [PRIMARY]
GO
