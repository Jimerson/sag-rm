Use Windows.pkg
Use DFClient.pkg
Use cDbView_SI.pkg
Use cDbForm_SI.pkg
Use GQUERIES.dd
Use DFEntry.pkg
Use cDbTextEdit.pkg

Deferred_View Activate_oVWCADQUERIES for ;
Object oVWCADQUERIES is a cDbView_SI
    Object oGQUERIES_DD is a GQUERIESDataDictionary
    End_Object

    Set Main_DD to oGQUERIES_DD
    Set Server to oGQUERIES_DD

    Set Border_Style to Border_Thick
    Set Size to 323 574
    Set Location to 2 2
    Set Label to "Cadastro de Queries"

    Object oGQUERIES_CODIGO is a cDbForm_SI
        Entry_Item GQUERIES.CODIGO
        Set Location to 15 9
        Set Size to 13 235
        Set Label to "CODIGO:"
    End_Object

    Object oGQUERIES_DESCRICAO is a cDbForm_SI
        Entry_Item GQUERIES.DESCRICAO
        Set Location to 15 248
        Set Size to 13 269
        Set Label to "DESCRICAO:"
        Set peAnchors to anTopLeftRight
    End_Object

    Object oDbRichEdit1 is a cDbTextEdit
        Entry_Item GQUERIES.QUERY
        Set Size to 277 558
        Set Location to 38 10
        Set peAnchors to anAll
    End_Object

    Object oGroup2 is a Group
        Set Size to 35 43
        Set Location to 2 526
        Set peAnchors to anTopRight

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

Cd_End_Object
