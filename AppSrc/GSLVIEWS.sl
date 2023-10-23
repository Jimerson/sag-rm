// GSLVIEWS.sl
// Consulta Cadastro de Views

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use GVIEWS.dd

CD_Popup_Object oSLGVIEWS is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 610
    Set Label To "Consulta Cadastro de Views"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oGVIEWS_DD is a GVIEWSDataDictionary
    End_Object 

    Set Main_DD To oGVIEWS_DD
    Set Server  To oGVIEWS_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 600
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "oSLGVIEWS_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oGVIEWS_CODIGO is a cDbCJGridColumn
            Entry_Item GVIEWS.CODIGO
            Set piWidth to 56
            Set psCaption to "C¢digo"
        End_Object 

        Object oGVIEWS_NOME is a cDbCJGridColumn
            Entry_Item GVIEWS.NOME
            Set piWidth to 262
            Set psCaption to "Nome"
        End_Object 

        Object oGVIEWS_OBJETO is a cDbCJGridColumn
            Entry_Item GVIEWS.OBJETO
            Set piWidth to 262
            Set psCaption to "Nome do Objeto"
        End_Object 

        Object oGVIEWS_MENU_CAPTION is a cDbCJGridColumn
            Entry_Item GVIEWS.MENU_CAPTION
            Set piWidth to 210
            Set psCaption to "Nome no Menu"
        End_Object 

        Object oGVIEWS_MENU_TOOLTIP is a cDbCJGridColumn
            Entry_Item GVIEWS.MENU_TOOLTIP
            Set piWidth to 262
            Set psCaption to "Tooltip"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 447
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 501
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 555
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // oSLGVIEWS
