/****** Object:  Table [endur].[vw_vw_dw_pnl_portfolio_adjust]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_vw_dw_pnl_portfolio_adjust](
	[EXTRACTION_ID] [int] NULL,
	[RESULT_TYPE] [int] NULL,
	[DEAL_NUM] [int] NULL,
	[TRAN_NUM] [int] NULL,
	[DEAL_LEG] [int] NULL,
	[DEAL_LEG_1] [int] NULL,
	[DEAL_PDC] [int] NULL,
	[INS_SEQ_NUM] [int] NULL,
	[PRICE_BAND] [int] NULL,
	[PRICE_BAND_SEQ_NUM] [int] NULL,
	[COMM_OPT_EXERCISED_FLAG] [int] NULL,
	[CFLOW_TYPE] [int] NULL,
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
	[PYMT] [float] NULL,
	[TOTAL_VALUE] [float] NULL,
	[REALIZED_VALUE] [float] NULL,
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
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_vw_dw_pnl_portfolio_adjust]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[vw_vw_dw_pnl_portfolio_adjust] ADD  CONSTRAINT [DF_stag_vw_vw_dw_pnl_portfolio_adjust_DB_TIMESTAMP]  DEFAULT (getdate()) FOR [DB_TIMESTAMP]
GO
