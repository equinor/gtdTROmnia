/****** Object:  Table [endur].[vw_misc_ins]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_misc_ins](
	[YIELD_TO_METHOD] [int] NULL,
	[YIELD_PRICE_DECPLCS_ALT] [int] NULL,
	[YIELD_PRICE_DECPLCS] [int] NULL,
	[YIELD_PRICE] [float] NULL,
	[YIELD_COMP_FREQ] [int] NULL,
	[YIELD_CALC_METHOD] [int] NULL,
	[YIELD_CALC_BASIS] [int] NULL,
	[WI_FLAG] [int] NULL,
	[WI_DATE] [date] NULL,
	[VOLUME] [int] NULL,
	[VALUE_OF_01] [float] NULL,
	[UNDERLYING_PX_METHOD] [int] NULL,
	[TOTAL_ISSUE_SIZE] [float] NULL,
	[TICK_VALUE] [float] NULL,
	[TICK_SIZE] [float] NULL,
	[SIC_CODE] [int] NULL,
	[SETTLE_ROLLOVER_FLAG] [int] NULL,
	[SETTLE_DISCOUNT_FLAG] [int] NULL,
	[REPO_PRICE_TYPE] [int] NULL,
	[REPO_FWD_PRICE_ROUNDING] [int] NULL,
	[REDEMPTION_PRICE] [float] NULL,
	[PWR_EXCH_FWD_PROFILE_EVENTS] [int] NULL,
	[PRICE_TYPE] [int] NULL,
	[PRICE_ROUNDING_TYPE] [int] NULL,
	[PRICE_INP_FORMAT] [int] NULL,
	[PRICE] [float] NULL,
	[PREMIUM_CREATION_RULE] [int] NULL,
	[PARAM_SEQ_NUM] [int] NULL,
	[OPEN_INTEREST] [int] NULL,
	[ON_THE_RUN_FLAG] [int] NULL,
	[NOSTRO_FLAG] [int] NULL,
	[MISC_INS_SEQ_NUM] [int] NULL,
	[MAX_SETTLE_PARCEL_SIZE] [float] NULL,
	[MARKET_PX_LOOKUP_TYPE] [int] NULL,
	[MARKET_PX_INP_OR_EFF] [int] NULL,
	[MARKET_PX_INDEX_ID] [int] NULL,
	[MARKET_PX_GPT_NAME] [varchar](32) NULL,
	[MARGIN_TYPE] [int] NULL,
	[LAST_TRADE_DATE] [date] NULL,
	[LAST_DELIVERY_DATE] [date] NULL,
	[ISSUE_PRICE] [float] NULL,
	[INVENTORY_FLAG] [int] NULL,
	[INS_NUM] [int] NULL,
	[GUARANTOR_LENTITY] [int] NULL,
	[GUARANTOR_BUNIT] [int] NULL,
	[FUNGIBLE] [int] NULL,
	[FIRST_TRADE_DATE] [date] NULL,
	[FIRST_DELIVERY_DATE] [date] NULL,
	[FINAL_PRINCIPAL_ROUNDING] [int] NULL,
	[FC_YIELD_BASIS] [int] NULL,
	[FC_SIMPLE_YIELD] [int] NULL,
	[EX_DIVIDEND] [int] NULL,
	[EX_COUPON_TREATMENT] [int] NULL,
	[EX_COUPON_DAYS] [int] NULL,
	[EXPIRATION_DATE] [date] NULL,
	[EXCHANGE_LENTITY] [int] NULL,
	[EXCHANGE_BUNIT] [int] NULL,
	[DURATION] [float] NULL,
	[DISC_MARGIN_CALC_METHOD] [int] NOT NULL,
	[CREDIT_RATING] [int] NULL,
	[CREDIT_CLASSIFICATION] [int] NULL,
	[CONVEXITY] [float] NULL,
	[CONVERSION_FACTOR] [float] NULL,
	[CONTRACT_CODE] [int] NULL,
	[CASH_TRANSFER_TYPE] [int] NULL,
	[BUY_SELL_BACK_PRICE_TYPE] [int] NOT NULL,
	[ANNOUNCE_DATE] [date] NULL,
	[ACCRUAL_INTEREST] [float] NULL,
	[ACCINT_ROUNDING_METHOD] [int] NULL,
	[ACCINT_ROUNDING] [int] NULL,
	[ACCINT_DAY_ADJUSTMENT] [varchar](32) NULL,
	[ACCINT_CALC_METHOD] [int] NULL,
	[ACCINT_CALC_BASIS] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_misc_ins]
(
	[INS_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
