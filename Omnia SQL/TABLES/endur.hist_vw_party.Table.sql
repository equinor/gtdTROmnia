/****** Object:  Table [endur].[hist_vw_party]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_party](
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
	[LINKED_PARTY_ID] [int] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_party]
(
	[PARTY_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
