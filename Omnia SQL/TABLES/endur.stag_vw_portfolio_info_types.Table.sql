/****** Object:  Table [endur].[stag_vw_portfolio_info_types]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_portfolio_info_types](
	[TYPE_ID] [int] NULL,
	[TYPE_NAME] [varchar](32) NULL,
	[PORTFOLIO_TYPE] [int] NULL,
	[DATA_TYPE] [int] NULL,
	[REQUIRED_FLAG] [int] NULL,
	[PICK_LIST_ID] [int] NULL,
	[DEFAULT_VALUE] [varchar](32) NULL,
	[SEC_GROUP_ID] [int] NULL,
	[DISPLAY_ORDER] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[VERSION_NUMBER] [int] NULL
) ON [PRIMARY]
GO
