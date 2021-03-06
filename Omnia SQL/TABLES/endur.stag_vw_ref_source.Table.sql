/****** Object:  Table [endur].[stag_vw_ref_source]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_ref_source](
	[NAME] [varchar](32) NULL,
	[ID_NUMBER] [int] NULL,
	[PUB_ID] [int] NULL,
	[DATE_SEQUENCE_ID] [int] NULL,
	[PROJECTION_METHOD_ID] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[ACTIVE] [int] NULL,
	[VERSION_NUMBER] [int] NULL
) ON [PRIMARY]
GO
