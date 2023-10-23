// Cadastro da empresa
//

Use DFClient.pkg
Use DFEntry.pkg

Use GEMPRESA.dd
Use dbBitmap.pkg
Use cDbForm_SI.pkg
Use cDbComboForm_SI.pkg
Use cComWebBrowser.pkg
Use Windows.pkg
Use BPCoreBase.bp

ACTIVATE_VIEW Activate_oVWEMPRESA FOR oVWEMPRESA
Object oVWEMPRESA is a dbView
    Set Location to 5 5
    Set Size to 239 351
    Set Label To "Cadastro da empresa"
    Set Border_Style to Border_Thick


    Object oGEMPRESA_DD is a GEMPRESADataDictionary
    End_Object 

    Set Main_DD To oGEMPRESA_DD
    Set Server  To oGEMPRESA_DD

    Object oIdleRefresh is a cIdleHandler
        Procedure OnIdle
            Set pbEnabled to False
            
            // Là o arquivo da logomarca
            Boolean bFileExists bComCreated
            String sFileOut sFile sExtensao sPath
            Integer iPosExt
            
            Get GetPath_WS of oBPCoreBase "BITMAPS" to sPath
            
            // Pega apenas o nome do arquivo com a extens∆o    
            Move (Left(Trim(sPath), (Pos(";", Trim(sPath), 0)) - 1) + "\logo_" + Trim(GEMPRESA.CNPJ_CPF)) to sFileOut
            Direct_Input ("dir: " + sFileOut + ".*")
            Readln sFile
            
            // Pega a extens∆o do arquivo
            Move (RightPos("." , sFile)) to iPosExt
            If (iPosExt) Move ("." + Right(sFile, Length(sFile) - iPosExt)) to sExtensao
            
            //Concatena o caminho + o nome do arquivo com a extens∆o
            Move (Trim(sFileOut) + Trim(sExtensao)) to sFileOut

            File_Exist sFileOut bFileExists
            Get IsComObjectCreated of (oBMPLogomarca(Self)) to bComCreated
            If (bComCreated) Begin
                If (bFileExists) Send ComNavigate of (oBMPLogomarca(Self)) sFileOut 0 0 0 0
                Else Send ComNavigate of (oBMPLogomarca(Self)) "about:blank" 0 0 0 0
            End
            
        End_Procedure
    End_Object

    Object oGEMPRESACNPJ_CPF is a cDbForm_SI
        Entry_Item GEMPRESA.CNPJ_CPF
        Set Size to 13 134
        Set Location to 9 51
        Set peAnchors to anNone
        Set Label to "CNPJ/CPF"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 47
        Set Label_row_Offset to 0

        Procedure Refresh Integer notifyMode
            Forward Send Refresh notifyMode
            
            Set pbEnabled of oIdleRefresh to True
        End_Procedure
    End_Object 

    Object oGEMPRESATIPO is a cDbComboForm_SI
        Entry_Item GEMPRESA.TIPO
        Set Size to 13 57
        Set Location to 24 51
        Set peAnchors to anNone
        Set Label to "Tipo"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 47
        Set Label_row_Offset to 0
    End_Object 

    Object oGEMPRESARAZAO_SOCIAL is a cDbForm_SI
        Entry_Item GEMPRESA.RAZAO_SOCIAL
        Set Size to 13 294
        Set Location to 39 51
        Set peAnchors to anNone
        Set Label to "Raz∆o Social"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 47
        Set Label_row_Offset to 0
    End_Object 

    Object oGEMPRESANOME_FANTASIA is a cDbForm_SI
        Entry_Item GEMPRESA.NOME_FANTASIA
        Set Size to 13 294
        Set Location to 54 51
        Set peAnchors to anNone
        Set Label to "Nome Fantasia"
        Set Label_Justification_mode to jMode_Left
        Set Label_Col_Offset to 47
        Set Label_row_Offset to 0
    End_Object 

    Object oBMPLogomarca is a cComWebBrowser
        Set Size to 142 341
        Set Location to 73 6
        Set Focus_Mode to NonFocusable
    End_Object

    Object oGroup2 is a Group
        Set Size to 35 43
        Set Location to 2 303
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
    
    Object oDlgLogomarca is a OpenDialog
        String sFolder
        Set Filter_String to "Arquivos de Imagem|*.png;*.jpg"
        Set Dialog_Caption to "Selecionar logomarca (Max. 100 Kb)"
        Get GetPath_WS of oBPCoreBase "BITMAPS" to sFolder
        Set Initial_Folder to sFolder                       
    End_Object

    Object oBtnAddImg is a Button
        Set Location to 218 294
        Set psImage to "Image_import.ico"
        Set peImageAlign to Button_ImageList_Align_Center
    
        // fires when the button is clicked
        Procedure OnClick
            Boolean bOpen
            String[] sSelectedFiles
            String sPath
         
            Get Show_Dialog of oDlgLogomarca to bOpen
            If bOpen Begin
                String sFileOut sImageBytes sExtensao // Imagem lida do arquivo
                Integer iChannel iChOut iArgSize iLength iPosExt
                
                Get Selected_Files of oDlgLogomarca to sSelectedFiles
                
                Get_Argument_Size to iArgSize
                
                Move (Seq_New_Channel()) to iChannel 
                Direct_Input channel iChannel ("binary:" * sSelectedFiles[0])
                
                // Pega a extens∆o do arquivo
                Move (RightPos("." , sSelectedFiles[0])) to iPosExt
                If (iPosExt) Move ("." + Right(sSelectedFiles[0], Length(sSelectedFiles[0]) - iPosExt)) to sExtensao
                
                Get_Channel_Size iChannel to iLength // Tamanho do arquivo
                If (iLength <= 100000) Begin
                    Read_Block channel iChannel sImageBytes iLength
                    Close_Input channel iChannel
                    Send Seq_Release_Channel iChannel

                    Reread GEMPRESA
                    Move sImageBytes to GEMPRESA.LOGO_MARCA
                    SaveRecord GEMPRESA
                    Unlock
                    
                    Get GetPath_WS of oBPCoreBase "BITMAPS" to sPath
                    
                    // Gravacao da imagem para exibir
                    Move (Left(Trim(sPath), (Pos(";", Trim(sPath), 0)) - 1) + "\logo_" + Trim(GEMPRESA.CNPJ_CPF) + sExtensao) to sFileOut
                    Move (Seq_New_Channel()) to iChOut
                    Direct_Output channel iChOut sFileOut
                    Write channel iChOut sImageBytes
                    Close_Output channel iChOut
                    Send Seq_Release_Channel iChOut
                End
                Else Begin
                    Send Info_Box "O arquivo deve ter no m†ximo 100 Kb." "Tamanho m†ximo"
                    Close_Input channel iChannel
                    Send Seq_Release_Channel iChannel
                End

                Send ComNavigate of oBMPLogomarca sFileOut 0 0 0 0
                
                Set_Argument_Size iArgSize
            End
            Else Send Info_Box "Selecione uma logomarca para gravar"
        End_Procedure
    
    End_Object

    Object oBtnDelImg is a Button
        Set Location to 218 238
        Set psImage to "Delete_1.ico"
        Set peImageAlign to Button_ImageList_Align_Center
    
        // fires when the button is clicked
        Procedure OnClick
            String sEmpresa sExtensao sPath
            String sFileOut sFile sImageBytes // Imagem lida do arquivo
            Integer iChannel iChOut iArgSize iPosExt
            
            Get Value of oGEMPRESACNPJ_CPF to sEmpresa
            Move (Replace(".",sEmpresa,"")) to sEmpresa

                
            Get GetPath_WS of oBPCoreBase "BITMAPS" to sPath
            
            // Pega apenas o nome do arquivo com a extens∆o    
            Move (Left(Trim(sPath), (Pos(";", Trim(sPath), 0)) - 1) + "\logo_" + Trim(GEMPRESA.CNPJ_CPF) + sExtensao) to sFileOut
            Direct_Input ("dir: " + sFileOut + ".*")
            Readln sFile
            
            // Pega a extens∆o do arquivo
            Move (RightPos("." , sFile)) to iPosExt
            If (iPosExt) Move ("." + Right(sFile, Length(sFile) - iPosExt)) to sExtensao
            
            //Concatena o caminho + o nome do arquivo com a extens∆o
            Move (Trim(sFileOut) + Trim(sExtensao)) to sFileOut
            
            //Apagar arquivo de logomarca
            EraseFile (Trim(sFileOut)) 
            Send ComNavigate of oBMPLogomarca sFileOut 0 0 0 0
            
            Reread GEMPRESA
                Move 0 to GEMPRESA.LOGO_MARCA
                SaveRecord GEMPRESA
            Unlock

        End_Procedure
    
    End_Object


End_Object 
