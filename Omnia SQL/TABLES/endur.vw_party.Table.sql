/****** Object:  Table [endur].[vw_party]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_party](
	[PARTY_ID] [int] NULL,
	[INT_EXT] [int] NULL,
	[PARTY_CLASS] [int] NULL,
	[PARTY_STATUS] [int] NULL,
	[SHORT_NAME] [varchar](256) NULL,
	[LONG_NAME] [varchar](256) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[PARTY_VERSION] [int] NULL,
	[DEFAULT_PORTFOLIO_ID] [int] NULL,
	[AGENCY_ACTIVITIES] [int] NULL,
	[LINKED_PARTY_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_party]
(
	[PARTY_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
