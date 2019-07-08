﻿CREATE TABLE [endur].[vw_user_st_nett_report_detail]
(
	REPORT_ID INT NULL,
	CUSTOMER_GROUP NVARCHAR(MAX) NULL,
	BUY_SELL NVARCHAR(MAX) NULL,
	CURRENCY NVARCHAR(MAX) NULL,
	DEL_MONTH NVARCHAR(MAX) NULL,
	QUANTITY FLOAT NULL,
	QUANTITY_UNIT NVARCHAR(MAX) NULL,
	VALUE FLOAT NULL,
	TAX_REGIME NVARCHAR(MAX) NULL
)
