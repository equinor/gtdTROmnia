/****** Object:  Table [endur].[stag_vw_instruments]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_instruments](
	[VERSION_NUMBER] [int] NULL,
	[TOOLSET] [int] NULL,
	[SUPPRESS_INS_TYPE_TRIGGER] [int] NULL,
	[NAME] [varchar](32) NULL,
	[LONGNAME] [varchar](80) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[ID_NUMBER] [int] NULL,
	[DFLT_PX_MODEL] [int] NULL,
	[BASE_INS_ID] [int] NULL
) ON [PRIMARY]
GO
