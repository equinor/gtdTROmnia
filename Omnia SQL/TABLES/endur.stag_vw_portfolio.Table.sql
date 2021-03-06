/****** Object:  Table [endur].[stag_vw_portfolio]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_portfolio](
	[ID_NUMBER] [int] NULL,
	[NAME] [varchar](32) NULL,
	[LONG_NAME] [varchar](80) NULL,
	[PORTFOLIO_TYPE] [int] NULL,
	[RESTRICTED] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[PORTFOLIO_VERSION] [int] NULL,
	[REQUIRES_STRATEGY] [int] NULL
) ON [PRIMARY]
GO
