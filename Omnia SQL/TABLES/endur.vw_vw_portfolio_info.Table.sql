/****** Object:  Table [endur].[vw_vw_portfolio_info]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_vw_portfolio_info](
	[PFOLIO_ID] [int] NULL,
	[PFOLIO_NAME] [varchar](32) NULL,
	[PFOLIO_LONG_NAME] [varchar](80) NULL,
	[PFOLIO_INFO_TYPE_NAME] [varchar](32) NULL,
	[PFOLIO_INFO_VALUE] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_vw_portfolio_info]
(
	[PFOLIO_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
