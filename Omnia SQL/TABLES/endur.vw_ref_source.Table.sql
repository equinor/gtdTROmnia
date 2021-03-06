/****** Object:  Table [endur].[vw_ref_source]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_ref_source](
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
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_ref_source]
(
	[ID_NUMBER] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
