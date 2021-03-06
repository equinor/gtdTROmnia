/****** Object:  Table [endur].[hist_vw_portfolio]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_portfolio](
	[ID_NUMBER] [int] NULL,
	[NAME] [varchar](32) NULL,
	[LONG_NAME] [varchar](80) NULL,
	[PORTFOLIO_TYPE] [int] NULL,
	[RESTRICTED] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[PORTFOLIO_VERSION] [int] NULL,
	[REQUIRES_STRATEGY] [int] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_portfolio]
(
	[ID_NUMBER] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
