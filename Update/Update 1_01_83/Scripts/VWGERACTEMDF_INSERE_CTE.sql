DECLARE @USUARIO	VARCHAR(20)
DECLARE @SERIE		VARCHAR(8)
DECLARE @VLRCTE		NUMERIC(12,2)
DECLARE @REBOQ1		VARCHAR(10)
DECLARE @REBOQ2		VARCHAR(10)
DECLARE @REBOQ3		VARCHAR(10)	
DECLARE @REBOQTMP	VARCHAR(10)	
DECLARE @SEQ		SMALLINT
DECLARE @NR_PRECLA	VARCHAR(15)
DECLARE @TRAN_NAME	VARCHAR(20)

SET @USUARIO	= #USUARIO
SET @SERIE		= #SERIE
SET @VLRCTE		= #VLRCTE

SET @REBOQ1		= ''
SET @REBOQ2		= ''
SET @REBOQ3		= ''

SET @TRAN_NAME = (SELECT ABS(CHECKSUM(NEWID())))

BEGIN TRAN @TRAN_NAME

SET @NR_PRECLA = CAST((SELECT SHLANG.SEQ_NUM FROM PSGACTE.DBO.SHLANG WHERE SHLANG.TP_OBJ = 'FPRECLA' AND SHLANG.OBJ = 'FPRECLA.CLA_CODIGO')+1 AS NUMERIC(10,0))

UPDATE PSGACTE.DBO.SHLANG
SET SHLANG.SEQ_NUM = @NR_PRECLA
FROM PSGACTE.DBO.SHLANG
WHERE SHLANG.TP_OBJ = 'FPRECLA' AND SHLANG.OBJ = 'FPRECLA.CLA_CODIGO'

COMMIT TRAN @TRAN_NAME

/*ALIMENTA REBOQUE*/
SET @SEQ = 1

DECLARE CR CURSOR FOR
	SELECT TOP 3 CODIGO FROM GWGERAREBO
	WHERE USUARIO = 'M1A1'

OPEN CR  

FETCH NEXT FROM CR
INTO @REBOQTMP

WHILE @@FETCH_STATUS = 0 BEGIN
	IF (@SEQ = 1) SET @REBOQ1 = @REBOQTMP	
	IF (@SEQ = 2) SET @REBOQ2 = @REBOQTMP
	IF (@SEQ = 3) SET @REBOQ3 = @REBOQTMP
	
	SET @SEQ = @SEQ + 1
	FETCH NEXT FROM CR
	INTO @REBOQTMP
END
CLOSE CR 
DEALLOCATE CR

/*INSERE O CTE*/
INSERT INTO PSGACTE.DBO.ICONFRET (SERIE_COD,ICONFRET_COD,DATA_EMISSAO,CFOP,SIT_TRIB,SPESSTRANSP_COD,TIPO_FRETE,SPESDEST_COD,VLR_TOTAL,
	BASE_OUTROS,DATA_RECEBIMENTO,SPESMOT_COD,PESO,OES_CODIGO,UN,[STATUS],COD_CCUSTO,TPENDERECO,SITUACAO_EFD,NR_PRECLA,VLR_UNITARIO,SCIDADES_COD,CST_PIS,CST_COFINS,TIPO_UNIDADE,
	TIPO_MEDIDA,TIPO_END_DEST,SPESREM_COD,TIPO_END_REM, REM_EMI, DEST_RAZAO_SOCIAL,DEST_CPF_CNPJ,DEST_INSC_EST_RG,DEST_END,DEST_NUMERO,DEST_CPL,DEST_BAIRRO,
	DEST_CEP, MODAL,TOMADOR,CPRODUTOS,HORA_EMISSAO,TIPO_CADASTRO,DESC_PRODUTO,IND_NAT_FRT,UF_ORIGEM,UF_DESTINO, TIPO_CTE,
	VLR_TOTAL_CTRC,MUNI_ORIGEM,MUNI_DESTINO,SPES_EXPEDIDOR,SPES_RECEBEDOR,TPEND_EXPEDIDOR,TPEND_RECEBEDOR,LOTACAO,VEICULO,VEICULODOIS,
	VEICULOTRES,VEICULOQUATRO)


SELECT TOP 1
	@SERIE AS SERIE_COD ,
	REPLICATE('0', 6 - LEN((SELECT MAX(CSERIES.ULT_NUM)+1 FROM PSGACTE.DBO.CSERIES WHERE CSERIES.SERIE = @SERIE))) + RTrim((SELECT MAX(CSERIES.ULT_NUM)+1 FROM PSGACTE.DBO.CSERIES WHERE CSERIES.SERIE = @SERIE)) AS ICONFRET_COD , --GERAR ESTILO PRE-CLA (PEDIR PRO ADRIANO ONDE PEGAR O SEQUENCIADOR)
	GETDATE()  AS DATA_EMISSAO ,
	'5356' AS CFOP ,
	[ST] AS SIT_TRIB , 
	TRANSP_COD AS SPESSTRANSP_COD ,
	'1' AS TIPO_FRETE , /*========== FRETE DE TERCEIRO*/
	PESSOA_DEST AS SPESDEST_COD ,
	[VALOR_NF] AS VLR_TOTAL ,
	CAST(REPLACE(@VLRCTE,',','.') AS NUMERIC(14,2)) AS BASE_OUTROS ,
	GETDATE()  AS DATA_RECEBIMENTO ,
	MOTORISTA_COD AS SPESMOT_COD ,
	CAST((CAST(PESO_NF AS MONEY)/1000) AS NUMERIC) AS PESO ,
	'001' AS OES_CODIGO ,
	'TN' AS UN ,
	'1' AS STATUS ,
	'1101' AS COD_CCUSTO, 
	 TPEND_TRANSP AS TPENDERECO,
	 '00' AS SITUACAO_EFD,
	@NR_PRECLA AS NR_PRECLA ,
	CAST(VLR_UN*1000 AS NUMERIC(14,2)) AS VLR_UNITARIO,
	CIDADE_DEST AS SCIDADES_COD,
	'01' AS CST_PIS,
	'01' AS CST_COFINS,
	'02' AS TIPO_UNIDADE ,
	'2' AS TIPO_MEDIDA ,
	TPEND_DEST AS TIPO_END_DEST ,
	PESSOA_ORI AS SPESREM_COD,
	TPEND_ORI AS TIPO_END_REM ,
	'1' AS REM_EMI,
	[DEST_RAZAO_SOCIAL],
	CNPJ_CPF_DEST,
	[DEST_INSC_EST_RG],
	[DEST_END],
	[DEST_NUMERO],
	[DEST_CPL],
	[DEST_BAIRRO],
	[DEST_CEP],
	'01' AS MODAL ,
	'1' AS TOMADOR ,
	PRODUTO_COD AS CPRODUTOS,
	'0000' AS HORA_EMISSAO,
	'1' AS TIPO_CADASTRO ,
	PRODUTO_DESCR AS DESC_PRODUTO,
	'0' AS IND_NAT_FRT,
	UF_ORI AS UF_ORIGEM ,
	UF_DEST AS UF_DESTINO ,
	'0' AS TIPO_CTE,
	CAST(REPLACE(@VLRCTE,',','.') AS NUMERIC(14,2)) AS VLR_TOTAL_CTRC ,
	CIDADE_ORI AS MUNI_ORIGEM ,
	CIDADE_DEST AS MUNI_DESTINO ,
	PESSOA_ORI AS SPES_EXPEDIDOR ,
	PESSOA_DEST AS SPES_RECEBEDOR ,
	TPEND_ORI AS TPEND_EXPEDIDOR ,
	TPEND_DEST AS TPEND_RECEBEDOR ,
	'1' AS LOTACAO , 
	VEICULO_COD AS VEICULO,
	@REBOQ1 AS VEICULODOIS , 
	@REBOQ2 AS VEICULOTRES , 
	@REBOQ3 AS VEICULOQUATRO 

FROM GWGERACTE
WHERE USUARIO = @USUARIO

INSERT INTO PSGACTE.DBO.IFRNFTER (ICONFRET_COD, SPESSTRANSP_COD, SERIE_COD, CHAVE_NF)
	SELECT TOP 1 (REPLICATE('0', 6 - LEN((SELECT MAX(CSERIES.ULT_NUM)+1 FROM PSGACTE.DBO.CSERIES WHERE CSERIES.SERIE = @SERIE))) + 
		RTrim((SELECT MAX(CSERIES.ULT_NUM)+1 FROM PSGACTE.DBO.CSERIES WHERE CSERIES.SERIE = @SERIE))), TRANSP_COD, @SERIE, CHAVE_NFE
	FROM GWGERACTE
	WHERE USUARIO = @USUARIO

UPDATE PSGACTE.DBO.CSERIES
	SET CSERIES.ULT_NUM = (SELECT MAX(CSERIES.ULT_NUM)+1 FROM PSGACTE.DBO.CSERIES WHERE CSERIES.SERIE = @SERIE)
FROM PSGACTE.DBO.CSERIES
WHERE CSERIES.SERIE = @SERIE