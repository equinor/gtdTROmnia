/****** Object:  Table [endur].[stag_vw_user_dw_deal_attributes]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_user_dw_deal_attributes](
	[EXTRACTION_ID] [int] NULL,
	[RESULT_TYPE] [int] NULL,
	[TRAN_NUM] [int] NULL,
	[TRAN_GROUP] [int] NULL,
	[DEAL_NUM] [int] NULL,
	[TRAN_TYPE] [int] NULL,
	[TRAN_STATUS] [float] NULL,
	[ASSET_TYPE] [int] NULL,
	[INS_NUM] [int] NULL,
	[INS_TYPE] [int] NULL,
	[INS_CLASS] [int] NULL,
	[TOOLSET] [int] NULL,
	[BUY_SELL] [int] NULL,
	[REFERENCE] [varchar](32) NULL,
	[STRATEGY] [varchar](64) NULL,
	[DEAL_CLASSIFICATION] [varchar](64) NULL,
	[INT_EXT] [int] NULL,
	[INTERNAL_BUNIT] [int] NULL,
	[INTERNAL_LENTITY] [int] NULL,
	[EXTERNAL_BUNIT] [int] NULL,
	[EXTERNAL_LENTITY] [int] NULL,
	[INTERNAL_PORTFOLIO] [int] NULL,
	[EXTERNAL_PORTFOLIO] [int] NULL,
	[INTERNAL_CONTACT] [int] NULL,
	[EXTERNAL_CONTACT] [int] NULL,
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
	[ASSOCIATED_FX_JOURNAL] [varchar](32) NULL,
	[TRADE_FLAG] [int] NULL,
	[CURRENT_FLAG] [int] NULL,
	[FX_YLD_BASIS_1] [float] NULL,
	[FX_YLD_BASIS_2] [float] NULL,
	[UNIT] [int] NULL,
	[LOCK_TYPE] [int] NULL,
	[IDX_GROUP] [int] NULL,
	[IDX_SUBGROUP] [int] NULL,
	[TEMPLATE_TRAN_NUM] [int] NULL,
	[OTC_CLEARING_BROKER_ID] [int] NULL,
	[PORTFOLIO_GROUP_ID] [int] NULL,
	[BASE_INS_ID] [int] NULL,
	[INCLUDE_IN_DW] [int] NULL,
	[PEGAS_FUTURE] [varchar](32) NULL,
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[stag_vw_user_dw_deal_attributes]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_EXTRACT_DEAL_NUM]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_EXTRACT_DEAL_NUM] ON [endur].[stag_vw_user_dw_deal_attributes]
(
	[EXTRACTION_ID] ASC,
	[DEAL_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_INT_PORT]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_INT_PORT] ON [endur].[stag_vw_user_dw_deal_attributes]
(
	[INTERNAL_PORTFOLIO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[stag_vw_user_dw_deal_attributes] ADD  CONSTRAINT [DF_stag_vw_user_dw_deal_attributes_DB_TIMESTAMP]  DEFAULT (getdate()) FOR [DB_TIMESTAMP]
GO
