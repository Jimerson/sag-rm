// SLOBJETOS.sl
// Consulta de Objetos

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use GOBJETOH.dd

CD_Popup_Object oSLOBJETOS is a dbModalPanel
    Set Location to 5 5
    Set Size to 134 440
    Set Label To "Consulta de Objetos"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oGOBJETOH_DD is a GOBJETOHDataDictionary
    End_Object 

    Set Main_DD To oGOBJETOH_DD
    Set Server  To oGOBJETOH_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 105 430
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "oSLOBJETOS_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oGOBJETOH_OBJETO is a cDbCJGridColumn
            Entry_Item GOBJETOH.OBJETO
            Set piWidth to 262
            Set psCaption to "Objeto"
        End_Object 

        Object oGOBJETOH_LABEL_LONG is a cDbCJGridColumn
            Entry_Item GOBJETOH.LABEL_LONG
            Set piWidth to 262
            Set psCaption to "Label Long"
        End_Object 

        Object oGOBJETOH_LABEL_SHORT is a cDbCJGridColumn
            Entry_Item GOBJETOH.LABEL_SHORT
            Set piWidth to 210
            Set psCaption to "Label Short"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 115 277
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 115 331
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 115 385
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // oSLOBJETOS
