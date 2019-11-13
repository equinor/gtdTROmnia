/****** Object:  Table [endur].[vw_pnl_realized_temp_Update]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_pnl_realized_temp_Update](
	[PRIMARYKEY_NEW_ROW] [bigint] NULL,
	[PRIMARYKEY_OLD_ROW] [bigint] NULL,
	[VALID_FROM_NEW] [date] NULL,
	[VALID_TO_NEW] [date] NULL,
	[VALID_FROM_OLD] [date] NULL,
	[VALID_TO_OLD] [date] NULL,
	[IS_NEWER] [smallint] NULL
) ON [PRIMARY]
GO
