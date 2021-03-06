/****** Object:  Table [endur].[hist_vw_idx_def]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_idx_def](
	[INDEX_ID] [int] NULL,
	[INDEX_VERSION_ID] [int] NULL,
	[VALIDATED] [int] NULL,
	[INDEX_TYPE] [int] NULL,
	[INDEX_STATUS] [int] NULL,
	[DB_STATUS] [int] NULL,
	[INDEX_NAME] [varchar](32) NULL,
	[MARKET] [int] NULL,
	[IDX_GROUP] [int] NULL,
	[FORMAT] [int] NULL,
	[UNIT] [int] NULL,
	[CURRENCY] [int] NULL,
	[DAYS_DELAYED] [varchar](32) NULL,
	[DATE_SEQUENCE] [varchar](32) NULL,
	[PAYMENT_CONV] [int] NULL,
	[YIELD_BASIS] [int] NULL,
	[INTERP_METHOD] [int] NULL,
	[INHERITANCE] [int] NULL,
	[DISC_INDEX] [int] NULL,
	[ADJUST_FUTURES] [int] NULL,
	[BASE_CONV_FACTOR] [float] NULL,
	[USE_EXP_CONTRACT] [int] NULL,
	[COVERAGE_END] [varchar](32) NULL,
	[ROUNDING] [int] NULL,
	[DISPLAY_MODE] [int] NULL,
	[REF_SOURCE] [int] NULL,
	[DELIVERY_TYPE] [int] NULL,
	[NUM_HOLIDAYS] [int] NULL,
	[NUM_GRID_POINTS] [int] NULL,
	[CURRENCY2] [int] NULL,
	[PURPOSE] [int] NULL,
	[CLASS] [int] NULL,
	[CONTRACT_SIZE] [float] NULL,
	[TENOR] [int] NULL,
	[PRODUCT_INS_NUM] [int] NULL,
	[LABEL] [varchar](32) NULL,
	[OPT_DATE_SEQ] [varchar](32) NULL,
	[COMPONENT] [int] NULL,
	[AVG_PERIOD] [int] NULL,
	[ALT_UNIT] [int] NULL,
	[GAMMA_FACTOR] [float] NULL,
	[SECURE_FLAG] [int] NULL,
	[OPT_EXPIRE_TIME] [int] NULL,
	[APPROXIMATION_TYPE] [int] NULL,
	[TIME_ZONE] [int] NULL,
	[PRICE_BAND] [int] NULL,
	[IDX_SUBGROUP] [int] NULL,
	[DENSITY_ADJUSTMENT] [float] NULL,
	[PROJECTION_METHOD_ID] [int] NULL,
	[DELTA_OPTIMIZE] [int] NULL,
	[EXT_MODEL_ID] [int] NULL,
	[OUTPUT_DELTA_SHIFT] [float] NULL,
	[PRIORITY_METHOD] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[DAY_START_TIME] [int] NULL,
	[CONSTRUCTION_METHOD] [int] NULL,
	[USE_SEPARATE_BMO] [int] NULL,
	[COMMODITY_PROJECTOR] [int] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_idx_def]
(
	[INDEX_ID] ASC,
	[INDEX_VERSION_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
