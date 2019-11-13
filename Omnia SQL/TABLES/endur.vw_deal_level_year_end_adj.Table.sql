/****** Object:  Table [endur].[vw_deal_level_year_end_adj]    Script Date: 13/11/2019 14:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[vw_deal_level_year_end_adj](
	[BOOK] [varchar](60) NULL,
	[BOOK_ID] [int] NULL,
	[DEAL_NUM] [int] NULL,
	[DEAL_LEG] [int] NULL,
	[SYS_DATE] [date] NULL,
	[START_DATE] [date] NULL,
	[END_DATE] [date] NULL,
	[ADJ_VALUE] [float] NULL
) ON [PRIMARY]
GO
