/****** Object:  Table [endur].[vw_pnl_realized_temp1]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_pnl_realized_temp1](
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
	[BASE_TOTAL_VALUE] [float] NOT NULL,
	[REALIZED_VALUE] [float] NOT NULL,
	[UNREALIZED_VALUE] [float] NULL,
	[DF] [float] NULL,
	[TRAN_STATUS] [int] NULL,
	[RATE_STATUS] [int] NULL,
	[NEW_DEAL] [int] NULL,
	[INS_SOURCE_ID] [int] NULL,
	[EVENT_SOURCE_ID] [int] NULL,
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
