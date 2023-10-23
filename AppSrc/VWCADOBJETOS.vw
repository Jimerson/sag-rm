// Cadastro de Objetos
//

Use DFClient.pkg
Use DFEntry.pkg
Use cDbForm_SI.pkg
Use cDbCJGrid_SI.pkg
Use cDbCJGridColumn_SI.pkg

Use GOBJETOH.dd
Use GOBJETOI.dd

ACTIVATE_VIEW Activate_oVWCADOBJETOS FOR oVWCADOBJETOS
Object oVWCADOBJETOS is a dbView
    Set Location to 5 5
    Set Size to 244 441
    Set Label To "Cadastro de Objetos"
    Set Border_Style to Border_Thick


    Object oGOBJETOH_DD is a GOBJETOHDataDictionary
        // this lets you save a new parent DD from within child DD
        Set Allow_Foreign_New_Save_State to True
    End_Object 

    Object oGOBJETOI_DD is a GOBJETOIDataDictionary
        Set DDO_Server To oGOBJETOH_DD
        Set Constrain_File To GOBJETOH.File_Number
    End_Object 

    Set Main_DD To oGOBJETOH_DD
    Set Server  To oGOBJETOH_DD



    Object oGOBJETOHOBJETO is a cDbForm_SI
        Entry_Item GOBJETOH.OBJETO
        Set Size to 13 395
        Set Location to 5 41
        Set peAnchors to anLeftRight
        Set Label to "Objeto"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 36
        Set Label_row_Offset to 0
    End_Object 

    Object oGOBJETOHLABEL_LONG is a cDbForm_SI
        Entry_Item GOBJETOH.LABEL_LONG
        Set Size to 13 395
        Set Location to 20 41
        Set peAnchors to anLeftRight
        Set Label to "Label Long"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 36
        Set Label_row_Offset to 0
    End_Object 

    Object oGOBJETOHLABEL_SHORT is a cDbForm_SI
        Entry_Item GOBJETOH.LABEL_SHORT
        Set Size to 13 271
        Set Location to 35 41
        Set peAnchors to anLeftRight
        Set Label to "Label Short"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 36
        Set Label_row_Offset to 0
    End_Object 

    Object oGOBJETOHSTATUS_HELP is a cDbForm_SI
        Entry_Item GOBJETOH.STATUS_HELP
        Set Size to 13 395
        Set Location to 50 41
        Set peAnchors to anLeftRight
        Set Label to "Status Help"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 36
        Set Label_row_Offset to 0
    End_Object 

    Object oDetailGrid is a cDbCJGrid_SI
        Set Size to 166 430
        Set Location to 73 5
        Set Server to oGOBJETOI_DD
        Set Ordering to 1
        Set peAnchors to anAll
        Set psLayoutSection to "oCADOBJETOS_oDetailGrid"
        Set pbAllowInsertRow to False
        Set pbHeaderPrompts to True

        Object oGOBJETOI_SEQ is a cDbCJGridColumn_SI
            Entry_Item GOBJETOI.SEQ
            Set piWidth to 115
            Set psCaption to "SEQ"
        End_Object 

        Object oGOBJETOI_LABEL is a cDbCJGridColumn_SI
            Entry_Item GOBJETOI.LABEL
            Set piWidth to 637
            Set psCaption to "LABEL"
        End_Object 

    End_Object 

    //-----------------------------------------------------------------------
    // Create custom confirmation messages for save and delete
    // We must create the new functions and assign verify messages
    // to them.
    //-----------------------------------------------------------------------

    Function ConfirmDeleteHeader Returns Boolean
        Boolean bFail
        Get Confirm "Delete Entire Header and all detail?" to bFail
        Function_Return bFail
    End_Function 

    // Only confirm on the saving of new records
    Function ConfirmSaveHeader Returns Boolean
        Boolean bNoSave bHasRecord
        Handle  hoSrvr
        Get Server to hoSrvr
        Get HasRecord of hoSrvr to bHasRecord
        If not bHasRecord Begin
            Get Confirm "Save this NEW header?" to bNoSave
        End
        Function_Return bNoSave
    End_Function 

    // Define alternate confirmation Messages
    Set Verify_Save_MSG       to (RefFunc(ConfirmSaveHeader))
    Set Verify_Delete_MSG     to (RefFunc(ConfirmDeleteHeader))
    // Saves in header should not clear the view
    Set Auto_Clear_Deo_State to False


End_Object 
