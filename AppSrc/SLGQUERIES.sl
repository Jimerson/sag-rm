// SLGQUERIES.sl
// Consulta queries

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use GQUERIES.dd

CD_Popup_Object oSLGQUERIES is a dbModalPanel
    Set Location to 5 5
    Set Size to 228 438
    Set Label To "Consulta queries"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oGQUERIES_DD is a GQUERIESDataDictionary
    End_Object 

    Set Main_DD To oGQUERIES_DD
    Set Server  To oGQUERIES_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 199 428
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "oSLGQUERIES_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oGQUERIES_CODIGO is a cDbCJGridColumn
            Entry_Item GQUERIES.CODIGO
            Set piWidth to 374
            Set psCaption to "C¢digo"
        End_Object 

        Object oGQUERIES_DESCRICAO is a cDbCJGridColumn
            Entry_Item GQUERIES.DESCRICAO
            Set piWidth to 375
            Set psCaption to "Descri‡Æo"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 209 275
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 209 329
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 209 383
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // oSLGQUERIES
