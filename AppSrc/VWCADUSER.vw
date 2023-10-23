// C:\Users\Jimerson\Documents\OneDrive\Documentos\Pessoal\Des\Projetos\vdf\sag-ate\AppSrc\VWCADUSER.vw
// Cadastro de Usu rios
//

Use DFClient.pkg
Use DFEntry.pkg
Use cDbView_SI.pkg
Use cDbForm_SI.pkg
Use cDbComboForm_SI.pkg

Use GUSER.dd
Use dfcentry.pkg

Deferred_View Activate_oVWCADUSER for ;
Object oVWCADUSER is a cDbView_SI
    Set Location to 5 5
    Set Size to 53 284
    Set Label To "Cadastro de Usu rios"


    Object oGUSER_DD is a GUSERDataDictionary
        Procedure Update
            String sSenha
            Forward Send Update
            
            Get Field_Current_Value Field GUSER.SENHA to sSenha
            //Get Value of oGUSERSENHA item 0 to sSenha
            Get CriptpwdBD sSenha 0 to sSenha
            
            Move sSenha to GUSER.SENHA
        End_Procedure
    End_Object 

    Set Main_DD To oGUSER_DD
    Set Server  To oGUSER_DD



    Object oGUSERID is a cDbForm_SI
        Entry_Item GUSER.ID
        Set Size to 13 126
        Set Location to 5 29
        Set peAnchors to anNone
        Set Label to "Id"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 24
        Set Label_row_Offset to 0
    End_Object 

    Object oCfAtivo is a cDbComboForm_SI
        Entry_Item GUSER.ATIVO
        Set Size to 12 73
        Set Location to 5 206
        Set Entry_State to False
        Set Code_Display_Mode to CB_Code_Display_Both
        Set Label to "Situa‡Æo"
        Set Label_Col_Offset to 30
        Set Label_Justification_Mode to JMode_Left
    End_Object

    Object oGUSERNOME is a cDbForm_SI
        Entry_Item GUSER.NOME
        Set Size to 13 250
        Set Location to 20 29
        Set peAnchors to anNone
        Set Label to "Nome"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 24
        Set Label_row_Offset to 0
    End_Object 

    Object oGUSERSENHA is a cDbForm_SI
        Entry_Item GUSER.SENHA
        Set Size to 13 125
        Set Location to 35 29
        Set peAnchors to anNone
        Set Label to "Senha"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 24
        Set Label_row_Offset to 0
        Set Password_State to True
    End_Object 

    Procedure ConverteHash
        
    End_Procedure

Cd_End_Object
