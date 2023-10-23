Use Windows.pkg
Use DFClient.pkg
Use dfTabDlg.pkg
Use GWGERACTE.dd
Use GWGERAREBO.dd
Use cDbCJGrid_SI.pkg
Use cDbCJGrid.pkg
Use cLinkLabel.pkg

Deferred_View Activate_oVWGERACTEMDFE for ;
Object oVWGERACTEMDFE is a dbView
    Object oGWGERAREBO_DD is a GWGERAREBODataDictionary
        Procedure OnSaveRecord
            Forward Send OnSaveRecord
            
            Move (Trim(gsCodUser)) to GWGERAREBO.USUARIO 
        End_Procedure
        
        Procedure OnConstrain
            Forward Send OnConstrain
            
            Constrain GWGERAREBO.USUARIO eq (Trim(gsCodUser)) 
        End_Procedure
    End_Object

    Object oGWGERACTE_DD is a GWGERACTEDataDictionary
        Procedure OnConstrain
            Forward Send OnConstrain
            
            Constrain GWGERACTE.USUARIO eq (Trim(gsCodUser)) 
        End_Procedure
    End_Object

    Set Main_DD to oGWGERACTE_DD
    Set Server to oGWGERACTE_DD

    Set Border_Style to Border_Thick
    Set Size to 295 699
    Set Location to 2 2
    Set Label to "Geraá∆o de CTe e MDFe"
    Set Maximize_Icon to True

    Object oGrpChaveNF is a Group
        Set Size to 45 490
        Set Location to 4 6
        Set Label to 'Chave NF'

        Object oFrmChaveNf is a Form
            Set Size to 25 408
            Set Location to 11 9
            Set form_FontWeight item 0 to 20
            Set form_FontHeight item 0 to 40
        End_Object

        Object oBtnBuscaNF is a Button
            Set Size to 26 50
            Set Location to 10 425
            Set Label to "Buscar NF"
            Set FontWeight to fw_Bold
        
            // fires when the button is clicked
            Procedure OnClick
                String sChave
                
                Get Value of oFrmChaveNf to sChave
                If (Trim(sChave) <> "") Send Busca_NF
                Else Send Info_Box "Nenhuma chave informada!" "Informativo"
            End_Procedure
        
        End_Object
    End_Object

    Object oDbTabDialog1 is a dbTabDialog
        Set Size to 246 688
        Set Location to 49 6
    
        Set Rotate_Mode to RM_Rotate
        Set peAnchors to anAll

        Object oDbTabPage1 is a dbTabPage
            Set Label to "Principal"

            Object oGrpDados3 is a Group
                Set Size to 102 147
                Set Location to 3 386
        
                Object oFrmNF_Numero is a Form
                    Set Size to 26 122
                    Set Location to 16 3
                    Set Value to ""
                    Set form_FontWeight item 0 to 20
                    Set form_FontHeight item 0 to 40
                    Set Form_Justification_Mode to Form_DisplayCenter
                    Set Enabled_State to False
                
                End_Object
        
                Object oFrmNF_DtEmissao is a Form
                    Set Size to 13 63
                    Set Location to 43 62
                    Set Label to "DATA EMISS«O"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Form_Datatype to Date_Window
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmNF_PesoLiq is a Form
                    Set Size to 13 63
                    Set Location to 57 62
                    Set Label to "PESO L÷Q. (KG)"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Form_Datatype to Mask_Numeric_Window
                    Set Enabled_State to False
                    Set Form_Mask to " ,*0.00"
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmNF_PesoBruto is a Form
                    Set Size to 13 63
                    Set Location to 71 62
                    Set Label to "PESO BRUTO (KG)"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Form_Datatype to Mask_Numeric_Window
                    Set Enabled_State to False
                    Set Form_Mask to " ,*0.00"
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmNF_ValorTotal is a Form
                    Set Size to 13 63
                    Set Location to 85 62
                    Set Label to "VALOR TOTAL (NF)"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Form_Datatype to Mask_Currency_Window
                    Set Enabled_State to False
                    Set Form_Mask to (Default_Currency_Symbol()+" ,*0.00;-"+Default_Currency_Symbol()+" ,*0.00")
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oTextBox9 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 146
                    Set Location to 5 1
                    Set Label to "DADOS NF"
                    Set Border_Style to Border_Normal
                    Set Color to clTeal
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                    Set Justification_Mode to JMode_Center
                End_Object
            End_Object

            Object oGrpDados1 is a Group
                Set Size to 119 381
                Set Location to 3 2

                Object oTextBox2 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 13 377
                    Set Location to 39 2
                    Set Border_Style to Border_Normal
                    Set Color to clTeal
                End_Object
        
                Object oFrmFazenda is a Form
                    Set Size to 26 231
                    Set Location to 10 51
                    Set Value to ""
                    Set form_FontWeight item 0 to 10
                    Set form_FontHeight item 0 to 30
                    Set Form_Justification_Mode to Form_DisplayCenter
                    Set Entry_State to False
                    Set Enabled_State to False
                
                End_Object
        
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 30
                    Set Location to 42 8
                    Set Label to "-"
                    Set Justification_Mode to JMode_Center
                    Set Transparent_State to True
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                End_Object
        
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 46
                    Set Location to 42 51
                    Set Label to "C‡DIGO"
                    Set Justification_Mode to JMode_Center
                    Set Transparent_State to True
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                End_Object
        
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 87
                    Set Location to 42 286
                    Set Label to "FAZENDA"
                    Set Justification_Mode to JMode_Center
                    Set Transparent_State to True
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                End_Object

                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 181
                    Set Location to 42 100
                    Set Label to "NOME"
                    Set Justification_Mode to JMode_Center
                    Set TextColor to clWhite
                    Set Transparent_State to True
                    Set FontWeight to fw_Bold
                End_Object
        
                Object oFrmRemOri is a Form
                    Set Size to 13 47
                    Set Location to 55 50
                    Set Label to "REM/ORIGEM"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmCidOri is a Form
                    Set Size to 13 47
                    Set Location to 69 50
                    Set Label to "CID. ORIGEM"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmDest is a Form
                    Set Size to 13 47
                    Set Location to 83 50
                    Set Label to "DESTINATµRIO"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmCidDest is a Form
                    Set Size to 13 47
                    Set Location to 97 50
                    Set Label to "CID. DESTINO"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmNomeRemOri is a Form
                    Set Size to 13 182
                    Set Location to 55 100
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
                Object oFrmNomeCidOri is a Form
                    Set Size to 13 182
                    Set Location to 69 100
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
                Object oFrmNomeDest is a Form
                    Set Size to 13 182
                    Set Location to 83 100
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
                Object oFrmNomeCidDest is a Form
                    Set Size to 13 182
                    Set Location to 97 100
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmCNPJRemOri is a Form
                    Set Size to 13 87
                    Set Location to 55 286
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
                Object oFrmCNPJDest is a Form
                    Set Size to 13 87
                    Set Location to 83 286
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmProduto is a Form
                    Set Size to 13 87
                    Set Location to 22 282
                    Set Enabled_State to False
                    Set Form_Justification_Mode to Form_DisplayCenter
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oTextBox3 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 13 87
                    Set Location to 10 282
                    Set Border_Style to Border_Normal
                    Set Color to clTeal
                    Set Label to "PRODUTO"
                    Set FontWeight to fw_Bold
                    Set TextColor to clWhite
                    Set Justification_Mode to JMode_Center
                End_Object

                Object oTextBox4 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 26 49
                    Set Location to 10 3
                    Set Label to "FAZENDA"
                    Set Border_Style to Border_Normal
                    Set Color to clTeal
                    Set FontWeight to fw_Bold
                    Set TextColor to clWhite
                    Set Justification_Mode to JMode_Center
                End_Object
            End_Object

            Object oGrpDados2 is a dbGroup
                Set Size to 109 381
                Set Location to 121 2
        
                Object oFrmTransp is a Form
                    Set Size to 13 47
                    Set Location to 22 49
                    Set Label to "TRANSP."
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmMotorista is a Form
                    Set Size to 13 47
                    Set Location to 36 49
                    Set Label to "MOTORISTA"
                    Set Label_Col_Offset to 0
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmPlacaCavalo is a Form
                    Set Size to 13 47
                    Set Location to 63 49
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmNomeTransp is a Form
                    Set Size to 13 182
                    Set Location to 22 99
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
                Object oFrmNomeMotorista is a Form
                    Set Size to 13 182
                    Set Location to 36 99
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oFrmCNPJTransp is a Form
                    Set Size to 13 85
                    Set Location to 22 288
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
                Object oFrmCPFMotorista is a Form
                    Set Size to 13 85
                    Set Location to 36 288
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oTextBox2 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 13 378
                    Set Location to 6 2
                    Set Border_Style to Border_Normal
                    Set Color to clTeal
                End_Object
                Object oFrmRNTRC is a Form
                    Set Size to 13 85
                    Set Location to 63 288
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object
        
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 30
                    Set Location to 8 7
                    Set Label to "-"
                    Set Justification_Mode to JMode_Center
                    Set Transparent_State to True
                    Set FontWeight to fw_Bold
                    Set TextColor to clWhite
                End_Object
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 46
                    Set Location to 8 50
                    Set Label to "C‡DIGO"
                    Set Justification_Mode to JMode_Center
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                    Set Transparent_State to True
                End_Object
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 181
                    Set Location to 8 99
                    Set Label to "NOME"
                    Set Justification_Mode to JMode_Center
                    Set Transparent_State to True
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                End_Object
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 87
                    Set Location to 8 285
                    Set Label to "FAZENDA"
                    Set Justification_Mode to JMode_Center
                    Set Transparent_State to True
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                End_Object
        
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 30
                    Set Location to 51 9
                    Set Label to "-"
                    Set Justification_Mode to JMode_Center
                End_Object
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 46
                    Set Location to 51 52
                    Set Label to "CAVALO"
                    Set Justification_Mode to JMode_Center
                End_Object
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 181
                    Set Location to 51 101
                    Set Label to "CARRETAS"
                    Set Justification_Mode to JMode_Center
                End_Object
                Object oTextBox1 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 87
                    Set Location to 51 287
                    Set Label to "RNTRC"
                    Set Justification_Mode to JMode_Center
                End_Object

                Object oGridRebo is a cDbCJGrid
                    Set Server to oGWGERAREBO_DD
                    Set Size to 44 180
                    Set Location to 62 101

                    Object oGWGERAREBO_CODIGO is a cDbCJGridColumn
                        Entry_Item GWGERAREBO.CODIGO
                        Set piWidth to 137
                        Set psCaption to "CODIGO"
                    End_Object

                    Object oGWGERAREBO_PLACA is a cDbCJGridColumn
                        Entry_Item GWGERAREBO.PLACA
                        Set piWidth to 178
                        Set psCaption to "PLACA"
                    End_Object
                End_Object
            End_Object

            Object oGrpCTE is a Group
                Set Size to 82 147
                Set Location to 104 386

                Object oFrmCTe_Nr is a Form
                    Set Size to 13 75
                    Set Location to 16 49
                    Set Label to "NÈMERO"
                    Set Label_Col_Offset to 5
                    Set Label_Justification_Mode to JMode_Right
                    Set FontWeight to fw_Bold
                    Property String psCodigo
                
                    Procedure Exiting Handle hoDestination Returns Integer
                        Integer iRetVal
                        String  sNumero
                        
                        Forward Get msg_Exiting hoDestination to iRetVal
                        
                        Get psCodigo to sNumero
                        
                        Set Value to sNumero
                        
                        Procedure_Return iRetVal
                    End_Procedure

                    Procedure Entering Returns Integer
                        Integer iRetVal
                        String  sNumero
                        
                        Forward Get msg_Entering to iRetVal
                        
                        Get Value to sNumero
                        
                        Set psCodigo to sNumero
                        
                        Procedure_Return iRetVal
                    End_Procedure
                    
                    Procedure OnChange
                        Forward Send OnChange
                        
                        If (Value(Self) = "GERAR") Begin
                            Set Color to clRed
                            Set TextColor to clWhite
                        End
                        Else Begin
                            Set Color to clWindow
                            Set TextColor to clWindowText
                        End
                        
                    End_Procedure
                
                End_Object

                Object oFrmCTe_Serie is a Form
                    Set Size to 13 75
                    Set Location to 31 49
                    Set Label to "SêRIE"
                    Set Label_Col_Offset to 5
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oFrmCTe_SerieGeracao is a Form
                    Set Size to 13 75
                    Set Location to 46 49
                    Set Label to "SêRIE GER."
                    Set Label_Col_Offset to 5
                    Set Label_Justification_Mode to JMode_Right
                    Set Value to "SUBCON"
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oFrmCTe_Valor is a Form
                    Set Size to 17 75
                    Set Location to 61 49
                    Set Form_Datatype to Mask_Currency_Window
                    Set Label to "VALOR CTE"
                    Set Label_Col_Offset to 5
                    Set Label_Justification_Mode to JMode_Right
                    Set form_FontWeight item 0 to 10
                    Set form_FontHeight item 0 to 30
                    Set Form_Mask to (Default_Currency_Symbol()+" ,*0.00;-"+Default_Currency_Symbol()+" ,*0.00")
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oTextBox9 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 146
                    Set Location to 5 1
                    Set Label to "CTE"
                    Set Border_Style to Border_Normal
                    Set Color to clTeal
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                    Set Justification_Mode to JMode_Center
                End_Object

                Object oBtnCopyCTeCod is a Button
                    Set Size to 13 17
                    Set Location to 16 127
                    Set peImageAlign to Button_ImageList_Align_Center
                    Set psImage to "ActionCopy.ico"
                
                    // fires when the button is clicked
                    Procedure OnClick
                        Send Select_All of oFrmCTe_Nr
                        Send Copy       of oFrmCTe_Nr 0 0 0
                    End_Procedure
                
                End_Object
            End_Object

            Object oBtnGeraCTe is a Button
                Set Size to 26 146
                Set Location to 189 387
                Set Label to "GERAR CTE"
                Set FontWeight to fw_Bold
            
                // fires when the button is clicked
                Procedure OnClick
                    Boolean bRet
                    
                    Get Gera_CTe to bRet
                    Send Busca_NF
                    
                    If (bRet) Send Info_Box "Processamento Conclu°do" "Informativo"
                End_Procedure
            
            End_Object

            Object oGrpMDFeAnt is a Group
                Set Size to 67 144
                Set Location to 3 537

                Object oTextBox9 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 142
                    Set Location to 5 2
                    Set Label to "MDFE ANTERIOR"
                    Set Border_Style to Border_Normal
                    Set Color to clTeal
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                    Set Justification_Mode to JMode_Center
                End_Object

                Object oFrmMDFeAnt_Nr is a Form
                    Set Size to 13 65
                    Set Location to 16 56
                    Set Label to "NÈMERO"
                    Set Label_Col_Offset to 5
                    Set Label_Justification_Mode to JMode_Right

                    Procedure Exiting Handle hoDestination Returns Integer
                        Integer iRetVal
                        Forward Get msg_Exiting hoDestination to iRetVal
                        
                        Set Value to (Trim(GWGERACTE.MDFE_ANT_COD))
                        
                        Procedure_Return iRetVal
                    End_Procedure
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oFrmMDFeAnt_Cancelado is a Form
                    Set Size to 13 65
                    Set Location to 31 56
                    Set Label to "CANCELADO?"
                    Set Label_Col_Offset to 5
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oFrmMDFeAnt_Encerrado is a Form
                    Set Size to 13 65
                    Set Location to 47 56
                    Set Label to "ENCERRADO?"
                    Set Label_Col_Offset to 5
                    Set Label_Justification_Mode to JMode_Right
                    Set Enabled_State to False
                
                    // OnChange is called on every changed character
                //    Procedure OnChange
                //        String sValue
                //    
                //        Get Value to sValue
                //    End_Procedure
                
                End_Object

                Object oBtnCopyMDFeAnt is a Button
                    Set Size to 13 17
                    Set Location to 16 124
                    Set peImageAlign to Button_ImageList_Align_Center
                    Set psImage to "ActionCopy.ico"
                
                    // fires when the button is clicked
                    Procedure OnClick
                        Send Select_All of oFrmMDFeAnt_Nr
                        Send Copy       of oFrmMDFeAnt_Nr 0 0 0
                    End_Procedure
                
                End_Object
            End_Object

            Object oGrpMDFe is a Group
                Set Size to 47 144
                Set Location to 69 537

                Object oTextBox9 is a TextBox
                    Set Auto_Size_State to False
                    Set Size to 10 142
                    Set Location to 5 2
                    Set Label to "MDFE"
                    Set Border_Style to Border_Normal
                    Set Color to clTeal
                    Set TextColor to clWhite
                    Set FontWeight to fw_Bold
                    Set Justification_Mode to JMode_Center
                End_Object

                Object oFrmMDFe is a Form
                    Set Size to 22 117
                    Set Location to 18 4
                    Set form_FontWeight item 0 to 20
                    Set form_FontHeight item 0 to 40
                    Property String psCodigo
                    Set Label_FontWeight to fw_Bold
                    Set Label_Col_Offset to 0
                    Set FontWeight to fw_Bold
                
                    Procedure Exiting Handle hoDestination Returns Integer
                        Integer iRetVal
                        String  sNumero
                        
                        Forward Get msg_Exiting hoDestination to iRetVal
                        
                        Get psCodigo to sNumero
                        
                        Set Value to sNumero
                        
                        Procedure_Return iRetVal
                    End_Procedure

                    Procedure Entering Returns Integer
                        Integer iRetVal
                        String  sNumero
                        
                        Forward Get msg_Entering to iRetVal
                        
                        Get Value to sNumero
                        
                        Set psCodigo to sNumero
                        
                        Procedure_Return iRetVal
                    End_Procedure

                    Procedure OnChange
                        Forward Send OnChange
                        
                        If (Value(Self) = "GERAR") Begin
                            Set Color to clRed
                            Set TextColor to clWhite
                        End
                        Else Begin
                            Set Color to clWindow
                            Set TextColor to clWindowText
                        End
                        
                    End_Procedure
                
                End_Object

                Object oBtnCopyMDFe is a Button
                    Set Size to 23 19
                    Set Location to 17 123
                    Set peImageAlign to Button_ImageList_Align_Center
                    Set psImage to "ActionCopy.ico"
                
                    // fires when the button is clicked
                    Procedure OnClick
                        Send Select_All of oFrmMDFe
                        Send Copy       of oFrmMDFe 0 0 0
                    End_Procedure
                
                End_Object
            End_Object

            Object oBtnGeraMDFe is a Button
                Set Size to 26 142
                Set Location to 189 538
                Set Label to "GERAR MDFE"
                Set FontWeight to fw_Bold
            
                // fires when the button is clicked
                Procedure OnClick
                    Send Gera_MDFe
                    Send Busca_NF
                End_Procedure
            
            End_Object
        End_Object

        Object oDbTabPage2 is a dbTabPage
            Set Label to "Input"

            Object oGridImput is a cDbCJGrid_SI
                Set Size to 225 551
                Set Location to 4 5
                Set pbAutoColumnSizing to False
                Set pbReadOnly to True
                Set peAnchors to anAll

                Object oGWGERACTE_USUARIO is a cDbCJGridColumn
                    Entry_Item GWGERACTE.USUARIO
                    Set piWidth to 121
                    Set psCaption to "USUARIO"
                End_Object

                Object oGWGERACTE_NF is a cDbCJGridColumn
                    Entry_Item GWGERACTE.NF
                    Set piWidth to 80
                    Set psCaption to "NF"
                End_Object

                Object oGWGERACTE_PESSOA_DEST is a cDbCJGridColumn
                    Entry_Item GWGERACTE.PESSOA_DEST
                    Set piWidth to 72
                    Set psCaption to "PESSOA DEST"
                End_Object

                Object oGWGERACTE_NOME_DEST is a cDbCJGridColumn
                    Entry_Item GWGERACTE.NOME_DEST
                    Set piWidth to 335
                    Set psCaption to "NOME DEST"
                End_Object

                Object oGWGERACTE_CNPJ_CPF_DEST is a cDbCJGridColumn
                    Entry_Item GWGERACTE.CNPJ_CPF_DEST
                    Set piWidth to 126
                    Set psCaption to "CNPJ CPF DEST"
                End_Object

                Object oGWGERACTE_CIDADE_DEST is a cDbCJGridColumn
                    Entry_Item GWGERACTE.CIDADE_DEST
                    Set piWidth to 72
                    Set psCaption to "CIDADE DEST"
                End_Object

                Object oGWGERACTE_CIDADE_DEST_DESCR is a cDbCJGridColumn
                    Entry_Item GWGERACTE.CIDADE_DEST_DESCR
                    Set piWidth to 259
                    Set psCaption to "CIDADE DEST DESCR"
                End_Object

                Object oGWGERACTE_UF_DEST is a cDbCJGridColumn
                    Entry_Item GWGERACTE.UF_DEST
                    Set piWidth to 36
                    Set psCaption to "UF DEST"
                End_Object

                Object oGWGERACTE_PLACA is a cDbCJGridColumn
                    Entry_Item GWGERACTE.PLACA
                    Set piWidth to 63
                    Set psCaption to "PLACA"
                End_Object

                Object oGWGERACTE_MOTORISTA_CPF is a cDbCJGridColumn
                    Entry_Item GWGERACTE.MOTORISTA_CPF
                    Set piWidth to 99
                    Set psCaption to "MOTORISTA CPF"
                End_Object

                Object oGWGERACTE_PRODUTO_COD is a cDbCJGridColumn
                    Entry_Item GWGERACTE.PRODUTO_COD
                    Set piWidth to 131
                    Set psCaption to "PRODUTO COD"
                End_Object

                Object oGWGERACTE_PRODUTO_DESCR is a cDbCJGridColumn
                    Entry_Item GWGERACTE.PRODUTO_DESCR
                    Set piWidth to 306
                    Set psCaption to "PRODUTO DESCR"
                End_Object

                Object oGWGERACTE_ST is a cDbCJGridColumn
                    Entry_Item GWGERACTE.ST
                    Set piWidth to 39
                    Set psCaption to "ST"
                End_Object

                Object oGWGERACTE_CIDADE_ORI is a cDbCJGridColumn
                    Entry_Item GWGERACTE.CIDADE_ORI
                    Set piWidth to 72
                    Set psCaption to "CIDADE ORI"
                End_Object

                Object oGWGERACTE_CIDADE_ORI_DESCR is a cDbCJGridColumn
                    Entry_Item GWGERACTE.CIDADE_ORI_DESCR
                    Set piWidth to 257
                    Set psCaption to "CIDADE ORI DESCR"
                End_Object

                Object oGWGERACTE_UF_ORI is a cDbCJGridColumn
                    Entry_Item GWGERACTE.UF_ORI
                    Set piWidth to 30
                    Set psCaption to "UF ORI"
                End_Object

                Object oGWGERACTE_PESSOA_ORI is a cDbCJGridColumn
                    Entry_Item GWGERACTE.PESSOA_ORI
                    Set piWidth to 72
                    Set psCaption to "PESSOA ORI"
                End_Object

                Object oGWGERACTE_CNPJ_CPF_ORI is a cDbCJGridColumn
                    Entry_Item GWGERACTE.CNPJ_CPF_ORI
                    Set piWidth to 126
                    Set psCaption to "CNPJ CPF ORI"
                End_Object

                Object oGWGERACTE_NOME_DES1 is a cDbCJGridColumn
                    Entry_Item GWGERACTE.NOME_ORI
                    Set piWidth to 413
                    Set psCaption to "NOME DES1"
                End_Object

                Object oGWGERACTE_PESO_NF is a cDbCJGridColumn
                    Entry_Item GWGERACTE.PESO_NF
                    Set piWidth to 83
                    Set psCaption to "PESO NF"
                End_Object

                Object oGWGERACTE_CFOP is a cDbCJGridColumn
                    Entry_Item GWGERACTE.CFOP
                    Set piWidth to 54
                    Set psCaption to "CFOP"
                End_Object

                Object oGWGERACTE_MOTORISTA_COD is a cDbCJGridColumn
                    Entry_Item GWGERACTE.MOTORISTA_COD
                    Set piWidth to 72
                    Set psCaption to "MOTORISTA COD"
                End_Object

                Object oGWGERACTE_MOTORISTA_NOME is a cDbCJGridColumn
                    Entry_Item GWGERACTE.MOTORISTA_NOME
                    Set piWidth to 306
                    Set psCaption to "MOTORISTA NOME"
                End_Object

                Object oGWGERACTE_FAZENDA is a cDbCJGridColumn
                    Entry_Item GWGERACTE.FAZENDA
                    Set piWidth to 240
                    Set psCaption to "FAZENDA"
                End_Object

                Object oGWGERACTE_RNTRC is a cDbCJGridColumn
                    Entry_Item GWGERACTE.RNTRC
                    Set piWidth to 118
                    Set psCaption to "RNTRC"
                End_Object

                Object oGWGERACTE_VEICULO_COD is a cDbCJGridColumn
                    Entry_Item GWGERACTE.VEICULO_COD
                    Set piWidth to 78
                    Set psCaption to "VEICULO COD"
                End_Object

                Object oGWGERACTE_TRANSP_COD is a cDbCJGridColumn
                    Entry_Item GWGERACTE.TRANSP_COD
                    Set piWidth to 72
                    Set psCaption to "TRANSP COD"
                End_Object

                Object oGWGERACTE_TRANSP_RAZAO_SOCIAL is a cDbCJGridColumn
                    Entry_Item GWGERACTE.TRANSP_RAZAO_SOCIAL
                    Set piWidth to 319
                    Set psCaption to "TRANSP RAZAO SOCIAL"
                End_Object

                Object oGWGERACTE_TRANSP_CNPJ_CPF is a cDbCJGridColumn
                    Entry_Item GWGERACTE.TRANSP_CNPJ_CPF
                    Set piWidth to 126
                    Set psCaption to "TRANSP CNPJ CPF"
                End_Object

                Object oGWGERACTE_PESO_BRUTO is a cDbCJGridColumn
                    Entry_Item GWGERACTE.PESO_BRUTO
                    Set piWidth to 82
                    Set psCaption to "PESO BRUTO"
                End_Object

                Object oGWGERACTE_VALOR_NF is a cDbCJGridColumn
                    Entry_Item GWGERACTE.VALOR_NF
                    Set piWidth to 86
                    Set psCaption to "VALOR NF"
                End_Object

                Object oGWGERACTE_DIA_EMISSAO is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DIA_EMISSAO
                    Set piWidth to 48
                    Set psCaption to "DIA EMISSAO"
                End_Object

                Object oGWGERACTE_MES_EMISSAO is a cDbCJGridColumn
                    Entry_Item GWGERACTE.MES_EMISSAO
                    Set piWidth to 45
                    Set psCaption to "MES EMISSAO"
                End_Object

                Object oGWGERACTE_ANO_EMISSAO is a cDbCJGridColumn
                    Entry_Item GWGERACTE.ANO_EMISSAO
                    Set piWidth to 48
                    Set psCaption to "ANO EMISSAO"
                End_Object

                Object oGWGERACTE_DT_EMISSAO is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DT_EMISSAO
                    Set piWidth to 90
                    Set psCaption to "DT EMISSAO"
                End_Object

                Object oGWGERACTE_CTE is a cDbCJGridColumn
                    Entry_Item GWGERACTE.CTE
                    Set piWidth to 135
                    Set psCaption to "CTE"
                End_Object

                Object oGWGERACTE_SERIE_COD is a cDbCJGridColumn
                    Entry_Item GWGERACTE.SERIE_COD
                    Set piWidth to 72
                    Set psCaption to "SERIE COD"
                End_Object

                Object oGWGERACTE_VLR_UN is a cDbCJGridColumn
                    Entry_Item GWGERACTE.VLR_UN
                    Set piWidth to 144
                    Set psCaption to "VLR UN"
                End_Object

                Object oGWGERACTE_TPEND_DEST is a cDbCJGridColumn
                    Entry_Item GWGERACTE.TPEND_DEST
                    Set piWidth to 49
                    Set psCaption to "TPEND DEST"
                End_Object

                Object oGWGERACTE_TPEND_ORI is a cDbCJGridColumn
                    Entry_Item GWGERACTE.TPEND_ORI
                    Set piWidth to 41
                    Set psCaption to "TPEND ORI"
                End_Object

                Object oGWGERACTE_TPEND_TRANSP is a cDbCJGridColumn
                    Entry_Item GWGERACTE.TPEND_TRANSP
                    Set piWidth to 42
                    Set psCaption to "TPEND TRANSP"
                End_Object

                Object oGWGERACTE_DEST_RAZAO_SOCIAL is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DEST_RAZAO_SOCIAL
                    Set piWidth to 269
                    Set psCaption to "DEST RAZAO SOCIAL"
                End_Object

                Object oGWGERACTE_DEST_CNPJ_CPF is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DEST_CNPJ_CPF
                    Set piWidth to 111
                    Set psCaption to "DEST CNPJ CPF"
                End_Object

                Object oGWGERACTE_DEST_INSC_EST_RG is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DEST_INSC_EST_RG
                    Set piWidth to 106
                    Set psCaption to "DEST INSC EST RG"
                End_Object

                Object oGWGERACTE_DEST_END is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DEST_END
                    Set piWidth to 315
                    Set psCaption to "DEST END"
                End_Object

                Object oGWGERACTE_DEST_NUMERO is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DEST_NUMERO
                    Set piWidth to 45
                    Set psCaption to "DEST NUMERO"
                End_Object

                Object oGWGERACTE_DEST_CPL is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DEST_CPL
                    Set piWidth to 228
                    Set psCaption to "DEST CPL"
                End_Object

                Object oGWGERACTE_DEST_BAIRRO is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DEST_BAIRRO
                    Set piWidth to 193
                    Set psCaption to "DEST BAIRRO"
                End_Object

                Object oGWGERACTE_DEST_CEP is a cDbCJGridColumn
                    Entry_Item GWGERACTE.DEST_CEP
                    Set piWidth to 72
                    Set psCaption to "DEST CEP"
                End_Object
            End_Object
        End_Object
    
    End_Object
    
    Procedure Busca_NF
        Send Execute_ScriptSQL of (oBPCoreBase(Self)) 'VWGERACTEMDF_SELECIONA_NF' ;
            ("#CHAVENOTA;'"+Trim(Value(oFrmChaveNf))+"';#USUARIO;'"+Trim(gsCodUser)+"'") 0 "Carregando" 0 False
        Send Execute_ScriptSQL of (oBPCoreBase(Self)) 'VWGERACTEMDF_GERA_REBOQUE' ;
            ("#CHAVENOTA;'"+Trim(Value(oFrmChaveNf))+"';#USUARIO;'"+Trim(gsCodUser)+"'") 0 "Carregando" 0 False
        Send Carrega_Campos
        Send Posiciona_Registro
    End_Procedure
    
    Procedure Carrega_Campos
        Integer iRecnum
        String  sMDFeAntNr sMDFeAntCancel sMDFeAntEncerrado sNFPesoBruto sCTeNr sMDFe
        
        Clear GWGERACTE
        Move (Trim(gsCodUser)) to GWGERACTE.USUARIO
        Find gt GWGERACTE by Index.1
        If ((Found) and ((Trim(gsCodUser)) = Trim(GWGERACTE.USUARIO))) Move GWGERACTE.Recnum to iRecnum
        
        If (iRecnum <> 0) Begin
            Set Value of oFrmFazenda        to (Trim(GWGERACTE.FAZENDA))
            Set Value of oFrmProduto        to (Trim(GWGERACTE.PRODUTO_DESCR))
            //Origem
            Set Value of oFrmRemOri         to (Trim(GWGERACTE.PESSOA_ORI))
            Set Value of oFrmNomeRemOri     to (Trim(GWGERACTE.NOME_ORI))
            Set Value of oFrmCNPJRemOri     to (Trim(GWGERACTE.CNPJ_CPF_ORI))
            Set Value of oFrmCidOri         to (Trim(GWGERACTE.CIDADE_ORI))
            Set Value of oFrmNomeCidOri     to (Trim(GWGERACTE.CIDADE_ORI_DESCR))
            //Dest
            Set Value of oFrmDest           to (Trim(GWGERACTE.PESSOA_DEST))
            Set Value of oFrmNomeDest       to (Trim(GWGERACTE.NOME_DEST))
            Set Value of oFrmCNPJDest       to (Trim(GWGERACTE.CNPJ_CPF_DEST))
            Set Value of oFrmCidDest        to (Trim(GWGERACTE.CIDADE_DEST))
            Set Value of oFrmNomeCidDest    to (Trim(GWGERACTE.CIDADE_DEST_DESCR))
            //Transp
            Set Value of oFrmTransp         to (Trim(GWGERACTE.TRANSP_COD))
            Set Value of oFrmNomeTransp     to (Trim(GWGERACTE.TRANSP_RAZAO_SOCIAL))
            Set Value of oFrmCNPJTransp     to (Trim(GWGERACTE.TRANSP_CNPJ_CPF))
            //Motorista
            Set Value of oFrmMotorista      to (Trim(GWGERACTE.MOTORISTA_COD))
            Set Value of oFrmNomeMotorista  to (Trim(GWGERACTE.MOTORISTA_NOME))
            Set Value of oFrmCPFMotorista   to (Trim(GWGERACTE.MOTORISTA_CPF))
            //Veiculo
            Set Value of oFrmPlacaCavalo    to (Trim(GWGERACTE.PLACA))
            Set Value of oFrmRNTRC          to (Trim(GWGERACTE.RNTRC))
            //Dados NF
            Set Value of oFrmNF_Numero      to (Trim(GWGERACTE.NF))
            Set Value of oFrmNF_DtEmissao   to GWGERACTE.DT_EMISSAO
            If ((GWGERACTE.PESO_NF) = 0) Move "SEM BALANÄA" to sNFPesoBruto
            Else Move (Replace('.',Trim(GWGERACTE.PESO_NF),',')) to sNFPesoBruto
            Set Value of oFrmNF_PesoLiq     to GWGERACTE.PESO_NF
            Set Value of oFrmNF_PesoBruto   to sNFPesoBruto
            Set Value of oFrmNF_ValorTotal  to GWGERACTE.VALOR_NF
            //Dados CTe
            If (Trim(GWGERACTE.CTE) = "") Move "GERAR" to sCTeNr
            Else Move (Trim(GWGERACTE.CTE)) to sCTeNr
            Set Value of oFrmCTe_Nr         to sCTeNr
            Set Value of oFrmCTe_Serie      to (Trim(GWGERACTE.SERIE_COD))
            Set Value of oFrmCTe_Valor      to GWGERACTE.VLR_TOTAL_CTRC
            //Dados MDFe Ant
            If ((Trim(GWGERACTE.MDFE_ANT_COD)) = "") Move "N«O Hµ" to sMDFeAntNr
            Else Move (Trim(GWGERACTE.MDFE_ANT_COD)) to sMDFeAntNr
            Case Begin
                Case ((Trim(GWGERACTE.MDFE_ANT_CANCELADO)) = "")
                    Move "N«O CANCELADO" to sMDFeAntCancel
                    Case Break
                Case ((Trim(GWGERACTE.MDFE_ANT_CANCELADO)) = "NAO CANCELADO")
                    Move (Trim(GWGERACTE.MDFE_ANT_CANCELADO))  to sMDFeAntCancel
                    Case Break
                Case Else
                    Move "VERIFICAR " to sMDFeAntCancel
            Case End
            Case Begin
                Case ((Trim(GWGERACTE.MDFE_ANT_ENCERRADO)) = "")
                    Move "OK" to sMDFeAntEncerrado
                    Case Break
                Case ((Trim(GWGERACTE.MDFE_ANT_ENCERRADO)) = "ENCERRADO")
                    Move "OK"  to sMDFeAntEncerrado
                    Case Break
                Case Else
                    Move "VERIFICAR" to sMDFeAntEncerrado
            Case End
            
            Set Value of oFrmMDFeAnt_Nr         to sMDFeAntNr
            Set Value of oFrmMDFeAnt_Cancelado  to sMDFeAntCancel
            Set Value of oFrmMDFeAnt_Encerrado  to sMDFeAntEncerrado
            //MDFe
            If (Trim(GWGERACTE.MDFE_COD) = '') Move 'GERAR' to sMDFe
            Else Move (Trim(GWGERACTE.MDFE_COD)) to sMDFe
            Set Value of oFrmMDFe               to sMDFe
        End
        Else Begin
            Set Value of oFrmFazenda        to "NOTA FISCAL N«O ENCONTRADA"
            Set Value of oFrmProduto        to ''
            //Origem
            Set Value of oFrmRemOri         to ''
            Set Value of oFrmNomeRemOri     to ''
            Set Value of oFrmCNPJRemOri     to ''
            Set Value of oFrmCidOri         to ''
            Set Value of oFrmNomeCidOri     to ''
            //Dest
            Set Value of oFrmDest           to ''
            Set Value of oFrmNomeDest       to ''
            Set Value of oFrmCNPJDest       to ''
            Set Value of oFrmCidDest        to ''
            Set Value of oFrmNomeCidDest    to ''
            //Transp
            Set Value of oFrmTransp         to ''
            Set Value of oFrmNomeTransp     to ''
            Set Value of oFrmCNPJTransp     to ''
            //Motorista
            Set Value of oFrmMotorista      to ''
            Set Value of oFrmNomeMotorista  to ''
            Set Value of oFrmCPFMotorista   to ''
            //Veiculo
            Set Value of oFrmPlacaCavalo    to ''
            Set Value of oFrmRNTRC          to ''
            //Dados NF
            Set Value of oFrmNF_Numero      to "--"
            Set Value of oFrmNF_DtEmissao   to ""
            Set Value of oFrmNF_PesoLiq     to "0,000"
            Set Value of oFrmNF_PesoBruto   to "0,000"
            Set Value of oFrmNF_ValorTotal  to "0,00"
            //Dados CTe
            Set Value of oFrmCTe_Nr         to ""
            Set Value of oFrmCTe_Serie      to ""
            Set Value of oFrmCTe_Valor      to 0
            //Dados MDFe Ant
            Set Value of oFrmMDFeAnt_Nr         to ""
            Set Value of oFrmMDFeAnt_Cancelado  to ""
            Set Value of oFrmMDFeAnt_Encerrado  to ""
            //MDFe
            Set Value of oFrmMDFe               to ""
        End
    End_Procedure
    
    Function Gera_CTe Returns Boolean
        String  sSerie sVlrFrete
        Boolean bValidate
        
        Get Valida_Gera_CTe to bValidate
        
        If (not(bValidate)) Function_Return False
        
        Get Value of oFrmCTe_SerieGeracao  to sSerie
        Get Value of oFrmCTe_Valor  to sVlrFrete
        
        Move (Replace(',',sVlrFrete,'.')) to sVlrFrete
        
        Send Execute_ScriptSQL of (oBPCoreBase(Self)) "VWGERACTEMDF_INSERE_CTE" ;
            ("#USUARIO;'"+Trim(gsCodUser)+"';#SERIE;'"+Trim(sSerie)+"';#VLRCTE;"+sVlrFrete+";") 0 "Gerando..." 0 False
        Function_Return True
    End_Function
    
    Function Valida_Gera_CTe Returns Boolean
        String  sSerie sVlrFrete sNumero
        Integer iRecnum
        
        Get Value of oFrmCTe_SerieGeracao   to sSerie
        Get Value of oFrmCTe_Valor          to sVlrFrete
        Get Value of oFrmCTe_Nr             to sNumero
        
        Clear GWGERACTE
        Move (Trim(gsCodUser)) to GWGERACTE.USUARIO
        Find gt GWGERACTE by Index.1
        If ((Found) and ((Trim(gsCodUser)) = Trim(GWGERACTE.USUARIO))) Move GWGERACTE.Recnum to iRecnum
        
        If (Uppercase(Trim(sNumero)) <> 'GERAR') Begin
            Send Info_Box "CTe j† gerado! N∆o Ç poss°vel gerar novo CTe" "Informativo"
            Function_Return False
        End
        
        If (Trim(sSerie) = '') Begin
            Send Info_Box "SÇrie n∆o informada" "Erro"
            Function_Return False
        End
        
        If (Number(sVlrFrete) = 0) Begin
            Send Info_Box "Valor do Frete n∆o informado" "Erro"
            Function_Return False
        End
        
        If (iRecnum = 0) Begin
            Send Info_Box "Registro n∆o encontrado" "Informativo"
            Function_Return False
        End
        
        Function_Return True
    End_Function
    
    Function Valida_Gera_MDFe Returns Boolean
        String sNumero
        Integer iRecnum
        
        Clear GWGERACTE
        Move (Trim(gsCodUser)) to GWGERACTE.USUARIO
        Find gt GWGERACTE by Index.1
        If ((Found) and ((Trim(gsCodUser)) = Trim(GWGERACTE.USUARIO))) Move GWGERACTE.Recnum to iRecnum
        
        Get Value of oFrmMDFe to sNumero
        
        If (iRecnum = 0) Begin
            Send Info_Box "Registro n∆o selecionado" "Informativo"
            Function_Return False
        End
        
        If (Uppercase(Trim(sNumero)) <> 'GERAR') Begin
            Send Info_Box "Manifesto j† gerado! N∆o Ç poss°vel gerar novo Manifesto" "Informativo"
            Function_Return False
        End
        
        Function_Return True
    End_Function
    
    Procedure Gera_MDFe
        Boolean bRet
        
        Get Valida_Gera_MDFe to bRet
        
        If (bRet) Begin
            Send Execute_ScriptSQL of (oBPCoreBase(Self)) "VWGERACTEMDF_INSERE_MDFE" ;
            ("#CHAVENOTA;'"+Trim(GWGERACTE.CHAVE_NFE)+"';") 0 "Gerando..." 0 False
            
            Send Info_Box "Processamento conclu°do" "Informativo"
        End
        
    End_Procedure
    
    Procedure Posiciona_Registro
        Send Rebuild_Constraints of oGWGERACTE_DD
        Send Rebuild_Constraints of oGWGERAREBO_DD
        Send MoveToFirstRow of oGridImput
        Send MoveToFirstRow of oGridRebo
    End_Procedure
Cd_End_Object
