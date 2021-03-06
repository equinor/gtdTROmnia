﻿CREATE TABLE [endur].[vw_stl_ppa]
(
	PPA_UPDATE DATE NOT NULL,
	PPA_ID INT NULL,
	PPA_GROUP_ID INT NULL,
	PPA_TYPE_ID INT NULL,
	TRAN_NUM INT NULL,
	VERSION_NUM INT NULL,
	DELIVERY_ID INT NULL,
	ORIGINAL_TRAN_EVENT_NUM NUMERIC(38) NULL,
	ORIGINAL_DOCUMENT_NUM INT NULL,
	PPA_AMOUNT FLOAT NULL,
	PPA_STATUS INT NULL,
	PPA_REASON NVARCHAR(MAX) NULL,
	PPA_PERIOD DATE NULL,
	LAST_UPDATE DATE NULL,
	APPROVAL_COMMENT NVARCHAR(MAX) NULL,
	APPROVED_DATE DATE NULL,
	TABLE_VERSION_NUM INT NULL,
	EVENT_NUM  NUMERIC(38) NULL,
	LOCK_DOCUMENT_NUM INT NULL,
	QTY_CHANGE  FLOAT NULL,
	NEW_QTY  FLOAT NULL,
	OLD_QTY  FLOAT NULL,
	PRICE_CHANGE  FLOAT NULL,
	NEW_PRICE  FLOAT NULL,
	OLD_PRICE FLOAT NULL
)
