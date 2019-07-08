﻿CREATE TABLE [endur].[vw_user_dw_deal_attributes]
(
	EXTRACTION_ID               FLOAT,   
	RESULT_TYPE                 FLOAT,   
	TRAN_NUM                    FLOAT,   
	TRAN_GROUP                  FLOAT,   
	DEAL_NUM                    FLOAT,   
	TRAN_TYPE                   FLOAT,   
	TRAN_STATUS                 FLOAT,   
	ASSET_TYPE                  FLOAT,   
	INS_NUM                     FLOAT,   
	INS_TYPE                    FLOAT,   
	INS_CLASS                   FLOAT,   
	TOOLSET                     FLOAT,   
	BUY_SELL                    FLOAT,   
	REFERENCE                   NVARCHAR(MAX), 
	STRATEGY                    NVARCHAR(MAX), 
	DEAL_CLASSIFICATION         NVARCHAR(MAX), 
	INT_EXT                     FLOAT,   
	INTERNAL_BUNIT              FLOAT,   
	INTERNAL_LENTITY            FLOAT,   
	EXTERNAL_BUNIT              FLOAT,   
	EXTERNAL_LENTITY            FLOAT,   
	INTERNAL_PORTFOLIO          FLOAT,   
	EXTERNAL_PORTFOLIO          FLOAT,   
	INTERNAL_CONTACT            FLOAT,   
	EXTERNAL_CONTACT            FLOAT,   
	BOOK                        NVARCHAR(MAX), 
	TRADE_DATE                  DATE,         
	INPUT_DATE                  DATE,         
	SETTLE_DATE                 DATE,         
	POSITION                    FLOAT,
	PRICE                       FLOAT,
	RATE                        FLOAT,
	CURRENCY                    FLOAT,   
	CFLOW_TYPE                  FLOAT,   
	VERSION_NUMBER              FLOAT,   
	PROCEEDS                    FLOAT,
	MVALUE                      FLOAT,
	LAST_UPDATE                 DATE,         
	INS_SUB_TYPE                FLOAT,   
	BROKER_ID                   FLOAT,   
	START_DATE                  DATE,         
	MATURITY_DATE               DATE,         
	PERPETUAL_POS_DATE          DATE,         
	TRADE_TIME                  DATE,         
	OFFSET_TRAN_NUM             FLOAT,   
	OFFSET_TRAN_TYPE            FLOAT,   
	ASSOCIATED_FX_JOURNAL       NVARCHAR(MAX), 
	TRADE_FLAG                  FLOAT,   
	CURRENT_FLAG                FLOAT,   
	FX_YLD_BASIS_1              FLOAT,   
	FX_YLD_BASIS_2              FLOAT,   
	UNIT                        FLOAT,   
	LOCK_TYPE                   FLOAT,   
	IDX_GROUP                   FLOAT,   
	IDX_SUBGROUP                FLOAT,   
	TEMPLATE_TRAN_NUM           FLOAT,   
	OTC_CLEARING_BROKER_ID      FLOAT,   
	PORTFOLIO_GROUP_ID          FLOAT,   
	BASE_INS_ID                 FLOAT,   
	INCLUDE_IN_DW               FLOAT,   
	PEGAS_FUTURE                NVARCHAR(MAX)
);