/****** Object:  View [endur].[view_union_portfolio_info]    Script Date: 13/11/2019 14:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [endur].[view_union_portfolio_info] 

as
select PORTFOLIO_ID,INFO_TYPE_ID,INFO_VALUE,iif(LAST_UPDATE<'2019-09-01' and LAST_UPDATE>'2018-12-31', '2018-12-31',LAST_UPDATE) VALID_FROM,'9999-12-31' VALID_TO from endur.vw_portfolio_info
union
select PORTFOLIO_ID,INFO_TYPE_ID,INFO_VALUE,iif(LAST_UPDATE<'2019-09-01' and LAST_UPDATE>'2018-12-31', '2018-12-31',LAST_UPDATE),VALID_TO from endur.hist_vw_portfolio_info
GO
