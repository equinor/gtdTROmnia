/****** Object:  Table [endur].[stag_vw_vw_portfolio_info]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_vw_portfolio_info](
	[PFOLIO_ID] [int] NULL,
	[PFOLIO_NAME] [varchar](32) NULL,
	[PFOLIO_LONG_NAME] [varchar](80) NULL,
	[PFOLIO_INFO_TYPE_NAME] [varchar](32) NULL,
	[PFOLIO_INFO_VALUE] [varchar](255) NULL
) ON [PRIMARY]
GO
