Use Windows.pkg
Use DFClient.pkg
Use cDbView_SI.pkg
Use cDbForm_SI.pkg
Use GPARAM.dd
Use DFEntry.pkg
Use cDbTextEdit.pkg

Deferred_View Activate_oVWCADPARAM for ;
Object oVWCADPARAM is a cDbView_SI
    Object oGPARAM_DD is a GPARAMDataDictionary
    End_Object

    Set Main_DD to oGPARAM_DD
    Set Server to oGPARAM_DD

    Set Border_Style to Border_Thick
    Set Size to 349 570
    Set Location to 2 2
    Set Label to "Cadastro de Parƒmetros"

    Object oGPARAM_NOME is a cDbForm_SI
        Entry_Item GPARAM.NOME
        Set Location to 15 9
        Set Size to 13 306
        Set Label to "Nome:"
    End_Object

    Object oGPARAM_VALOR is a cDbForm_SI
        Entry_Item GPARAM.VALOR
        Set Location to 15 326
        Set Size to 13 78
        Set Label to "Valor:"
    End_Object

    Object oGPARAM_OBSERVACAO is a cDbTextEdit
        Entry_Item GPARAM.OBSERVACAO
        Set Size to 142 445
        Set Location to 36 9
    End_Object

    Object oGroup2 is a Group
        Set Size to 35 43
        Set Location to -3 410
        Set peAnchors to anNone

        Object oBtnNovo is a Button
            Set Size to 14 18
            Set Location to 5 3
            Set psImage to "New16.bmp"
            Set peImageAlign to Button_ImageList_Align_Center
            Set psToolTip to "Novo (F5)"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Request_Clear
            End_Procedure
        
        End_Object
        Object oBtnSalvar is a Button
            Set Size to 14 18
            Set Location to 5 23
            Set psImage to "ActionSave.ico"
            Set peImageAlign to Button_ImageList_Align_Center
            Set psToolTip to "Salvar (F2)"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Request_Save_No_Clear of (focus(Self))
            End_Procedure
                    
        End_Object
        Object oBtnExcluir is a Button
            Set Size to 14 18
            Set Location to 19 3
            Set peImageAlign to Button_ImageList_Align_Center
            Set psImage to "ActionDelete.ico"
            Set psToolTip to "Excluir (Shift+F2)"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Request_Delete                
            End_Procedure
        
        End_Object
        Object oBtnFechar is a Button
            Set Size to 14 18
            Set Location to 19 23
            Set peImageAlign to Button_ImageList_Align_Center
            Set psImage to "Exit.ico"
            Set psToolTip to "Sair (Esc)"
        
            // fires when the button is clicked
            Procedure OnClick
                Send Close_Panel
            End_Procedure
            
        End_Object
    End_Object

    Object oGPARAM_DATA_C is a cDbForm_SI
        Entry_Item GPARAM.DATA_C
        Set Location to 189 9
        Set Size to 13 162
        Set Label to "Data de Cria‡Æo:"
        Set Enabled_State to False
    End_Object

    Object oGPARAM_DATA_M is a cDbForm_SI
        Entry_Item GPARAM.DATA_M
        Set Location to 189 291
        Set Size to 13 162
        Set Label to "Data de Modifica‡Æo:"
        Set Enabled_State to False
    End_Object

Cd_End_Object
