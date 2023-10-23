// SLGPARAM.sl
// Consulta de parƒmetros

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use GPARAM.dd

CD_Popup_Object oSLGPARAM is a dbModalPanel
    Set Location to 5 5
    Set Size to 156 469
    Set Label To "Consulta de parƒmetros"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False


    Object oGPARAM_DD is a GPARAMDataDictionary
    End_Object 

    Set Main_DD To oGPARAM_DD
    Set Server  To oGPARAM_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 127 459
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "oSLGPARAM_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True
        Set pbAutoColumnSizing to False

        Object oGPARAM_NOME is a cDbCJGridColumn
            Entry_Item GPARAM.NOME
            Set piWidth to 622
            Set psCaption to "Nome"
        End_Object 

        Object oGPARAM_VALOR is a cDbCJGridColumn
            Entry_Item GPARAM.VALOR
            Set piWidth to 181
            Set psCaption to "Valor"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 137 306
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 137 360
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 137 414
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // oSLGPARAM
