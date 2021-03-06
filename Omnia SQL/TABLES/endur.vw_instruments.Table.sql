/****** Object:  Table [endur].[vw_instruments]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_instruments](
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
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_instruments]
(
	[ID_NUMBER] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
