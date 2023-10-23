// SLGCCUSTO.sl
// Consulta Centros de Custos

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use GCCUSTO.dd

CD_Popup_Object oSLGCCUSTO is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 242
    Set Label To "Consulta Centros de Custos"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oGCCUSTO_DD is a GCCUSTODataDictionary
    End_Object 

    Set Main_DD To oGCCUSTO_DD
    Set Server  To oGCCUSTO_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 232
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "oSLGCCUSTO_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oGCCUSTO_CCU_CODIGO is a cDbCJGridColumn
            Entry_Item GCCUSTO.CCU_CODIGO
            Set piWidth to 126
            Set psCaption to "C¢digo"
        End_Object 

        Object oGCCUSTO_DESCRICAO is a cDbCJGridColumn
            Entry_Item GCCUSTO.DESCRICAO
            Set piWidth to 262
            Set psCaption to "Descri‡Æo"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 79
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 133
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 187
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // oSLGCCUSTO
