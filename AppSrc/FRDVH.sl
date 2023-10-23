// FRDVH.sl
// FRDVH Lookup List

Use DFClient.pkg
Use cDbCJGridPromptList.pkg
Use cDbCJGridColumn.pkg
Use Windows.pkg

Use FRDVH.dd

CD_Popup_Object oFRDVH_sl is a dbModalPanel
    Set Location to 5 5
    Set Size to 159 302
    Set Label To "FRDVH Lookup List"
    Set Border_Style to Border_Thick
    Set Minimize_Icon to False
    Set Locate_Mode to Center_On_Screen


    Object oFRDVH_DD is a FRDVHDataDictionary
    End_Object 

    Set Main_DD To oFRDVH_DD
    Set Server  To oFRDVH_DD



    Object oSelList is a cDbCJGridPromptList
        Set Size to 130 292
        Set Location to 5 5
        Set peAnchors to anAll
        Set psLayoutSection to "oFRDVH_sl_oSelList"
        Set Ordering to 1
        Set pbAutoServer to True

        Object oFRDVH_CODIGO is a cDbCJGridColumn
            Entry_Item FRDVH.CODIGO
            Set piWidth to 188
            Set psCaption to "CODIGO"
        End_Object 

        Object oFRDVH_CCU_CODIGO is a cDbCJGridColumn
            Entry_Item FRDVH.CCU_CODIGO
            Set piWidth to 189
            Set psCaption to "CCU CODIGO"
        End_Object 

        Object oFRDVH_MES is a cDbCJGridColumn
            Entry_Item FRDVH.MES
            Set piWidth to 60
            Set psCaption to "MES"
        End_Object 

        Object oFRDVH_ANO is a cDbCJGridColumn
            Entry_Item FRDVH.ANO
            Set piWidth to 74
            Set psCaption to "ANO"
        End_Object 


    End_Object 

    Object oOk_bn is a Button
        Set Label to "&Ok"
        Set Location to 140 139
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send OK of oSelList
        End_Procedure

    End_Object 

    Object oCancel_bn is a Button
        Set Label to "&Cancel"
        Set Location to 140 193
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Cancel of oSelList
        End_Procedure

    End_Object 

    Object oSearch_bn is a Button
        Set Label to "&Search..."
        Set Location to 140 247
        Set peAnchors to anBottomRight

        Procedure OnClick
            Send Search of oSelList
        End_Procedure

    End_Object 

    On_Key Key_Alt+Key_O Send KeyAction of oOk_bn
    On_Key Key_Alt+Key_C Send KeyAction of oCancel_bn
    On_Key Key_Alt+Key_S Send KeyAction of oSearch_bn


CD_End_Object // oFRDVH_sl
