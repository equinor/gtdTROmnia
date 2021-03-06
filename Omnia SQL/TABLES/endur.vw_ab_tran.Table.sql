/****** Object:  Table [endur].[vw_ab_tran]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_ab_tran](
	[TRAN_NUM] [int] NULL,
	[TRAN_GROUP] [int] NULL,
	[DEAL_TRACKING_NUM] [int] NULL,
	[TRAN_TYPE] [int] NULL,
	[TRAN_STATUS] [int] NULL,
	[ASSET_TYPE] [int] NULL,
	[INS_NUM] [int] NULL,
	[INS_TYPE] [int] NULL,
	[INS_CLASS] [int] NULL,
	[TOOLSET] [int] NULL,
	[BUY_SELL] [int] NULL,
	[REFERENCE] [varchar](32) NULL,
	[INTERNAL_BUNIT] [int] NULL,
	[INTERNAL_LENTITY] [int] NULL,
	[EXTERNAL_BUNIT] [int] NULL,
	[EXTERNAL_LENTITY] [int] NULL,
	[INTERNAL_PORTFOLIO] [int] NULL,
	[EXTERNAL_PORTFOLIO] [int] NULL,
	[BOOK] [varchar](32) NULL,
	[TRADE_DATE] [date] NULL,
	[INPUT_DATE] [date] NULL,
	[SETTLE_DATE] [date] NULL,
	[POSITION] [float] NULL,
	[PRICE] [float] NULL,
	[RATE] [float] NULL,
	[CURRENCY] [int] NULL,
	[CFLOW_TYPE] [int] NULL,
	[VERSION_NUMBER] [int] NULL,
	[PROCEEDS] [float] NULL,
	[MVALUE] [float] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[INS_SUB_TYPE] [int] NULL,
	[BROKER_ID] [int] NULL,
	[START_DATE] [date] NULL,
	[MATURITY_DATE] [date] NULL,
	[PERPETUAL_POS_DATE] [date] NULL,
	[TRADE_TIME] [datetime] NULL,
	[OFFSET_TRAN_NUM] [int] NULL,
	[OFFSET_TRAN_TYPE] [int] NULL,
	[TRADE_FLAG] [int] NULL,
	[CURRENT_FLAG] [int] NULL,
	[FX_YLD_BASIS_1] [int] NULL,
	[FX_YLD_BASIS_2] [int] NULL,
	[UNIT] [int] NULL,
	[LOCK_TYPE] [int] NULL,
	[IDX_GROUP] [int] NULL,
	[IDX_SUBGROUP] [int] NULL,
	[TEMPLATE_TRAN_NUM] [int] NULL,
	[OTC_CLEARING_BROKER_ID] [int] NULL,
	[BASE_INS_TYPE] [int] NULL,
	[INT_TRADING_STRATEGY] [int] NULL,
	[EXT_TRADING_STRATEGY] [int] NULL,
	[PASS_THRU_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_ab_tran]
(
	[TRAN_NUM] ASC,
	[INS_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nci_wi_vw_ab_tran_03DDEFCB24A5F2002E6C6EDD0E49B0AC]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [nci_wi_vw_ab_tran_03DDEFCB24A5F2002E6C6EDD0E49B0AC] ON [endur].[vw_ab_tran]
(
	[TRAN_STATUS] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nci_wi_vw_ab_tran_67DD0BC7C8E7A9541EC8FFE619EEE7EE]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [nci_wi_vw_ab_tran_67DD0BC7C8E7A9541EC8FFE619EEE7EE] ON [endur].[vw_ab_tran]
(
	[INS_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
