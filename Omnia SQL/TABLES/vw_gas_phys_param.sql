﻿CREATE TABLE [endur].[vw_gas_phys_param]
(
   INS_NUM INT NULL,
   PARAM_SEQ_NUM INT NULL,
   CHILD_GROUP_ID INT NULL,
   SCHEDULE_PARTY INT NULL,
   FUEL_CALC_METHOD INT NULL,
   FUEL_PERCENT FLOAT NULL,
   OMIT_WAVG INT NULL,
   LOCATION_ID INT NULL,
   BUYBACK INT NULL,
   MIN_QTY FLOAT NULL,
   MAX_QTY FLOAT NULL,
   VOLUME_TYPE INT NULL,
   TLINK_GROUP_NUM INT NULL,
   TLINK_ALLOC_TYPE INT NULL,
   TLINK_PERCENT_ALLOC FLOAT NULL,
   TLINK_DEAL_NUM INT NULL,
   RATE_SCHEDULE_ID INT NULL,
   CRITERIA_ID INT NULL,
   BAV_CUTOFF_DATE DATE NULL,
   TIME_ZONE INT NULL,
   START_TIME DATE NULL,
   END_TIME DATE NULL,
   VOLUME_PRECISION INT NULL,
   MEASURE_GROUP_ID INT NULL,
   OFFSET_LOCATION_ID INT NULL,
   DAY_START_TIME INT NULL,
   INVENTORY_LOSS_PERCENT FLOAT NULL,
   INVENTORY_LOSS_CALC_TYPE INT NULL,
   PRODUCT_ID INT NULL,
   MODIFIED_PRODUCT INT NULL,
   LOAD_SHAPE INT NULL,
   DEAL_START_TIME INT NULL,
   DEAL_END_TIME INT NULL,
   IS_SCHEDULED INT NULL,
   TRANSPORT_CLASS INT NULL,
   PATH_LOCATION_ID INT NULL,
   TLINK_DEST_DEAL_NUM INT NULL,
   SHIPPER_CODE INT NULL,
   IS_BALANCE INT NULL,
   TANK_ID INT NULL,
   TLINK_TRANSIT_TIME DATE NULL,
   USER_PATH_ID INT NULL,
   COMMITMENT_ID INT NULL,
   INT_TRADING_STRATEGY INT NULL,
   EXT_TRADING_STRATEGY INT NULL,
   FACILITY_ID INT NULL,
   PRICING_VOLUME_TYPE INT NULL,
   SETTLEMENT_CONV FLOAT NULL,
   SETTLEMENT_CONV_UNIT INT NULL,
   LOC_SERVICE_TYPE INT NULL,
   IS_ADJUSTMENT INT NULL,
   INTENT_START_OFFSET NVARCHAR(MAX) NULL,
   INTENT_END_OFFSET NVARCHAR(MAX) NULL,
   LIFTINGS_PER_PERIOD INT NULL,
   COMM_WINDOW_LENGTH INT NULL,
   COMM_WINDOW_OFFSET INT NULL,
   FACILITY_GROUP_ID INT NULL,
   TEMPLATE_IDX_GROUP INT NULL,
   TEMPLATE_IDX_SUBGROUP INT NULL,
   TEMPLATE_PIPELINE_ID INT NULL,
   TEMPLATE_ZONE_ID INT NULL,
   TEMPLATE_PENDING_LOC_ID INT NULL,
   TEMPLATE_GEO_LOC_ID INT NULL,
   TITLE_XFER_EVENT INT NULL,
   TITLE_XFER_OFFSET NVARCHAR(MAX) NULL,
   FINANCIAL_SECURITY_TYPE INT NULL,
   FINANCIAL_SECURITY_EVENT INT NULL,
   FINANCIAL_SECURITY_OFFSET NVARCHAR(MAX) NULL
)