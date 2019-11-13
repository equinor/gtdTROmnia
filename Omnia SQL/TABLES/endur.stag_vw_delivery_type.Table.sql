/****** Object:  Table [endur].[stag_vw_delivery_type]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_delivery_type](
	[NAME] [varchar](32) NULL,
	[ID_NUMBER] [int] NULL,
	[SETTLE_TOOLSET] [int] NULL,
	[PHYS_VALUATION_METHOD] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[VERSION_NUMBER] [int] NULL,
	[ALT_DELIVERY_CCY_ID] [int] NULL
) ON [PRIMARY]
GO
