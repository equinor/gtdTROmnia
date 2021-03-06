/****** Object:  Table [endur].[stag_vw_tran_info_types]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_tran_info_types](
	[USER_TABLE_VALUE_COL_NAME] [varchar](32) NULL,
	[INS_NUM_COL_NAME] [varchar](32) NULL,
	[PARAM_SEQ_NUM_COL_NAME] [varchar](32) NULL,
	[USER_TABLE_VALUE_FORMAT_STR] [varchar](32) NULL,
	[TYPE_ID] [int] NULL,
	[TYPE_NAME] [varchar](32) NULL,
	[DATA_TYPE] [int] NULL,
	[LAST_UPDATE] [datetime] NULL,
	[INS_OR_TRAN] [int] NULL,
	[REQUIRED_FLAG] [int] NULL,
	[DEFAULT_VALUE] [varchar](256) NULL,
	[PICK_LIST_ID] [int] NULL,
	[OFFSET_INFO_ID] [int] NULL,
	[SEC_GROUP_ID] [int] NULL,
	[AUDIT_FLAG] [int] NULL,
	[DISPLAY_ORDER] [int] NULL,
	[READ_ONLY] [int] NULL,
	[SAVE_TO_DB] [int] NULL,
	[MULTI_SELECT_FLAG] [int] NULL,
	[USER_TABLE_NAME] [varchar](256) NULL,
	[TRAN_NUM_COL_NAME] [varchar](32) NULL,
	[USER_ID_COL_NAME] [varchar](32) NULL,
	[TRAN_DB_VERSION_COL_NAME] [varchar](32) NULL,
	[DATE_MODIFIED_COL_NAME] [varchar](32) NULL,
	[UDW_DEFINITION_ID] [int] NULL
) ON [PRIMARY]
GO
