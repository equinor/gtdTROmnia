/****** Object:  Table [endur].[stag_vw_ab_tran_info]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_ab_tran_info](
	[TRAN_NUM] [int] NULL,
	[TYPE_ID] [int] NULL,
	[VALUE] [varchar](255) NULL,
	[LAST_UPDATE] [datetime] NULL
) ON [PRIMARY]
GO
