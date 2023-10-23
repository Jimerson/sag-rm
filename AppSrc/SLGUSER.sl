// SLGUSER.sl
// Consulta de Usu rios

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use GUSER.dd

CD_Popup_Object oSLGUSER is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 326
    Set Label To "Consulta de Usu rios"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oGUSER_DD is a GUSERDataDictionary
    End_Object 

    Set Main_DD To oGUSER_DD
    Set Server  To oGUSER_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 316
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "oSLGUSER_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oGUSER_ID is a cDbCJGridColumn
            Entry_Item GUSER.ID
            Set piWidth to 217
            Set psCaption to "Id"
        End_Object 

        Object oGUSER_NOME is a cDbCJGridColumn
            Entry_Item GUSER.NOME
            Set piWidth to 248
            Set psCaption to "Nome"
        End_Object 

        Object oGUSER_ATIVO is a cDbCJGridColumn
            Entry_Item GUSER.ATIVO
            Set piWidth to 88
            Set psCaption to "Situa‡Æo"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 163
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 217
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 271
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // oSLGUSER
