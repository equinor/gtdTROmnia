/****** Object:  Table [endur].[vw_stldoc_details]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_stldoc_details](
	[DOCUMENT_NUM] [int] NULL,
	[DOC_VERSION] [int] NULL,
	[EVENT_NUM] [numeric](38, 0) NULL,
	[TRAN_NUM] [int] NULL,
	[DEAL_TRACKING_NUM] [int] NULL,
	[EVENT_DATE] [date] NULL,
	[STLDOC_TEMPLATE_ID] [int] NULL,
	[INTERNAL_CONF_STATUS] [int] NULL,
	[INTERNAL_BUNIT] [int] NULL,
	[EXTERNAL_BUNIT] [int] NULL,
	[INTERNAL_LENTITY] [int] NULL,
	[EXTERNAL_LENTITY] [int] NULL,
	[TOOLSET] [int] NULL,
	[INS_TYPE] [int] NULL,
	[INS_SUB_TYPE] [int] NULL,
	[IDX_GROUP] [int] NULL,
	[IDX_SUBGROUP] [int] NULL,
	[BUY_SELL] [int] NULL,
	[DELIVERY_TYPE] [int] NULL,
	[DELIVERY_CCY] [int] NULL,
	[DELIVERY_UNIT] [int] NULL,
	[PARA_POSITION] [float] NULL,
	[CFLOW_TYPE] [int] NULL,
	[EVENT_TYPE] [int] NULL,
	[INS_PARA_SEQ_NUM] [int] NULL,
	[DELIVERY_CLASS] [int] NULL,
	[TRAN_STATUS] [int] NULL,
	[TRAN_TYPE] [int] NULL,
	[INS_CLASS] [int] NULL,
	[TRAN_PRICE] [float] NULL,
	[TRAN_POSITION] [float] NULL,
	[TRAN_SETTLE_DATE] [date] NULL,
	[TRAN_CURRENCY] [int] NULL,
	[TRAN_UNIT] [int] NULL,
	[TRAN_REFERENCE] [varchar](32) NULL,
	[PORTFOLIO_ID] [int] NULL,
	[TRADE_TIME] [datetime] NULL,
	[TRAN_BOOK] [varchar](32) NULL,
	[INS_NUM] [int] NULL,
	[TRADE_DATE] [date] NULL,
	[INS_SEQ_NUM] [int] NULL,
	[INT_ACCOUNT_ID] [int] NULL,
	[EXT_ACCOUNT_ID] [int] NULL,
	[SETTLE_TYPE] [int] NULL,
	[SETTLE_CCY] [int] NULL,
	[SETTLE_UNIT] [int] NULL,
	[SETTLE_AMOUNT] [float] NULL,
	[EXT_DOC_ID] [varchar](32) NULL,
	[ADJUSTMENT_TYPE] [int] NULL,
	[ACTUAL_AMOUNT] [float] NULL,
	[PARTY_AGREEMENT_ID] [int] NULL,
	[MASTER_NETTING_AGREEMENT] [int] NULL,
	[RELEASE_DATE] [date] NULL,
	[PYMT_DUE_DATE] [date] NULL,
	[ANNOTATION_KEY] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[ACCOUNTING_DATE] [date] NULL,
	[ORIG_EVENT_NUM] [numeric](38, 0) NULL,
	[EVENT_TRACKING_NUM] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_stldoc_details]
(
	[DOCUMENT_NUM] ASC,
	[EVENT_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
