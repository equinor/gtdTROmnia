/****** Object:  Table [endur].[vw_delivery_type]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_delivery_type](
	[NAME] [varchar](32) NULL,
	[ID_NUMBER] [int] NULL,
	[SETTLE_TOOLSET] [int] NULL,
	[PHYS_VALUATION_METHOD] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[VERSION_NUMBER] [int] NULL,
	[ALT_DELIVERY_CCY_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_delivery_type]
(
	[ID_NUMBER] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
