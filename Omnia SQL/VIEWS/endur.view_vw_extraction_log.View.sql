/****** Object:  View [endur].[view_vw_extraction_log]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [endur].[view_vw_extraction_log]
AS
SELECT        *, '9999-12-31' AS DB_TIMESTAMP_H FROM            endur.vw_dw_extraction_log
UNION
SELECT        *
FROM            endur.hist_vw_dw_extraction_log
GO
