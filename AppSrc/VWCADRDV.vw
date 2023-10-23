Use Windows.pkg
Use DFClient.pkg
Use FRDVH.dd
Use FRDVI.dd
Use ICTE.dd
Use FRDVABAS.dd
Use FFRDVDSAL.dd
Use FFRDVABAEX.dd
Use FFRDVMEC.dd
Use FRDVDESPMOT.dd
Use FRDVDESP.dd
Use FRDVDEBANT.dd
Use ICTE.sl
Use DFEntry.pkg
Use dfcentry.pkg
Use cDbCJGrid.pkg
Use dfSpnEnt.pkg

Use cDbForm_SI.pkg
Use cDbCJGrid_SI.pkg
Use BPCoreBase.bp
Use cDbSpinForm_SI.pkg
Use dfTabDlg.pkg
Use cSplitButton.pkg
Use cDbComboForm_SI.pkg
Use SLGCCUSTO.sl
Use cDbCJGridColumn_SI.pkg
Use cCJGrid.pkg
Use dfLine.pkg
Use cDbTextEdit.pkg

Deferred_View Activate_oVWCADRDV for ;
Object oVWCADRDV is a dbView
    Object oICTE_DD is a ICTEDataDictionary
        Set Ordering to 1
    End_Object

    Object oFRDVH_DD is a FRDVHDataDictionary
        Set Ordering to 1
    End_Object

    Object oFRDVDEBANT_DD is a FRDVDEBANTDataDictionary
        Set Constrain_file to FRDVH.File_number
        Set DDO_Server to oFRDVH_DD
        
        Procedure OnConstrain
             Constrain FRDVDEBANT.TIPO eq 6
        End_Procedure
        
        Procedure Update
            Forward Send Update
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
        Procedure Backout
            Forward Send Backout
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
    End_Object

    Object oFRDVDESPMOT_DD is a FRDVDESPMOTDataDictionary
        Set Constrain_file to FRDVH.File_number
        Set DDO_Server to oFRDVH_DD
        
        Procedure OnConstrain
             Constrain FRDVDESPMOT.TIPO eq 5
        End_Procedure
        
        Procedure Update
            Forward Send Update
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
        Procedure Backout
            Forward Send Backout
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
    End_Object

    Object oFFRDVMEC_DD is a FFRDVMECDataDictionary
        Set Constrain_file to FRDVH.File_number
        Set DDO_Server to oFRDVH_DD
        Set Ordering to 1
        
        Procedure OnConstrain
             Constrain FFRDVMEC.TIPO eq 2
        End_Procedure
        
        Procedure Update
            Forward Send Update
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
        Procedure Backout
            Forward Send Backout
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
    End_Object

    Object oFFRDVABAEX_DD is a FFRDVABAEXDataDictionary
        Set Constrain_file to FRDVH.File_number
        Set DDO_Server to oFRDVH_DD
        Set Ordering to 1
        
        Procedure OnConstrain
             Constrain FFRDVABAEX.TIPO eq 3
        End_Procedure
        
        Procedure Update
            Forward Send Update
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
        Procedure Backout
            Forward Send Backout
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
    End_Object

    Object oFFRDVDSAL_DD is a FFRDVDSALDataDictionary
        Set Constrain_file to FRDVH.File_number
        Set DDO_Server to oFRDVH_DD
        Set Ordering to 1
        
        Procedure OnConstrain
             Constrain FFRDVDSAL as (FFRDVDSAL.TIPO = 0 or FFRDVDSAL.TIPO = 1) 
        End_Procedure
        
        Procedure Update
            Forward Send Update
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
        Procedure Backout
            Forward Send Backout
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure

    End_Object

    Object oFRDVDESP_DD is a FRDVDESPDataDictionary
        Set Constrain_file to FRDVH.File_number
        Set DDO_Server to oFRDVH_DD
        Set Ordering to 1
        
        Procedure OnConstrain
             Constrain FRDVDESP.TIPO eq 4
        End_Procedure
        
        Procedure Update
            Forward Send Update
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
        Procedure Backout
            Forward Send Backout
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
    End_Object

    Object oFRDVABAS_DD is a FRDVABASDataDictionary
        Set Constrain_file to FRDVH.File_number
        Set DDO_Server to oFRDVH_DD
        Set Ordering to 1
        
        Procedure Update
            Forward Send Update
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
        Procedure Backout
            Forward Send Backout
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
    End_Object

    Object oFRDVI_DD is a FRDVIDataDictionary
        Set Constrain_file to FRDVH.File_number
        Set DDO_Server to oFRDVH_DD
        Set Field_Prompt_Object    Field FRDVI.NR_CTE     to (oICTE_sl(Self))
        Set Ordering to 1
        
        Procedure Update
            Forward Send Update
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
        Procedure Backout
            Forward Send Backout
            Set pbEnabled of oIdleHandlerPosUpdateBackout to True
        End_Procedure
        
    End_Object

    Set Main_DD to oFRDVH_DD
    Set Server to oFRDVH_DD

    Set Border_Style to Border_Thick
    Set Size to 263 674
    Set Location to -7 2
    Set Label to "Cadastro de Registro de Viagem - RDV"
    Set Maximize_Icon to True
    Set pbAutoActivate to True
    Set Verify_Save_msg to (RefFunc(No_Confirmation))
    
    Object oIdleHandler_Update_Footer is a cIdleHandler
        Procedure OnIdle
            String sResult
            
            //Send Update_Footer of oFRDVI_VLR_TOTAL
            
            Set pbEnabled to False
        End_Procedure      
    End_Object // oIdleHandler_Update_Footer
    
    Object oIdleHandler is a cIdleHandler
        Procedure OnIdle
            Set pbEnabled to False
           
            Send Hab_Campos
            Send Pinta_Campos
           
//            Send Rebuild_Constraints of NORDAPT_DD
//            Send MovetoFirstRow of oGrid_NORDAPT
//            Send Rebuild_Constraints of NFVINCOP_DD
//            Send MovetoFirstRow of oGrid_NFVINCOD
//            Send Rebuild_Constraints of NVINCOP_DD
//            Send MoveToFirstRow of oGrid_NVINCOP
           
        End_Procedure
    End_Object
    
    Object oIdleHandlerPosUpdateBackout is a cIdleHandler
        Procedure OnIdle
            Set pbEnabled to False
           
            Send CalculaRodape
           
        End_Procedure
    End_Object

    Object oFRDVH_CODIGO is a cDbForm_SI
        Entry_Item FRDVH.CODIGO
        Set Location to 13 10
        Set Size to 13 70
        Set Label to "C¢digo"
        Set Auto_Label_State to True
        Set Label_Justification_Mode to JMode_Top
        Set Label_Col_Offset to 0
        Set pbSequenciaAuto to True
        
        Procedure Refresh Integer Mode
            Forward Send Refresh Mode          // do normal refrsh
            
            Set pbEnabled of oIdleHandler to True

        End_Procedure
    End_Object

    Object oFRDVH_CCU_CODIGO is a cDbForm_SI
        Entry_Item FRDVH.CCU_CODIGO
        Set Location to 13 83
        Set Size to 13 70
        Set Label to "Centro de Custo"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
        Set Prompt_Button_Mode to PB_PromptOn
        Set Prompt_Object to oSLGCCUSTO
    End_Object

    Object oDbCbMes is a cDbComboForm_SI
        Entry_Item FRDVH.MES
        Set Size to 12 75
        Set Location to 13 157
        Set Label to "Màs"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
        Set Entry_State to False
        Set Combo_Sort_State to False
    End_Object

    Object oFRDVH_ANO is a cDbSpinForm_SI
        Entry_Item FRDVH.ANO
        Set Location to 13 236
        Set Size to 13 41
        Set Label to "Ano"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
        Set Maximum_Position to 4000
        Set Minimum_Position to 2000

        Procedure Entering Returns Integer
            Integer iRetVal
            Forward Get msg_Entering to iRetVal
            
            Integer iValor
            Date dAtual
            Get Field_Current_Value of oFRDVH_DD Field FRDVH.ANO to iValor
            If (iValor = 0 or iValor < (Minimum_Position(Self))) Begin
                Sysdate dAtual
                Set Field_Changed_Value of oFRDVH_DD Field FRDVH.ANO to (DateGetYear(dAtual))
            End
            
            Procedure_Return iRetVal
        End_Procedure
    End_Object

    Object oFRDVH_PERC_COMISSAO is a cDbForm_SI
        Entry_Item FRDVH.PERC_COMISSAO
        Set Location to 13 281
        Set Size to 13 36
        Set Label to "% Comiss∆o"
    End_Object

    Object oFRDVH_TIPO_COMISSAO is a cDbComboForm_SI
        Entry_Item FRDVH.TIPO_COMISSAO
        Set Location to 13 321
        Set Size to 12 66
        Set Label to "Tipo C†lculo"
        Set Label_Justification_Mode to JMode_Top
        Set Entry_State to False
        Set Combo_Sort_State to False
    End_Object

    Object oTabDialog is a dbTabDialog
        Set Size to 221 666
        Set Location to 36 5
    
        Set Rotate_Mode to RM_Rotate
        Set peAnchors to anAll

        Object oTabResumo is a dbTabPage
            Set Label to "Resumo"

            Object oDbGroup1 is a dbGroup
                Set Size to 167 143
                Set Location to 2 4
                Set Label to ""

                Object oFrmReceitaLiq is a dbForm
                    Entry_Item FRDVH.TOT_RECEITA_LIQ
                    Set Location to 9 73
                    Set Size to 13 55
                    Set Label to "Receita (L°quida)"
                    Set peAnchors to anNone
                    Set Enabled_State to False
                    Set FontWeight to fw_Bold
                End_Object
                Object oFrmAbastFaz is a dbForm
                    Entry_Item FRDVH.TOT_ABAST_FAZ
                    Set Location to 28 73
                    Set Size to 13 55
                    Set Label to "Abast.  (Fazenda)"
                    Set peAnchors to anNone
                    Set Enabled_State to False
                End_Object
                Object oFrmAbastCid is a dbForm
                    Entry_Item FRDVH.TOT_ABAST_EX
                    Set Location to 44 73
                    Set Size to 13 55
                    Set Label to "Abast. (Cidade)"
                    Set peAnchors to anNone
                    Set Enabled_State to False
                End_Object
                Object oFrmMecanica is a dbForm
                    Entry_Item FRDVH.TOT_MEC_PECAS
                    Set Location to 60 73
                    Set Size to 13 55
                    Set Label to "Mec/Peáas/M.O."
                    Set peAnchors to anNone
                    Set Enabled_State to False
                End_Object
                Object oFrmDespDiversas is a dbForm
                    Entry_Item FRDVH.TOT_DESP_DIVERSAS
                    Set Location to 76 73
                    Set Size to 13 55
                    Set Label to "Despesas Diversas"
                    Set peAnchors to anNone
                    Set Enabled_State to False
                End_Object

                Object oFrmDespesa is a dbForm
                    Entry_Item FRDVH.TOT_DESPESAS
                    Set Location to 108 73
                    Set Size to 13 55
                    Set Label to "Despesa"
                    Set peAnchors to anNone
                    Set Enabled_State to False
                    Set FontWeight to fw_Bold
                End_Object

                Object oLineControl1 is a LineControl
                    Set Size to 2 137
                    Set Location to 25 3
                End_Object

                Object oFrmComissao is a dbForm
                    Entry_Item FRDVH.TOT_COMISSAO
                    Set Location to 128 73
                    Set Size to 13 55
                    Set Label to "Comiss∆o"
                    Set Enabled_State to False
                    Set peAnchors to anNone
                End_Object

                Object oLineControl1 is a LineControl
                    Set Size to 2 137
                    Set Location to 124 3
                End_Object

                Object oFrmSaldo is a dbForm
                    Entry_Item FRDVH.SALDO
                    Set Location to 148 73
                    Set Size to 13 55
                    Set Label to "Saldo"
                    Set peAnchors to anNone
                    Set Enabled_State to False
                    Set FontWeight to fw_Bold
                End_Object

                Object oLineControl1 is a LineControl
                    Set Size to 2 137
                    Set Location to 144 3
                End_Object

                Object oFrmDespPgMot is a dbForm
                    Entry_Item FRDVH.TOT_DESP_MOT
                    Set Location to 92 73
                    Set Size to 13 55
                    Set Label to "Desp. Pg. Motorista"
                    Set Enabled_State to False
                End_Object
            End_Object

            Object oDbGroup2 is a dbGroup
                Set Size to 65 143
                Set Location to 2 154
                Set Label to "Acerto Motorista"

                Object oFrmAdiant is a dbForm
                    Entry_Item FRDVH.TOT_ADIANT
                    Set Location to 10 70
                    Set Size to 13 55
                    Set Label to "Adiantamentos"
                    Set Enabled_State to False
                    Set peAnchors to anNone
                End_Object

                Object oFrmSal is a dbForm
                    Entry_Item FRDVH.TOT_SALARIOS
                    Set Location to 26 70
                    Set Size to 13 55
                    Set Label to "Sal†rio"
                    Set Enabled_State to False
                    Set peAnchors to anNone
                End_Object

                Object oFrmDebAnt is a dbForm
                    Entry_Item FRDVH.TOT_DEB_ANT
                    Set Location to 42 70
                    Set Size to 13 55
                    Set Label to "DÇb. Anteriores"
                    Set Enabled_State to False
                End_Object
            End_Object

            Object oDbGroup3 is a dbGroup
                Set Size to 99 143
                Set Location to 69 155
                Set Label to "ACERTO FINAL"

                Object oFrmAcertoFinal is a dbForm
                    Entry_Item FRDVH.ACERTO_FINAL
                    Set Location to 19 5
                    Set Size to 27 134
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Top
                    Set peAnchors to anNone
                    Set Enabled_State to False
                    Set FontWeight to fw_Bold
                    Set form_FontWeight item 0 to 40
                    Set form_FontHeight item 0 to 60
                End_Object
            End_Object

            Object oTEObs is a cDbTextEdit
                Entry_Item FRDVH.OBSERVACOES
                Set Size to 153 339
                Set Location to 15 309
                Set Label to "Observaá‰es"
                Set peAnchors to anTopLeftRight

                Procedure Exiting Handle hoDestination Returns Integer
                    Integer iRetVal
                    Handle hoDD
                    Boolean bHasRecord bChanged
                    
                    Forward Get msg_Exiting hoDestination to iRetVal
                    
                    Get Server to hoDD
                    //Get HasRecord of hoDD to bHasRecord
                    Get Should_Save of hoDD to bChanged
                    If (bChanged) Send Request_Save_No_Clear of oFRDVH_DD
                    
                    
                    Procedure_Return iRetVal
                End_Procedure
            End_Object

            Object oLineControl2 is a LineControl
                Set Size to 1 654
                Set Location to 171 3
                Set peAnchors to anTopLeftRight
            End_Object
        End_Object

        Object oTPItens is a dbTabPage
            Set Label to "Receitas"

            Object oGridItens is a cDbCJGrid_SI
                Set Server to oFRDVI_DD
                Set Size to 215 655
                Set Location to 4 2
                Set peAnchors to anAll
                Set pbAutoColumnSizing to False
                Set pbShowFooter to True
                Set Ordering to 1

                Object oFRDVI_PES_TRANSP is a cDbCJGridColumn
                    Entry_Item FRDVI.PES_TRANSP
                    Set piWidth to 70
                    Set psCaption to "Transp."
                End_Object

                Object oFRDVI_SERIE_CTE is a cDbCJGridColumn
                    Entry_Item FRDVI.SERIE_CTE
                    Set piWidth to 75
                    Set psCaption to "SÇrie Cte"
                End_Object

                Object oFRDVI_NR_CTE is a cDbCJGridColumn
                    Entry_Item FRDVI.NR_CTE
                    Set piWidth to 82
                    Set psCaption to "Nr. CTe"

                    Procedure Prompt_Callback Handle hoPrompt
                        String sTransp sSerie
                        Forward Send Prompt_Callback hoPrompt
                        
                        Get Field_Current_Value of oFRDVI_DD Field FRDVI.PES_TRANSP to sTransp
                        Get Field_Current_Value of oFRDVI_DD Field FRDVI.SERIE_CTE to sSerie
                        
                        Set psTrasnp of hoPrompt to sTransp
                        Set psSerie of hoPrompt to sSerie
                        
                    End_Procedure
                    
                    Procedure Prompt
                        Forward Send Prompt
                        
                        Set Field_Changed_Value of oFRDVI_DD Field FRDVI.PES_TRANSP to ICTE.COD_TRANSP
                        Set Field_Changed_Value of oFRDVI_DD Field FRDVI.SERIE_CTE  to ICTE.COD_SERIE
                        Set Field_Changed_Value of oFRDVI_DD Field FRDVI.ORIGEM     to ICTE.MUN_ORIGEM
                        Set Field_Changed_Value of oFRDVI_DD Field FRDVI.DESTINO    to ICTE.MUN_DESTINO
                        Set Field_Changed_Value of oFRDVI_DD Field FRDVI.PRODUTO    to ICTE.PRODUTO
                        
                    End_Procedure
                    
                End_Object

                Object oFRDVI_DATA is a cDbCJGridColumn
                    Entry_Item FRDVI.DATA
                    Set piWidth to 85
                    Set psCaption to "Data"

                End_Object

                Object oFRDVI_EMPRESA is a cDbCJGridColumn
                    Entry_Item FRDVI.EMPRESA
                    Set piWidth to 165
                    Set psCaption to "Empresa"
                End_Object

                Object oFRDVI_ORIGEM is a cDbCJGridColumn
                    Entry_Item FRDVI.ORIGEM
                    Set piWidth to 133
                    Set psCaption to "Origem"
                End_Object

                Object oFRDVI_DESTINO is a cDbCJGridColumn
                    Entry_Item FRDVI.DESTINO
                    Set piWidth to 115
                    Set psCaption to "Destino"
                End_Object

                Object oFRDVI_KM_INICIAL is a cDbCJGridColumn
                    Entry_Item FRDVI.KM_INICIAL
                    Set piWidth to 77
                    Set psCaption to "KM Inicial"
                End_Object

                Object oFRDVI_KM_FINAL is a cDbCJGridColumn
                    Entry_Item FRDVI.KM_FINAL
                    Set piWidth to 72
                    Set psCaption to "KM Final"
                End_Object

                Object oFRDVI_PRODUTO is a cDbCJGridColumn
                    Entry_Item FRDVI.PRODUTO
                    Set piWidth to 150
                    Set psCaption to "Produto"
                End_Object

                Object oFRDVI_PESO_SAIDA is a cDbCJGridColumn
                    Entry_Item FRDVI.PESO_SAIDA
                    Set piWidth to 94
                    Set psCaption to "Peso Sa°da"
                End_Object

                Object oFRDVI_PESO_CHEGADA is a cDbCJGridColumn
                    Entry_Item FRDVI.PESO_CHEGADA
                    Set piWidth to 83
                    Set psCaption to "Peso Chegada"
                End_Object

                Object oFRDVI_VLR_FRETE is a cDbCJGridColumn
                    Entry_Item FRDVI.VLR_FRETE
                    Set piWidth to 84
                    Set psCaption to "Vlr. Frete"
                End_Object

                Object oFRDVI_VLR_TOTAL is a cDbCJGridColumn
                    Entry_Item FRDVI.VLR_TOTAL
                    Set piWidth to 100
                    Set psCaption to "Vlr. Total"
                    Set pbEditable to False
                End_Object

                Object oFRDVI_VLR_SEGURO is a cDbCJGridColumn
                    Entry_Item FRDVI.VLR_SEGURO
                    Set piWidth to 95
                    Set psCaption to "Vlr. Seguro"
                End_Object

                Object oFRDVI_VLR_DESC_OUTROS is a cDbCJGridColumn
                    Entry_Item FRDVI.VLR_DESC_OUTROS
                    Set piWidth to 108
                    Set psCaption to "Descontos/Outros"
                End_Object

                Object oFRDVI_VLR_DESC_QUEBRA is a cDbCJGridColumn
                    Entry_Item FRDVI.VLR_DESC_QUEBRA
                    Set piWidth to 105
                    Set psCaption to "Desc. / Quebra"
                    Set pbEditable to False
                End_Object

                Object oFRDVI_VLR_RECEBER is a cDbCJGridColumn
                    Entry_Item FRDVI.VLR_RECEBER
                    Set piWidth to 109
                    Set psCaption to "Frete a Receber"
                    Set pbEditable to False
                End_Object

                Object oFRDVI_VLR_RECEBIDO_ADTO is a cDbCJGridColumn
                    Entry_Item FRDVI.VLR_RECEBIDO_ADTO
                    Set piWidth to 95
                    Set psCaption to "Vlr. Receb. Adto."
                End_Object

                Object oFRDVI_DATA_DEPOSITO_ADTO is a cDbCJGridColumn
                    Entry_Item FRDVI.DATA_DEPOSITO_ADTO
                    Set piWidth to 99
                    Set psCaption to "Data Dep¢sito Adto."
                End_Object

                Object oFRDVI_BANCO_DEPOSITO_ADTO is a cDbCJGridColumn
                    Entry_Item FRDVI.BANCO_DEPOSITO_ADTO
                    Set piWidth to 96
                    Set psCaption to "Banco Dep¢sto Adto."
                End_Object

                Object oFRDVI_SALDO_RECEBIDO is a cDbCJGridColumn
                    Entry_Item FRDVI.SALDO_RECEBIDO
                    Set piWidth to 91
                    Set psCaption to "Saldo Recebido"
                End_Object

                Object oFRDVI_DATA_DEPOSITO is a cDbCJGridColumn
                    Entry_Item FRDVI.DATA_DEPOSITO
                    Set piWidth to 77
                    Set psCaption to "Data Dep¢sito"
                End_Object

                Object oFRDVI_BANCO_DEPOSITO is a cDbCJGridColumn
                    Entry_Item FRDVI.BANCO_DEPOSITO
                    Set piWidth to 84
                    Set psCaption to "Banco Dep¢sito"
                End_Object

                Object oFRDVI_DIFERENCA is a cDbCJGridColumn
                    Entry_Item FRDVI.DIFERENCA
                    Set piWidth to 92
                    Set psCaption to "Diferenáa"
                    Set pbEditable to False
                End_Object
                
            End_Object
        End_Object

        Object oTPAdiantSal is a dbTabPage
            Set Label to "Adto. Sal."

            Object oGridAdtoSal is a cDbCJGrid_SI
                Set Server to oFFRDVDSAL_DD
                Set Size to 198 657
                Set Location to 3 2
                Set peAnchors to anAll
                Set pbAutoColumnSizing to False
                Set pbReadOnly to True
                Set Ordering to 1

                Object oFFRDVDSAL_SEQ is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.SEQ
                    Set piWidth to 58
                    Set psCaption to "Seq."
                End_Object

                Object oFFRDVDSAL_PES_CODIGO is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.PES_CODIGO
                    Set piWidth to 85
                    Set psCaption to "C¢d. Pessoa"
                End_Object

                Object oFFRDVDSAL_RAZAO_SOCIAL is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.RAZAO_SOCIAL
                    Set piWidth to 323
                    Set psCaption to "Raz∆o Social"
                End_Object

                Object oFFRDVDSAL_DPR_DOCUM is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.DPR_DOCUM
                    Set piWidth to 132
                    Set psCaption to "Documento"
                End_Object

                Object oFFRDVDSAL_AGR_COD is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.AGR_COD
                    Set piWidth to 78
                    Set psCaption to "C¢d. Agrupador"
                End_Object

                Object oFFRDVDSAL_DESCRICAO is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.DESCRICAO
                    Set piWidth to 201
                    Set psCaption to "Descr. Agrupador"
                End_Object

                Object oFFRDVDSAL_VALOR is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.VALOR
                    Set piWidth to 120
                    Set psCaption to "Valor"
                End_Object

                Object oFFRDVDSAL_DT_VENCTO is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.DT_VENCTO
                    Set piWidth to 102
                    Set psCaption to "Data Vencto."
                End_Object

                Object oFFRDVDSAL_HISTORICO is a cDbCJGridColumn
                    Entry_Item FFRDVDSAL.HISTORICO
                    Set piWidth to 866
                    Set psCaption to "Hist¢rico"
                End_Object

                Object oFFRDVDSAL_TIPO is a cDbCJGridColumn_SI
                    Entry_Item FFRDVDSAL.TIPO
                    Set piWidth to 72
                    Set psCaption to "Tipo"
                    Set pbComboButton to True
                End_Object
            End_Object
        End_Object

        Object oTPDespPecas is a dbTabPage
            Set Label to "Des. Peáas"

            Object oGridDespPecas is a cDbCJGrid_SI
                Set Server to oFFRDVMEC_DD
                Set Size to 198 657
                Set Location to 3 2
                Set peAnchors to anAll
                Set pbAutoColumnSizing to False
                Set pbReadOnly to True
                Set Ordering to 1

                Object oFFRDVMEC_SEQ is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.SEQ
                    Set piWidth to 58
                    Set psCaption to "Seq."
                End_Object

                Object oFFRDVMEC_PES_CODIGO is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.PES_CODIGO
                    Set piWidth to 85
                    Set psCaption to "C¢d. Pessoa"
                End_Object

                Object oFFRDVMECP_RAZAO_SOCIAL is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.RAZAO_SOCIAL
                    Set piWidth to 323
                    Set psCaption to "Raz∆o Social"
                End_Object

                Object oFFRDVMEC_DPR_DOCUM is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.DPR_DOCUM
                    Set piWidth to 132
                    Set psCaption to "Documento"
                End_Object

                Object oFFRDVMEC_AGR_COD is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.AGR_COD
                    Set piWidth to 78
                    Set psCaption to "C¢d. Agrupador"
                End_Object

                Object oFFRDVMEC_DESCRICAO is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.DESCRICAO
                    Set piWidth to 201
                    Set psCaption to "Descr. Agrupador"
                End_Object

                Object oFFRDVMEC_VALOR is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.VALOR
                    Set piWidth to 120
                    Set psCaption to "Valor"
                End_Object

                Object oFFRDVMEC_DT_VENCTO is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.DT_VENCTO
                    Set piWidth to 102
                    Set psCaption to "Data Vencto."
                End_Object

                Object oFFRDVMEC_HISTORICO is a cDbCJGridColumn
                    Entry_Item FFRDVMEC.HISTORICO
                    Set piWidth to 866
                    Set psCaption to "Hist¢rico"
                End_Object

                Object oFFRDVMEC_TIPO is a cDbCJGridColumn_SI
                    Entry_Item FFRDVMEC.TIPO
                    Set piWidth to 58
                    Set psCaption to "Tipo"
                    Set pbComboButton to True
                End_Object
            End_Object
        End_Object

        Object oTPAbastExternos is a dbTabPage
            Set Label to "Abast. Externos"

            Object oGridAbastExt is a cDbCJGrid_SI
                Set Server to oFFRDVABAEX_DD
                Set Size to 198 657
                Set Location to 3 1
                Set peAnchors to anAll
                Set pbAutoColumnSizing to False
                Set pbReadOnly to True
                Set Ordering to 1

                Object oFFRDVABAE_SEQ is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.SEQ
                    Set piWidth to 58
                    Set psCaption to "Seq."
                End_Object

                Object oFFRDVABAE_PES_CODIGO is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.PES_CODIGO
                    Set piWidth to 85
                    Set psCaption to "C¢d. Pessoa"
                End_Object

                Object oFFRDVABAE_RAZAO_SOCIAL is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.RAZAO_SOCIAL
                    Set piWidth to 323
                    Set psCaption to "Raz∆o Social"
                End_Object

                Object oFFRDVABAE_DPR_DOCUM is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.DPR_DOCUM
                    Set piWidth to 132
                    Set psCaption to "Documento"
                End_Object

                Object oFFRDVABAE_AGR_COD is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.AGR_COD
                    Set piWidth to 78
                    Set psCaption to "C¢d. Agrupador"
                End_Object

                Object oFFRDVABAE_DESCRICAO is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.DESCRICAO
                    Set piWidth to 201
                    Set psCaption to "Descr. Agrupador"
                End_Object

                Object oFFRDVABAE_VALOR is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.VALOR
                    Set piWidth to 120
                    Set psCaption to "Valor"
                End_Object

                Object oFFRDVABAE_DT_VENCTO is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.DT_VENCTO
                    Set piWidth to 102
                    Set psCaption to "Data Vencto."
                End_Object

                Object oFFRDVABAE_HISTORICO is a cDbCJGridColumn
                    Entry_Item FFRDVABAEX.HISTORICO
                    Set piWidth to 866
                    Set psCaption to "Hist¢rico"
                End_Object

                Object oFFRDVABAEX_TIPO is a cDbCJGridColumn_SI
                    Entry_Item FFRDVABAEX.TIPO
                    Set piWidth to 64
                    Set psCaption to "Tipo"
                    Set pbComboButton to True
                End_Object
            End_Object
        End_Object

        Object oTPAbastFaz is a dbTabPage
            Set Label to "Abast. Fazenda"

            Object oGridAbastFaz is a cDbCJGrid_SI
                Set Server to oFRDVABAS_DD
                Set Size to 198 648
                Set Location to 3 6
                Set pbAutoColumnSizing to False
                Set peAnchors to anAll
                Set Ordering to 1

                Object oFRDVABAS_ROM_NUMERO is a cDbCJGridColumn
                    Entry_Item FRDVABAS.ROM_NUMERO
                    Set piWidth to 92
                    Set psCaption to "Romaneio"
                End_Object

                Object oFRDVABAS_AALMOX_COD is a cDbCJGridColumn
                    Entry_Item FRDVABAS.AALMOX_COD
                    Set piWidth to 89
                    Set psCaption to "C¢d. Almox."
                End_Object

                Object oFRDVABAS_ALMOX_DESCRICAO is a cDbCJGridColumn
                    Entry_Item FRDVABAS.ALMOX_DESCRICAO
                    Set piWidth to 147
                    Set psCaption to "Descr. Almox."
                End_Object

                Object oFRDVABAS_DT_SAIDA is a cDbCJGridColumn
                    Entry_Item FRDVABAS.DT_SAIDA
                    Set piWidth to 83
                    Set psCaption to "Data Sa°da"
                End_Object

                Object oFRDVABAS_MOTORISTA is a cDbCJGridColumn
                    Entry_Item FRDVABAS.MOTORISTA
                    Set piWidth to 357
                    Set psCaption to "Motorista"
                End_Object

                Object oFRDVABAS_QTDADE is a cDbCJGridColumn
                    Entry_Item FRDVABAS.QTDADE
                    Set piWidth to 76
                    Set psCaption to "Quantidade"
                End_Object

                Object oFRDVABAS_VLR_UNITARIO is a cDbCJGridColumn
                    Entry_Item FRDVABAS.VLR_UNITARIO
                    Set piWidth to 86
                    Set psCaption to "Vlr. Unit†rio"
                End_Object

                Object oFRDVABAS_VLR_TOTAL is a cDbCJGridColumn
                    Entry_Item FRDVABAS.VLR_TOTAL
                    Set piWidth to 91
                    Set psCaption to "Vlr. Total"
                End_Object

                Object oFRDVABAS_CCU_CODIGO is a cDbCJGridColumn
                    Entry_Item FRDVABAS.CCU_CODIGO
                    Set piWidth to 81
                    Set psCaption to "C¢d. C.Custo"
                End_Object

                Object oFRDVABAS_CCU_DESCRICAO is a cDbCJGridColumn
                    Entry_Item FRDVABAS.CCU_DESCRICAO
                    Set piWidth to 228
                    Set psCaption to "Descr. C.Custo"
                End_Object
            End_Object
        End_Object

        Object oTPDespDiversas is a dbTabPage
            Set Label to "Desp. Diversas"

            Object oGridDespesas is a cDbCJGrid_SI
                Set Server to oFRDVDESP_DD
                Set Size to 198 657
                Set Location to 3 1
                Set peAnchors to anAll
                Set pbAutoColumnSizing to False
                Set pbReadOnly to True
                Set Ordering to 1

                Object oFRDVDESP_SEQ is a cDbCJGridColumn
                    Entry_Item FRDVDESP.SEQ
                    Set piWidth to 58
                    Set psCaption to "Seq."
                End_Object

                Object oFRDVDESP_PES_CODIGO is a cDbCJGridColumn
                    Entry_Item FRDVDESP.PES_CODIGO
                    Set piWidth to 85
                    Set psCaption to "C¢d. Pessoa"
                End_Object

                Object oFRDVDESP_RAZAO_SOCIAL is a cDbCJGridColumn
                    Entry_Item FRDVDESP.RAZAO_SOCIAL
                    Set piWidth to 323
                    Set psCaption to "Raz∆o Social"
                End_Object

                Object oFRDVDESP_DPR_DOCUM is a cDbCJGridColumn
                    Entry_Item FRDVDESP.DPR_DOCUM
                    Set piWidth to 132
                    Set psCaption to "Documento"
                End_Object

                Object oFRDVDESP_AGR_COD is a cDbCJGridColumn
                    Entry_Item FRDVDESP.AGR_COD
                    Set piWidth to 78
                    Set psCaption to "C¢d. Agrupador"
                End_Object

                Object oFRDVDESP_DESCRICAO is a cDbCJGridColumn
                    Entry_Item FRDVDESP.DESCRICAO
                    Set piWidth to 201
                    Set psCaption to "Descr. Agrupador"
                End_Object

                Object oFRDVDESP_VALOR is a cDbCJGridColumn
                    Entry_Item FRDVDESP.VALOR
                    Set piWidth to 120
                    Set psCaption to "Valor"
                End_Object

                Object oFRDVDESP_DT_VENCTO is a cDbCJGridColumn
                    Entry_Item FRDVDESP.DT_VENCTO
                    Set piWidth to 102
                    Set psCaption to "Data Vencto."
                End_Object

                Object oFRDVDESP_HISTORICO is a cDbCJGridColumn
                    Entry_Item FRDVDESP.HISTORICO
                    Set piWidth to 866
                    Set psCaption to "Hist¢rico"
                End_Object

                Object oFRDVDESP_TIPO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESP.TIPO
                    Set piWidth to 70
                    Set psCaption to "Tipo"
                    Set pbComboButton to True
                End_Object
                
                Object oFRDVDESP_ABONADO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESP.ABONADO
                    Set piWidth to 70
                    Set psCaption to "Abonado"
                    Set pbCheckbox to True
                End_Object
            End_Object
        End_Object
        
        Procedure Atualiza_Gris
            Send MoveToFirstRow of oGridItens
            Send MoveToFirstRow of oGridAdtoSal
            Send MoveToFirstRow of oGridAbastExt
            Send MoveToFirstRow of oGridAbastFaz
            Send MoveToFirstRow of oGridDespPecas
            Send MoveToFirstRow of oGridDespesas
            Send MoveToFirstRow of oGridDebAnt
            Send MoveToFirstRow of oGridDespMot
        End_Procedure

        Object oTabDespMot is a dbTabPage
            Set Label to "Desp. Motorista"

            Object oGridDespMot is a cDbCJGrid_SI
                Set Server to oFRDVDESPMOT_DD
                Set Size to 196 647
                Set Location to 5 6
                Set pbAutoColumnSizing to False
                Set peAnchors to anAll
                Set pbReadOnly to True

                Object oFRDVDESPMOT_SEQ is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.SEQ
                    Set piWidth to 50
                    Set psCaption to "Seq."
                End_Object

                Object oFRDVDESPMOT_PES_CODIGO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.PES_CODIGO
                    Set piWidth to 79
                    Set psCaption to "C¢d. Pessoa"
                End_Object

                Object oFRDVDESPMOT_RAZAO_SOCIAL is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.RAZAO_SOCIAL
                    Set piWidth to 323
                    Set psCaption to "Raz∆o Social"
                End_Object

                Object oFRDVDESPMOT_DPR_DOCUM is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.DPR_DOCUM
                    Set piWidth to 132
                    Set psCaption to "Documento"
                End_Object

                Object oFRDVDESPMOT_AGR_COD is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.AGR_COD
                    Set piWidth to 99
                    Set psCaption to "C¢d. Agrupador"
                End_Object

                Object oFRDVDESPMOT_DESCRICAO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.DESCRICAO
                    Set piWidth to 211
                    Set psCaption to "Descr. Agrupador"
                End_Object

                Object oFRDVDESPMOT_VALOR is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.VALOR
                    Set piWidth to 88
                    Set psCaption to "Valor"
                End_Object

                Object oFRDVDESPMOT_DT_VENCTO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.DT_VENCTO
                    Set piWidth to 106
                    Set psCaption to "Data Vencto."
                End_Object

                Object oFRDVDESPMOT_HISTORICO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.HISTORICO
                    Set piWidth to 682
                    Set psCaption to "Hist¢rico"
                End_Object

                Object oFRDVDESPMOT_TIPO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.TIPO
                    Set piWidth to 91
                    Set psCaption to "Tipo"
                End_Object

                Object oFRDVDESPMOT_ABONADO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDESPMOT.ABONADO
                    Set piWidth to 73
                    Set psCaption to "Abonado"
                End_Object

                
            End_Object
        End_Object

        Object oTabDebAnt is a dbTabPage
            Set Label to "DÇbitos Anteriores"

            Object oGridDebAnt is a cDbCJGrid_SI
                Set Server to oFRDVDEBANT_DD
                Set Size to 196 647
                Set Location to 5 6
                Set pbAutoColumnSizing to False
                Set peAnchors to anAll
                Set pbReadOnly to True

                Object oFRDVDEBANT_SEQ is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.SEQ
                    Set piWidth to 50
                    Set psCaption to "Seq."
                End_Object

                Object oFRDVDEBANT_PES_CODIGO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.PES_CODIGO
                    Set piWidth to 79
                    Set psCaption to "C¢d. Pessoa"
                End_Object

                Object oFRDVDEBANT_RAZAO_SOCIAL is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.RAZAO_SOCIAL
                    Set piWidth to 323
                    Set psCaption to "Raz∆o Social"
                End_Object

                Object oFRDVDEBANT_DPR_DOCUM is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.DPR_DOCUM
                    Set piWidth to 132
                    Set psCaption to "Documento"
                End_Object

                Object oFRDVDEBANT_AGR_COD is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.AGR_COD
                    Set piWidth to 99
                    Set psCaption to "C¢d. Agrupador"
                End_Object

                Object oFRDVDEBANT_DESCRICAO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.DESCRICAO
                    Set piWidth to 211
                    Set psCaption to "Descr. Agrupador"
                End_Object

                Object oFRDVDEBANT_VALOR is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.VALOR
                    Set piWidth to 88
                    Set psCaption to "Valor"
                End_Object

                Object oFRDVDEBANT_DT_VENCTO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.DT_VENCTO
                    Set piWidth to 106
                    Set psCaption to "Data Vencto."
                End_Object

                Object oFRDVDEBANT_HISTORICO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.HISTORICO
                    Set piWidth to 682
                    Set psCaption to "Hist¢rico"
                End_Object

                Object oFRDVDEBANT_TIPO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.TIPO
                    Set piWidth to 91
                    Set psCaption to "Tipo"
                End_Object

                Object oFRDVDEBANT_ABONADO is a cDbCJGridColumn_SI
                    Entry_Item FRDVDEBANT.ABONADO
                    Set piWidth to 73
                    Set psCaption to "Abonado"
                End_Object

                
            End_Object
        End_Object
        
    End_Object
    
    Procedure CarregaDados
        
        //Get Update_Footer of (oBPCoreBase(Self)) "SUM" "VLR_TOTAL" "FRDVI" ("RTRIM(CODIGO) = '"+FRDVH.CODIGO+"'") Self to sRetorno
    End_Procedure

    Object oDbComboForm1 is a cDbComboForm_SI
        Entry_Item FRDVH.STATUS
        Set Size to 12 52
        Set Location to 13 390
        Set Label to "Situaá∆o"
        Set Label_Col_Offset to 0
        Set Label_Justification_Mode to JMode_Top
        Set Enabled_State to False
        Set Entry_State to True
    End_Object
    
    Procedure Hab_Campos
        Local Integer Srvr# Crnt
        Get Server to Srvr#                 // get the ddo
        Get Current_Record of Srvr# to Crnt // get record in ddo
    
        Set Enabled_State of oBtnAbreFecha      to (Crnt <> 0)
        Set Enabled_State of oBtnProcessa       to (crnt <> 0 and FRDVH.STATUS = 0)
        Set Enabled_State of oBtnLimpar         to (crnt <> 0 and FRDVH.STATUS = 0)
        Set pbReadOnly of oGridItens            to (Crnt <> 0 and FRDVH.STATUS = 1)
        Set Shadow_State of oFRDVH_CCU_CODIGO   to (FRDVH.STATUS = 1)
        Set Shadow_State of oFRDVH_ANO          to (FRDVH.STATUS = 1)
        Set Shadow_State of oFRDVH_PERC_COMISSAO to (FRDVH.STATUS = 1)
        Set Shadow_State of oFRDVH_TIPO_COMISSAO to (FRDVH.STATUS = 1)
        Set Shadow_State of oFRDVH_TIPO_COMISSAO to (FRDVH.STATUS = 1)
        Set Shadow_State of oTEObs              to (FRDVH.STATUS = 1)
        
        If (FRDVH.STATUS = 0) Set Label of oBtnAbreFecha    to "Fechar"
        Else Set Label of oBtnAbreFecha    to "Abrir"
        
    End_Procedure
    
    Procedure Pinta_Campos
        Set Color of oFrmSaldo          to clWindow
        Set Color of oFrmAbastCid       to clWindow
        Set Color of oFrmAbastFaz       to clWindow
        Set Color of oFrmDespDiversas   to clWindow
        Set Color of oFrmDespesa        to clWindow
        Set Color of oFrmMecanica       to clWindow
        Set Color of oFrmReceitaLiq     to clWindow
        Set Color of oFrmAcertoFinal    to clWindow
        Set Color of oFrmAdiant         to clWindow
        Set Color of oFrmSal            to clWindow
        Set Color of oFrmComissao       to clWindow

        If (FRDVH.SALDO <> 0) Begin 
//            If (FRDVH.SALDO > 0) Set Color of oFrmSaldo to 16749657
//            Else Set Color of oFrmSaldo to 5453309
            If (FRDVH.SALDO > 0) Set TextColor of oFrmSaldo to clBlue
            Else Set TextColor of oFrmSaldo to clRed
        End
        
        If (FRDVH.ACERTO_FINAL <> 0) Begin
//            If (FRDVH.ACERTO_FINAL > 0) Set Color of oFrmAcertoFinal to 16749657
//            Else Set Color of oFrmAcertoFinal to 5453309
            If (FRDVH.ACERTO_FINAL > 0) Set TextColor of oFrmAcertoFinal to clBlue
            Else Set TextColor of oFrmAcertoFinal to clRed
        End
        
//        If (FRDVH.TOT_DESPESAS > 0) Set Color of oFrmDespesa            to 5453309
//        If (FRDVH.TOT_ABAST_EX > 0) Set Color of oFrmAbastCid           to 9600766
//        If (FRDVH.TOT_ABAST_FAZ > 0) Set Color of oFrmAbastFaz          to 9600766
//        If (FRDVH.TOT_DESP_DIVERSAS > 0) Set Color of oFrmDespDiversas  to 9600766
//        If (FRDVH.TOT_MEC_PECAS > 0) Set Color of oFrmMecanica          to 9600766
//        If (FRDVH.TOT_RECEITA_LIQ > 0) Set TextColor of oFrmReceitaLiq      to clBlue //16749657
//        If (FRDVH.TOT_ADIANT > 0) Set Color of oFrmAdiant               to 5453309
//        If (FRDVH.TOT_SALARIOS > 0) Set Color of oFrmSal                to 5453309
//        If (FRDVH.TOT_COMISSAO> 0) Set Color of oFrmComissao            to 5453309

        If (FRDVH.TOT_DESPESAS > 0) Set TextColor of oFrmDespesa            to clRed
        If (FRDVH.TOT_ABAST_EX > 0) Set TextColor of oFrmAbastCid           to clRed
        If (FRDVH.TOT_ABAST_FAZ > 0) Set TextColor of oFrmAbastFaz          to clRed
        If (FRDVH.TOT_DESP_DIVERSAS > 0) Set TextColor of oFrmDespDiversas  to clRed
        If (FRDVH.TOT_MEC_PECAS > 0) Set TextColor of oFrmMecanica          to clRed
        If (FRDVH.TOT_DESP_MOT > 0) Set TextColor of oFrmDespPgMot          to clRed
        If (FRDVH.TOT_DEB_ANT > 0) Set TextColor of oFrmDebAnt              to clRed
        If (FRDVH.TOT_RECEITA_LIQ > 0) Set TextColor of oFrmReceitaLiq      to clBlue //16749657
        If (FRDVH.TOT_ADIANT > 0) Set TextColor of oFrmAdiant               to clRed
        If (FRDVH.TOT_SALARIOS > 0) Set TextColor of oFrmSal                to clRed
        If (FRDVH.TOT_COMISSAO > 0) Set TextColor of oFrmComissao           to clRed
        Else Set TextColor of oFrmComissao                                  to clBlue
            
    End_Procedure
    
    Procedure CalculaRodape
        Number nDespPecas nDespDiversas nAbastExt nAbast nReceitaLiq nVlrSal nVlrAdto nComissao nPercCom ;
            nDebAnt nDespPgMot
        Integer iTipoCom
        String sRet
             
        //Soma ReceitaLiq
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_RECEITA_LIQ_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nReceitaLiq
        
        //Soma Valor Adto
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_ADTO_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nVlrAdto
        
        //Soma Valor Sal
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_SAL_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nVlrSal
        
        //Soma Valor Desp. Peáas
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_DESP_PECAS_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nDespPecas
        
        //Soma Valor Desp Diversas
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_DESP_DIVERSAS_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nDespDiversas
        
        //Soma Valor Abast Externo
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_ABAST_EXT_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nAbastExt
        
        //Soma Valor Abast
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_ABAST_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nAbast
        
        //Soma Valor DebAnt
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_DEB_ANT_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nDebAnt
        
        //Soma Valor DespPgMot
        Get Consulta_ScriptSQL of (oBPCoreBase(Self)) "CALCULA_DESP_PG_MOT_RDV" ("#FRDV_COD;'"+rtrim(FRDVH.CODIGO)+"';") 0 "" False to sRet 
        Move (Replace('.',sRet,',')) to nDespPgMot
        
        Get Field_Current_Value of oFRDVH_DD Field FRDVH.PERC_COMISSAO  to nPercCom
        
        Get Field_Current_Value of oFRDVH_DD Field FRDVH.TIPO_COMISSAO  to iTipoCom

        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_RECEITA_LIQ to nReceitaLiq
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_ABAST_EX to nAbastExt
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_ABAST_FAZ to nAbast
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_MEC_PECAS to nDespPecas
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_DESP_DIVERSAS to nDespDiversas
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.SALDO to (nReceitaLiq-(nAbastExt+nAbast+nDespPecas+nDespDiversas))
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_DESPESAS to ((nAbastExt+nAbast+nDespPecas+nDespDiversas+nDespPgMot))//*(-1))
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_ADIANT to nVlrAdto
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_SALARIOS to nVlrSal
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_DEB_ANT to nDebAnt
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_DESP_MOT to nDespPgMot
        
        If (iTipoCom = 0) Move ((nReceitaLiq-(nAbastExt+nAbast+nDespPecas+nDespDiversas+nDespPgMot))*(nPercCom/100)) to nComissao
        Else Move ((nReceitaLiq)*(nPercCom/100)) to nComissao
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.TOT_COMISSAO to nComissao
        
        Set Field_Changed_Value of oFRDVH_DD Field FRDVH.ACERTO_FINAL to (nComissao-nVlrSal-nVlrAdto-nDebAnt)
        
    End_Procedure

    Object oGroup2 is a Group
        Set Size to 35 43
        Set Location to -1 626
        Set peAnchors to anTopRight

        Object oBtnNovo is a Button
            Set Size to 14 18
            Set Location to 5 3
            Set psImage to "New16.bmp"
            Set peImageAlign to Button_ImageList_Align_Center
            Set psToolTip to "Novo (F5)"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Request_Clear
            End_Procedure
        
        End_Object
        Object oBtnSalvar is a Button
            Set Size to 14 18
            Set Location to 5 23
            Set psImage to "ActionSave.ico"
            Set peImageAlign to Button_ImageList_Align_Center
            Set psToolTip to "Salvar (F2)"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Request_Save_No_Clear of (focus(Self))
            End_Procedure
                    
        End_Object
        Object oBtnExcluir is a Button
            Set Size to 14 18
            Set Location to 19 3
            Set peImageAlign to Button_ImageList_Align_Center
            Set psImage to "ActionDelete.ico"
            Set psToolTip to "Excluir (Shift+F2)"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Request_Delete                
            End_Procedure
        
        End_Object
        Object oBtnFechar is a Button
            Set Size to 14 18
            Set Location to 19 23
            Set peImageAlign to Button_ImageList_Align_Center
            Set psImage to "Exit.ico"
            Set psToolTip to "Sair (Esc)"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Close_Panel
            End_Procedure
            
        End_Object
    End_Object

    Object oGroup3 is a Group
        Set Size to 27 166
        Set Location to 5 458
        Set Label to "Aá‰es"

        Object oBtnAbreFecha is a Button
            Set Location to 9 112
            Set Label to "Fechar"
        
            // fires when the button is clicked
            Procedure OnClick
                Number nDespPecas nDespDiversas nAbastExt nAbast nReceitaLiq nVlrSal nVlrAdto
                String sRet
                
                Send Request_Save_No_Clear of oFRDVH_DD
                
                If (FRDVH.STATUS = 0) Begin
                    Set Field_Changed_Value of oFRDVH_DD Field FRDVH.STATUS to 1
                End
                Else Begin
                   Set Field_Changed_Value of oFRDVH_DD Field FRDVH.STATUS to 0
                End
                
                Send Request_Save_No_Clear of oFRDVH_DD
                
                Send Refresh of oFRDVH_DD
                
            End_Procedure
        
        End_Object

        Object oBtnProcessa is a Button
            Set Location to 9 6
            Set Label to "Processar"
        
            // fires when the button is clicked
            Procedure OnClick
                Number nDespPecas nDespDiversas nAbastExt nAbast nReceitaLiq nVlrSal nVlrAdto
                String sRet
                
                Send Request_Save_No_Clear of oFRDVH_DD
                
                //Prenche dados
                Send Execute_ScriptSQL of (oBPCoreBase(Self)) "PROCESSA_DADOS_RDV" ("#FRDVH_COD;'"+Rtrim(FRDVH.CODIGO)+;
                    "';#CCU_CODIGO;"+rtrim(FRDVH.CCU_CODIGO)+";#MES;"+Rtrim(FRDVH.MES)+";#ANO;"+Rtrim(FRDVH.ANO)+";") 0 "" 0 False
                
                Send CalculaRodape
                
                Send Request_Save_No_Clear of oFRDVH_DD
                
                Send Rebuild_Constraints of oFRDVH_DD
                
                Send Atualiza_Gris of oTabDialog
                
                Send Info_Box "Processamento conclu°do!" "Atená∆o"
                
            End_Procedure
        
        End_Object

        Object oBtnLimpar is a Button
            Set Location to 9 59
            Set Label to "Limpar"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Request_Save_No_Clear of oFRDVH_DD
                Send Popup of oSpecialContextMenu
            End_Procedure
        
        End_Object
        
        Object oSpecialContextMenu is a cCJContextMenu
        
            Object oGerarMenuItemUm is a cCJMenuItem
                Set peControlType to xtpControlButton    
                Set psCaption to ("Todos lanáamentos do RDV nr "+Trim(FRDVH.CODIGO)+" (inclui aba receitas)")
                Set psDescription to "Todos os lanáamentos incluindo receitas"
                Set psToolTip to "Todos os lanáamentos incluindo receitas"
                Set pbActiveUpdate to True
                Set psCategory to C_$CategoryEdit
            
                Procedure OnExecute Variant vCommandBarControl
                    Send Execute_ScriptSQL of (oBPCoreBase(Self)) "DELETA_DADOS_RDV" ("#FRDVH_COD;"+Trim(FRDVH.CODIGO)+";#TIPO;0;") 0 "" 0 False
                    Send CalculaRodape
                    Send Rebuild_Constraints of oFRDVH_DD
                    Send Atualiza_Gris of oTabDialog
                End_Procedure   
                
                Procedure OnUpdate
                    Forward Send OnUpdate
                    Set psCaption to ("Todos lanáamentos do RDV nr "+Trim(FRDVH.CODIGO)+" (inclui aba receitas)")
                End_Procedure
            End_Object
            
            Object oGerarMenuItemDois is a cCJMenuItem
                Set peControlType to xtpControlButton    
                Set psCaption to ("Somente lanáamentos importados no RDV nr "+Trim(FRDVH.CODIGO)+" (n∆o inclui aba receitas)")
                Set psDescription to ("Somente lanáamentos importados (Abastecimentos e Despesas Diversas)")
                Set psToolTip to ("Somente lanáamentos importados (Abastecimentos e Despesas Diversas)")
                Set pbActiveUpdate to True
                Set psCategory to C_$CategoryEdit
            
                Procedure OnExecute Variant vCommandBarControl
                    Send Execute_ScriptSQL of (oBPCoreBase(Self)) "DELETA_DADOS_RDV" ("#FRDVH_COD;"+Trim(FRDVH.CODIGO)+";#TIPO;1;") 0 "" 0 False
                    Send CalculaRodape
                    Send Rebuild_Constraints of oFRDVH_DD
                    Send Atualiza_Gris of oTabDialog
                End_Procedure   
    
                Procedure OnUpdate
                    Forward Send OnUpdate
                    Set psCaption to ("Somente lanáamentos importados no RDV nr "+Trim(FRDVH.CODIGO)+" (n∆o inclui aba receitas)")
                End_Procedure
                
            End_Object
            
        End_Object
        
    End_Object
    
Cd_End_Object
