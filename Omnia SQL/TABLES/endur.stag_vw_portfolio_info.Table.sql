/****** Object:  Table [endur].[stag_vw_portfolio_info]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_portfolio_info](
	[PORTFOLIO_ID] [int] NULL,
	[INFO_TYPE_ID] [int] NULL,
	[INFO_VALUE] [varchar](256) NULL,
	[LAST_UPDATE] [datetime] NULL
) ON [PRIMARY]
GO
