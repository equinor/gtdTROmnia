/****** Object:  Table [endur].[hist_vw_ins_parameter_info]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[hist_vw_ins_parameter_info](
	[INS_NUM] [int] NULL,
	[PARAM_SEQ_NUM] [int] NULL,
	[TYPE_ID] [int] NULL,
	[VALUE] [varchar](256) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[VALID_TO] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [INDEX_1]    Script Date: 13/11/2019 14:23:08 ******/
CREATE CLUSTERED INDEX [INDEX_1] ON [endur].[hist_vw_ins_parameter_info]
(
	[INS_NUM] ASC,
	[PARAM_SEQ_NUM] ASC,
	[TYPE_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
