/****** Object:  Table [endur].[vw_pnl_realized]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_pnl_realized](
	[PRIMARYKEY] [bigint] NOT NULL,
	[EXTRACTION_ID] [int] NULL,
	[RUN_TYPE] [int] NULL,
	[RESULT_TYPE] [int] NULL,
	[DEAL_NUM] [int] NULL,
	[TRAN_NUM] [int] NULL,
	[DEAL_LEG] [int] NULL,
	[DEAL_LEG_1] [int] NULL,
	[DEAL_PDC] [int] NULL,
	[INS_SEQ_NUM] [int] NULL,
	[PRICE_BAND] [int] NULL,
	[PRICE_BAND_SEQ_NUM] [int] NULL,
	[CFLOW_TYPE] [int] NULL,
	[BROKER_FEE_TYPE] [int] NULL,
	[START_DATE] [date] NULL,
	[END_DATE] [date] NULL,
	[CURRENCY_ID] [int] NULL,
	[VOLUME] [float] NULL,
	[PRICE] [float] NULL,
	[STRIKE] [float] NULL,
	[PYMT] [float] NOT NULL,
	[TOTAL_VALUE] [float] NOT NULL,
	[REALIZED_VALUE] [float] NOT NULL,
	[UNREALIZED_VALUE] [float] NULL,
	[BASE_TOTAL_VALUE] [float] NULL,
	[BASE_REALIZED_VALUE] [float] NULL,
	[BASE_UNREALIZED_VALUE] [float] NULL,
	[DF] [float] NULL,
	[TRAN_STATUS] [int] NULL,
	[INS_NUM] [int] NULL,
	[INS_TYPE] [int] NULL,
	[TOOLSET] [int] NULL,
	[BUY_SELL] [int] NULL,
	[REFERENCE] [varchar](32) NULL,
	[INT_EXT] [int] NULL,
	[INTERNAL_LENTITY] [int] NULL,
	[EXTERNAL_LENTITY] [int] NULL,
	[INTERNAL_PORTFOLIO] [int] NULL,
	[FIN_DEL_REC] [int] NULL,
	[FIN_LOCATION_ID] [int] NULL,
	[PRICE_UNIT] [int] NULL,
	[ORG_FX] [float] NULL,
	[UNIT] [int] NULL,
	[SETTLEMENT_TYPE] [int] NULL,
	[NOTNL] [float] NULL,
	[FX_FLT] [int] NULL,
	[DB_TIMESTAMP] [datetime] NULL,
	[VALID_FROM] [date] NULL,
	[VALID_TO] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PRIMARYKEY] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_1] ON [endur].[vw_pnl_realized]
(
	[EXTRACTION_ID] ASC,
	[VALID_FROM] ASC,
	[VALID_TO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_2]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_2] ON [endur].[vw_pnl_realized]
(
	[EXTRACTION_ID] ASC,
	[DEAL_NUM] ASC,
	[VALID_FROM] ASC,
	[VALID_TO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_3]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_3] ON [endur].[vw_pnl_realized]
(
	[EXTRACTION_ID] ASC,
	[DEAL_NUM] ASC,
	[DEAL_LEG] ASC,
	[VALID_FROM] ASC,
	[VALID_TO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_4]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_4] ON [endur].[vw_pnl_realized]
(
	[VALID_FROM] ASC,
	[VALID_TO] ASC,
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
