/****** Object:  Table [endur].[hist_vw_vw_dw_raw_pnl_detail_res]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_vw_dw_raw_pnl_detail_res](
	[EXTRACTION_ID] [int] NOT NULL,
	[RUN_TYPE] [int] NULL,
	[RESULT_TYPE] [int] NOT NULL,
	[DEAL_NUM] [int] NOT NULL,
	[TRAN_NUM] [int] NOT NULL,
	[DEAL_LEG] [int] NOT NULL,
	[DEAL_LEG_1] [int] NOT NULL,
	[DEAL_PDC] [int] NOT NULL,
	[INS_SEQ_NUM] [int] NOT NULL,
	[PRICE_BAND] [int] NOT NULL,
	[PRICE_BAND_SEQ_NUM] [int] NOT NULL,
	[COMM_OPT_EXERCISED_FLAG] [int] NULL,
	[CFLOW_TYPE] [int] NOT NULL,
	[BROKER_FEE_TYPE] [int] NULL,
	[START_DATE] [date] NULL,
	[END_DATE] [date] NULL,
	[RATE_DTMN_DATE] [date] NULL,
	[PYMT_DATE] [date] NULL,
	[CURRENCY_ID] [int] NULL,
	[SETTLEMENT_TYPE] [int] NULL,
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
	[RATE_STATUS] [int] NULL,
	[YEST_PYMT] [float] NULL,
	[YEST_TOTAL_VALUE] [float] NULL,
	[YEST_REALIZED_VALUE] [float] NULL,
	[YEST_UNREALIZED_VALUE] [float] NULL,
	[YEST_BASE_TOTAL_VALUE] [float] NULL,
	[YEST_BASE_REALIZED_VALUE] [float] NULL,
	[YEST_BASE_UNREALIZED_VALUE] [float] NULL,
	[CHANGE_IN_TOT_PNL] [float] NULL,
	[YEST_TRAN_STATUS] [int] NULL,
	[NEW_DEAL] [int] NULL,
	[INS_SOURCE_ID] [int] NULL,
	[EVENT_SOURCE_ID] [int] NULL,
	[DB_TIMESTAMP] [datetime] NULL,
	[DB_TIMESTAMP_H] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_vw_dw_raw_pnl_detail_res]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_EXTR_ID_DEAL_NUM]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_EXTR_ID_DEAL_NUM] ON [endur].[hist_vw_vw_dw_raw_pnl_detail_res]
(
	[EXTRACTION_ID] ASC,
	[DEAL_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_EXTRACT_DEAL_NUM_LEG]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_EXTRACT_DEAL_NUM_LEG] ON [endur].[hist_vw_vw_dw_raw_pnl_detail_res]
(
	[EXTRACTION_ID] ASC,
	[DEAL_NUM] ASC,
	[DEAL_LEG] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[hist_vw_vw_dw_raw_pnl_detail_res] ADD  CONSTRAINT [DF_hist_vw_vw_dw_raw_pnl_detail_res_BD_TIMESTAMP_H]  DEFAULT (getdate()) FOR [DB_TIMESTAMP_H]
GO
