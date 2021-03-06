/****** Object:  Table [endur].[vw_user_st_pricepoint_mapping]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_user_st_pricepoint_mapping](
	[ID] [int] NULL,
	[ESID] [varchar](256) NULL,
	[CURVENAME] [varchar](256) NULL,
	[GRIDPOINT] [varchar](256) NULL,
	[OBSERVATION] [varchar](256) NULL,
	[SPDTYPE] [varchar](256) NULL,
	[GROUPNAME] [varchar](256) NULL,
	[PRICEDIVIDE] [int] NULL,
	[OBSERVATIONTIME] [varchar](256) NULL,
	[GDM_MODEL_URI] [varchar](256) NULL,
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
