/****** Object:  Table [endur].[BW_Fixed_FX_Rates]    Script Date: 13/11/2019 14:23:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [endur].[BW_Fixed_FX_Rates](
	[Date] [date] NULL,
	[FX_FROM] [nchar](10) NULL,
	[FX_TO] [nchar](10) NULL,
	[FX_Rate] [float] NULL
) ON [PRIMARY]
GO
