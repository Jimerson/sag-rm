// C:\Users\Jimerson\Documents\OneDrive\Documentos\Pessoal\Des\Projetos\vdf\sag-ate\AppSrc\VWCADVIEW.vw
// Cadastro de Views
//

Use DFClient.pkg
Use DFEntry.pkg
Use cDbView_SI.pkg
Use cDbForm_SI.pkg
Use cDbView_SI.pkg

Use GVIEWS.dd


Deferred_View Activate_oVWCADVIEW for ;
Object oVWCADVIEW is a cDbView_SI
    Set Location to 5 5
    Set Size to 83 305
    Set Label To "Cadastro de Views"
    Set Border_Style to Border_Thick


    Object oGVIEWS_DD is a GVIEWSDataDictionary
    End_Object 

    Set Main_DD To oGVIEWS_DD
    Set Server  To oGVIEWS_DD



    Object oGVIEWSCODIGO is a cDbForm_SI
        Entry_Item GVIEWS.CODIGO
        Set Size to 13 48
        Set Location to 5 50
        Set peAnchors to anNone
        Set Label to "C¢digo"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 45
        Set Label_row_Offset to 0
        Set pbSequenciaAuto to True
    End_Object 

    Object oGVIEWSNOME is a cDbForm_SI
        Entry_Item GVIEWS.NOME
        Set Size to 13 250
        Set Location to 20 50
        Set peAnchors to anNone
        Set Label to "Nome"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 45
        Set Label_row_Offset to 0
    End_Object 

    Object oGVIEWSOBJETO is a cDbForm_SI
        Entry_Item GVIEWS.OBJETO
        Set Size to 13 186
        Set Location to 35 50
        Set peAnchors to anNone
        Set Label to "Objeto"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 45
        Set Label_row_Offset to 0
    End_Object 

    Object oGVIEWSMENU_CAPTION is a cDbForm_SI
        Entry_Item GVIEWS.MENU_CAPTION
        Set Size to 13 126
        Set Location to 50 50
        Set peAnchors to anNone
        Set Label to "Menu Caption"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 45
        Set Label_row_Offset to 0
    End_Object 

    Object oGVIEWSMENU_TOOLTIP is a cDbForm_SI
        Entry_Item GVIEWS.MENU_TOOLTIP
        Set Size to 13 250
        Set Location to 65 50
        Set peAnchors to anNone
        Set Label to "Menu Tooltip"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 45
        Set Label_row_Offset to 0
    End_Object 


Cd_End_Object
