/****** Object:  Table [endur].[vw_stl_ppa]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_stl_ppa](
	[PPA_UPDATE] [datetime] NOT NULL,
	[PPA_ID] [int] NULL,
	[PPA_GROUP_ID] [int] NULL,
	[PPA_TYPE_ID] [int] NULL,
	[TRAN_NUM] [int] NULL,
	[VERSION_NUM] [int] NULL,
	[DELIVERY_ID] [int] NULL,
	[ORIGINAL_TRAN_EVENT_NUM] [numeric](38, 0) NULL,
	[ORIGINAL_DOCUMENT_NUM] [int] NULL,
	[PPA_AMOUNT] [float] NULL,
	[PPA_STATUS] [int] NULL,
	[PPA_REASON] [varchar](256) NULL,
	[PPA_PERIOD] [date] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[APPROVAL_COMMENT] [varchar](256) NULL,
	[APPROVED_DATE] [datetime] NULL,
	[TABLE_VERSION_NUM] [int] NULL,
	[EVENT_NUM] [numeric](38, 0) NULL,
	[LOCK_DOCUMENT_NUM] [int] NULL,
	[QTY_CHANGE] [float] NULL,
	[NEW_QTY] [float] NULL,
	[OLD_QTY] [float] NULL,
	[PRICE_CHANGE] [float] NULL,
	[NEW_PRICE] [float] NULL,
	[OLD_PRICE] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_stl_ppa]
(
	[PPA_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
