/****** Object:  Table [endur].[vw_party_info]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_party_info](
	[PARTY_ID] [int] NULL,
	[TYPE_ID] [int] NULL,
	[VALUE] [varchar](512) NULL,
	[LAST_UPDATE] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_party_info]
(
	[PARTY_ID] ASC,
	[TYPE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
