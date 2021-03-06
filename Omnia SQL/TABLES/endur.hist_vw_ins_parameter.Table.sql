/****** Object:  Table [endur].[hist_vw_ins_parameter]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_ins_parameter](
	[YLD_BASIS] [int] NULL,
	[UNIT_CONV_FACTOR] [float] NULL,
	[UNIT] [int] NULL,
	[TRAN_INDEX] [int] NULL,
	[SYMBOLIC_DATE_LABEL] [varchar](250) NULL,
	[START_DATE] [date] NULL,
	[SPOT_PX] [float] NULL,
	[SPOT_CONV_FACTOR] [float] NULL,
	[SETTLEMENT_TYPE] [int] NULL,
	[ROUNDING] [int] NULL,
	[ROLL_CONV] [int] NULL,
	[REVERSE_FLOATER_FLAG] [int] NULL,
	[RESET_PYMT_PERIOD] [int] NULL,
	[RATE] [float] NULL,
	[PYMT_TYPE] [int] NULL,
	[PYMT_PERIOD] [int] NULL,
	[PYMT_EVENT_TYPE_TWO] [int] NULL,
	[PYMT_EVENT_TYPE_ONE] [int] NULL,
	[PYMT_DATE_OFFSET] [varchar](32) NULL,
	[PROJ_VOL_ID] [int] NULL,
	[PROFILE_RESET_SHIFT] [varchar](32) NULL,
	[PROFILE_END_DATE_ADJUST] [int] NULL,
	[PROFILE_AUX_TBL_USED] [int] NULL,
	[PRICING_TEMPLATE] [int] NULL,
	[PRICING_MODEL_ID] [int] NULL,
	[PRICE_UNIT_CONV] [float] NULL,
	[PRICE_UNIT] [int] NULL,
	[PRICE_COMPLEXITY] [int] NULL,
	[PREPYMT_RATE] [float] NULL,
	[POST_CONVERSION_ROUNDING] [int] NULL,
	[PDC_CURRENCY] [int] NULL,
	[PAY_REC] [int] NULL,
	[PAYOUT_AMOUNT] [float] NULL,
	[PAYMENT_MULTIPLIER] [float] NULL,
	[PAYMENT_CONV] [int] NULL,
	[PARAM_TYPE] [int] NULL,
	[PARAM_SEQ_NUM] [int] NULL,
	[PARAM_INS_TYPE] [int] NULL,
	[PARAM_ID] [int] NULL,
	[PARAM_GROUP] [int] NULL,
	[OPTION_TYPE] [int] NULL,
	[OPTION_LEAD_TIME] [varchar](32) NULL,
	[OPTION_LEAD_DAYS] [varchar](32) NULL,
	[OPTION_EXERCISE_METHOD] [int] NULL,
	[NUM_RRDC_REC] [int] NULL,
	[NUM_PROFILE_REC] [int] NULL,
	[NUM_OPTION_REC] [int] NULL,
	[NUM_NOTNL_HOLID_REC] [int] NULL,
	[NUM_MISC_INS_REC] [int] NULL,
	[NUM_LOGCFC_REC] [int] NULL,
	[NUM_HOLID_REC] [int] NULL,
	[NOTNL_TYPE] [int] NULL,
	[NOTNL_PROJ_INDEX] [int] NULL,
	[NOTNL_CURRENCY] [int] NULL,
	[NOTNL] [float] NULL,
	[MIN_RATE] [float] NULL,
	[MAX_STRIKES] [int] NULL,
	[MAX_RATE] [float] NULL,
	[MAX_CFLOW_ID_PHYSCASH] [int] NULL,
	[MAX_CFLOW_ID_LOGCASH] [int] NULL,
	[MAT_DATE] [date] NULL,
	[LIMIT_INDEX_PERCENT_CONV] [int] NULL,
	[LIMIT_CAP_FLR_PRICE_CONV] [int] NULL,
	[INTERP] [int] NULL,
	[INTEREST_CAPITALIZATION] [int] NULL,
	[INS_NUM] [int] NULL,
	[INPUT_CURRENCY] [int] NULL,
	[INDEX_MULTIPLIER] [float] NULL,
	[GRID_PT] [int] NULL,
	[GLOBAL_RATE_MATRIX_ID] [int] NULL,
	[FX_VOL_ID] [int] NULL,
	[FX_FLT] [int] NULL,
	[FROLL_DATE] [date] NULL,
	[FLOAT_SPD_TYPE] [int] NULL,
	[FLOAT_SPD] [float] NULL,
	[FINAL_PRIN_PYMT_CONV] [int] NULL,
	[EXERCISE_PYMT_CONV] [int] NULL,
	[EXERCISE_FREQ] [varchar](32) NULL,
	[EXERCISE_DATE_OFFSET] [varchar](32) NULL,
	[DISC_INDEX] [int] NULL,
	[DENOMINATION_UNIT_ID] [int] NULL,
	[DELIVERY_TYPE] [int] NULL,
	[DEAL_VOLUME_TYPE] [int] NULL,
	[DAILY_VOLUME] [int] NULL,
	[DAILY_CAPACITY] [float] NULL,
	[CURRENCY] [int] NULL,
	[COV_ID] [int] NULL,
	[COMPOUNDING_TYPE] [int] NULL,
	[CHANGE_FLAG] [int] NULL,
	[CFLOW_TYPE] [int] NULL,
	[BROLL_DATE] [date] NULL,
	[BARRIER_UPDATE_FREQ] [int] NULL,
	[BARRIER_TYPE] [int] NULL,
	[BARRIER_TRIGGER_TYPE] [int] NULL,
	[BARRIER_TRIGGER_CNT] [int] NULL,
	[BARRIER_STRIKE] [float] NULL,
	[ATM_SPREAD] [int] NULL,
	[ANNUITY] [int] NULL,
	[AMORTIZATION_TERM] [int] NULL,
	[ADJ_RATE_BASIS] [int] NULL,
	[ACCOUNTING_DATE_OFFSET] [varchar](32) NULL,
	[ACCOUNTING_DATE_CONV] [int] NULL,
	[DB_TIMESTAMP_H] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_ins_parameter]
(
	[INS_NUM] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [endur].[hist_vw_ins_parameter] ADD  CONSTRAINT [DF_hist_vw_ins_parameter_DB_TIMESTAMP_H]  DEFAULT (getdate()) FOR [DB_TIMESTAMP_H]
GO
