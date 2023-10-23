// ICTE.sl
// Consulta de CTe

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use ICTE.dd
Use BPCoreBase.bp

CD_Popup_Object oICTE_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 226 561
    Set Label To "Consulta de CTe"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False
    Property String psTrasnp ""
    Property String psSerie ""


    Object oICTE_DD is a ICTEDataDictionary
    End_Object 

    Set Main_DD To oICTE_DD
    Set Server  To oICTE_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 147 551
        Set Location to 5 9
        Set peAnchors to anAll
        Set psLayoutSection to "oICTE_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oICTE_NUMERO is a cDbCJGridColumn
            Entry_Item ICTE.NUMERO
            Set piWidth to 84
            Set psCaption to "N£mero"
        End_Object 

        Object oICTE_COD_SERIE is a cDbCJGridColumn
            Entry_Item ICTE.COD_SERIE
            Set piWidth to 63
            Set psCaption to "S‚rie"
        End_Object 

        Object oICTE_COD_TRANSP is a cDbCJGridColumn
            Entry_Item ICTE.COD_TRANSP
            Set piWidth to 96
            Set psCaption to "Transportadora"
        End_Object 

        Object oICTE_COD_PRODUTO is a cDbCJGridColumn
            Entry_Item ICTE.COD_PRODUTO
            Set piWidth to 262
            Set psCaption to "C¢d. Produto"
        End_Object 

        Object oICTE_PRODUTO is a cDbCJGridColumn
            Entry_Item ICTE.PRODUTO
            Set piWidth to 262
            Set psCaption to "Descr. Produto"
        End_Object 

        Object oICTE_VLR_FRETE is a cDbCJGridColumn
            Entry_Item ICTE.VLR_FRETE
            Set piWidth to 178
            Set psCaption to "Vlr. Frete"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 207 398
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 207 452
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 207 506
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    Object oGroup1 is a Group
        Set Size to 41 384
        Set Location to 181 4
        Set Label to 'Filtros'
        Set peAnchors to anBottomLeftRight

        Object oFrmTranspIni is a Form
            Set Size to 13 49
            Set Location to 22 9
            Set Label to "Transp Ini."
            Set Label_Col_Offset to 0
            Set Label_Justification_Mode to JMode_Top
        
            // OnChange is called on every changed character
        //    Procedure OnChange
        //        String sValue
        //    
        //        Get Value to sValue
        //    End_Procedure
        
        End_Object

        Object oFrmTranspFin is a Form
            Set Size to 13 49
            Set Location to 22 61
            Set Label to "Transp Fin."
            Set Label_Col_Offset to 0
            Set Label_Justification_Mode to JMode_Top
        
            // OnChange is called on every changed character
        //    Procedure OnChange
        //        String sValue
        //    
        //        Get Value to sValue
        //    End_Procedure
        
        End_Object

        Object oFrmSerieIni is a Form
            Set Size to 13 49
            Set Location to 22 120
            Set Label to "S‚rie Ini."
            Set Label_Col_Offset to 0
            Set Label_Justification_Mode to JMode_Top
        
            // OnChange is called on every changed character
        //    Procedure OnChange
        //        String sValue
        //    
        //        Get Value to sValue
        //    End_Procedure
        
        End_Object

        Object oFrmSerieFin is a Form
            Set Size to 13 49
            Set Location to 22 172
            Set Label to "S‚rie Fin."
            Set Label_Col_Offset to 0
            Set Label_Justification_Mode to JMode_Top
        
            // OnChange is called on every changed character
        //    Procedure OnChange
        //        String sValue
        //    
        //        Get Value to sValue
        //    End_Procedure
        
        End_Object

        Object oFrmCTeIni is a Form
            Set Size to 13 49
            Set Location to 22 233
            Set Label to "Nr CTe Ini."
            Set Label_Col_Offset to 0
            Set Label_Justification_Mode to JMode_Top
        
            // OnChange is called on every changed character
        //    Procedure OnChange
        //        String sValue
        //    
        //        Get Value to sValue
        //    End_Procedure
        
        End_Object

        Object oFrmCTeFin is a Form
            Set Size to 13 49
            Set Location to 22 285
            Set Label to "Nr. CTe Fin."
            Set Label_Col_Offset to 0
            Set Label_Justification_Mode to JMode_Top
        
            // OnChange is called on every changed character
        //    Procedure OnChange
        //        String sValue
        //    
        //        Get Value to sValue
        //    End_Procedure
        
        End_Object

        Object oBtnFiltrar is a Button
            Set Size to 14 38
            Set Location to 21 342
            Set Label to 'Filtrar'
        
            // fires when the button is clicked
            Procedure OnClick
                Forward Send OnClick
                
                String sExpressaoAtual sTranspI sTranspF sSerieI sSerieF sCteI sCteF
                
                Get Value of oFrmTranspIni  to sTranspI
                Get Value of oFrmTranspFin  to sTranspF
                
                Get Value of oFrmSerieIni   to sSerieI
                Get Value of oFrmSerieFin   to sSerieF
                
                Get Value of oFrmCTeIni     to sCteI
                Get Value of oFrmCTeFin     to sCteF
                
                If ((Trim(sTranspI)<> "")) Begin
                    If (Trim(sExpressaoAtual)<>"");
                        Move (sExpressaoAtual + " AND " ) to sExpressaoAtual
                    Move (sExpressaoAtual + "ICTE.COD_TRANSP >= '"+sTranspI+"'")    to sExpressaoAtual
                End
                If ((Trim(sTranspF)<> "")) Begin
                    If (Trim(sExpressaoAtual)<>"");
                        Move (sExpressaoAtual + " AND " ) to sExpressaoAtual
                    Move (sExpressaoAtual + "ICTE.COD_TRANSP <= '"+sTranspF+"'")    to sExpressaoAtual
                End
                
                If ((Trim(sSerieI)<> "")) Begin
                    If (Trim(sExpressaoAtual)<>"");
                        Move (sExpressaoAtual + " AND " ) to sExpressaoAtual
                    Move (sExpressaoAtual + "ICTE.COD_SERIE >= '"+sSerieI+"'")    to sExpressaoAtual
                End
                If ((Trim(sSerieF)<> "")) Begin
                    If (Trim(sExpressaoAtual)<>"");
                        Move (sExpressaoAtual + " AND " ) to sExpressaoAtual
                    Move (sExpressaoAtual + "ICTE.COD_SERIE <= '"+sSerieF+"'")    to sExpressaoAtual
                End
                
                If ((Trim(sCteI)<> "")) Begin
                    If (Trim(sExpressaoAtual)<>"");
                        Move (sExpressaoAtual + " AND " ) to sExpressaoAtual
                    Move (sExpressaoAtual + "ICTE.NUMERO >= '"+sCteI+"'")    to sExpressaoAtual
                End
                If ((Trim(sCteF)<> "")) Begin
                    If (Trim(sExpressaoAtual)<>"");
                        Move (sExpressaoAtual + " AND " ) to sExpressaoAtual
                    Move (sExpressaoAtual + "ICTE.NUMERO >= '"+sCteF+"'")    to sExpressaoAtual
                End
                
                 Send Aplica_FiltroSQL of (oBPCoreBase(Self)) oICTE_DD ICTE.File_Number sExpressaoAtual
                 Send MoveToFirstRow of oSelList 
            End_Procedure
        
        End_Object
    End_Object

    Procedure Entering_Scope Returns Integer
        Integer iRetVal
        String sTransp sSerie
        Forward Get msg_Entering_Scope to iRetVal
        
        Get psTrasnp    to sTransp
        Get psSerie     to sSerie
        
        Set Value of oFrmTranspIni  to sTransp
        Set Value of oFrmTranspFin  to sTransp
        Set Value of oFrmSerieIni   to sSerie
        Set Value of oFrmSerieFin   to sSerie
        
        Send OnClick of oBtnFiltrar
        
        Procedure_Return iRetVal
    End_Procedure

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // oICTE_sl
