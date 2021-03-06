/****** Object:  Table [credit].[vw_user_st_ec_extract]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [credit].[vw_user_st_ec_extract](
	[BOOK] [varchar](32) NULL,
	[BUY] [int] NULL,
	[COMMODITY] [varchar](32) NULL,
	[CONTRACT_INDEX] [varchar](32) NULL,
	[CONTRACT_NUMBER] [varchar](15) NULL,
	[CONTRACT_PRICE] [float] NULL,
	[COUNTERPARTY] [varchar](256) NULL,
	[CURRENCY] [varchar](32) NULL,
	[DEALT_DATE] [datetime] NULL,
	[DEAL_NUMBER] [varchar](32) NULL,
	[DEAL_TYPE] [varchar](64) NULL,
	[DELIVERED_AMOUNT] [float] NULL,
	[DELIVERED_AMOUNT_DC] [float] NULL,
	[DELIVERED_INVOICED_AMOUNT] [float] NULL,
	[DELIVERED_INVOICED_AMOUNT_DC] [float] NULL,
	[DF] [float] NULL,
	[EXERCISED_OPTION] [varchar](32) NULL,
	[FEE] [float] NULL,
	[FEE_DC] [float] NULL,
	[HUB] [varchar](32) NULL,
	[INS_TYPE] [varchar](32) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[ISSUE_DATE] [datetime] NULL,
	[MARKET_INDEX] [varchar](32) NULL,
	[MARKET_PRICE] [float] NULL,
	[MATURITY_DATE] [datetime] NULL,
	[MAX_RUN_START] [datetime] NULL,
	[MTM] [float] NULL,
	[MTM_DC] [float] NULL,
	[NOTIONAL_AMOUNT] [float] NULL,
	[NOTIONAL_AMOUNT_CURRENCY] [varchar](32) NULL,
	[OPTION_PREMIUM] [float] NULL,
	[OPTION_PREMIUM_DC] [float] NULL,
	[SETTLEMENT_DATE] [datetime] NULL,
	[SOURCE_SYSTEM] [varchar](32) NULL,
	[TRADING_ENTITY] [varchar](256) NULL,
	[UNIT] [varchar](32) NULL,
	[VALUE_DATE] [datetime] NULL,
	[VOLUME] [float] NULL
) ON [PRIMARY]
GO
