/****** Object:  Table [endur].[vw_user_dw_deal_leg_attributes]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_user_dw_deal_leg_attributes](
	[EXTRACTION_ID] [int] NULL,
	[RESULT_TYPE] [int] NULL,
	[TRAN_NUM] [int] NULL,
	[DEAL_NUM] [int] NULL,
	[INS_NUM] [int] NULL,
	[PARAM_SEQ_NUM] [int] NULL,
	[PROJ_INDEX] [int] NULL,
	[INDEX_NAME] [varchar](32) NULL,
	[MARKET_CURVE] [varchar](32) NULL,
	[CONTRACT_CURVE] [varchar](32) NULL,
	[PROJECTION_METHOD_ID] [int] NULL,
	[VPOOL_ID] [int] NULL,
	[PIPELINE_ID] [int] NULL,
	[ZONE_ID] [int] NULL,
	[FIN_DEL_REC] [int] NULL,
	[FIN_LOCATION_ID] [int] NULL,
	[LOCATION_ID] [int] NULL,
	[TRANSPORT_CLASS] [int] NULL,
	[PRICE_UNIT_CONV] [float] NULL,
	[PRICING_MODEL_ID] [int] NULL,
	[PRICE_UNIT] [int] NULL,
	[ROLL_CONV] [int] NULL,
	[PAYMENT_CONV] [int] NULL,
	[PYMT_DATE_OFFSET] [varchar](32) NULL,
	[PYMT_PERIOD] [int] NULL,
	[YLD_BASIS] [float] NULL,
	[RATE] [float] NULL,
	[ORG_FX] [float] NULL,
	[UNIT] [int] NULL,
	[SETTLEMENT_TYPE] [int] NULL,
	[DELIVERY_TYPE] [int] NULL,
	[DAILY_CAPACITY] [float] NULL,
	[NOTNL] [float] NULL,
	[START_DATE] [date] NULL,
	[MAT_DATE] [date] NULL,
	[PAY_REC] [int] NULL,
	[FX_FLT] [int] NULL,
	[DB_TIMESTAMP] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:09 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[vw_user_dw_deal_leg_attributes]
(
	[EXTRACTION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_EXTRACT_DEAL_NUM_PARAM_SEQ]    Script Date: 13/11/2019 14:23:09 ******/
CREATE NONCLUSTERED INDEX [INDEX_EXTRACT_DEAL_NUM_PARAM_SEQ] ON [endur].[vw_user_dw_deal_leg_attributes]
(
	[EXTRACTION_ID] ASC,
	[DEAL_NUM] ASC,
	[PARAM_SEQ_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[vw_user_dw_deal_leg_attributes] ADD  DEFAULT (getdate()) FOR [DB_TIMESTAMP]
GO
