/****** Object:  Table [endur].[stag_vw_ins_parameter_info]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[stag_vw_ins_parameter_info](
	[INS_NUM] [int] NULL,
	[PARAM_SEQ_NUM] [int] NULL,
	[TYPE_ID] [int] NULL,
	[VALUE] [varchar](256) NULL,
	[LAST_UPDATE] [datetime] NULL
) ON [PRIMARY]
GO
