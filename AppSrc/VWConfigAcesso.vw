Use Windows.pkg
Use DFClient.pkg
Use cDbView_SI.pkg
Use GUSER.dd
Use GVIEWS.dd
Use GVIEWUSER.dd
Use GWVIEWS.dd
Use GWVIEWUSE.dd
Use DFEntry.pkg
Use dfLine.pkg
Use cDbCJGrid_SI.pkg
Use cDbCJGridColumn_SI.pkg
Use cDbForm_SI.pkg

Deferred_View Activate_oVWConfigAcesso for ;
Object oVWConfigAcesso is a cDbView_SI
    Object oGWVIEWUSE_DD is a GWVIEWUSEDataDictionary
        Procedure OnConstrain
            Constrain GWVIEWUSE.COD_CURRENT_USER eq gsCodUser
            Constrain GWVIEWUSE.COD_USER eq GUSER.ID
        End_Procedure
    End_Object

    Object oGWVIEWS_DD is a GWVIEWSDataDictionary
        Procedure OnConstrain
            Constrain GWVIEWS.COD_CURRENT_USER eq gsCodUser
            Constrain GWVIEWS.COD_USER eq GUSER.ID
        End_Procedure
    End_Object

    Object oGVIEWS_DD is a GVIEWSDataDictionary
    End_Object

    Object oGUSER_DD is a GUSERDataDictionary
    End_Object

    Object oGVIEWUSER_DD is a GVIEWUSERDataDictionary
    End_Object
    
    Property Boolean pbLoad False
    Property String psCodUserLoad ""

    Set Main_DD to oGUSER_DD
    Set Server to oGUSER_DD

    Set Border_Style to Border_Thick
    Set Size to 234 559
    Set Location to 0 3
    Set Label to "Configuraá‰es de acesso"
    
    Object oIdleHandler is a cIdleHandler
        Procedure OnIdle
            String sValue
            
            Set pbEnabled to False
            
            Get Field_Current_Value of oGUSER_DD Field GUSER.ID to sValue
            If (Trim(sValue) = "") Set pbLoad to False
                       
            Send Hab_Botoes
           
        End_Procedure
    End_Object

    Object oGUSER_ID is a cDbForm_SI
        Entry_Item GUSER.ID
        Set Location to 13 10
        Set Size to 13 126
        Set Label to "Id Usu†rio"

        Procedure Refresh Integer notifyMode
            Forward Send Refresh notifyMode
            Set pbEnabled of oIdleHandler to True
        End_Procedure

        
    End_Object

    Object oLineControl1 is a LineControl
        Set Size to 6 546
        Set Location to 31 7
        Set peAnchors to anTopLeftRight
    End_Object

    Object oDbGridViews is a cDbCJGrid_SI
        Set Server to oGWVIEWS_DD
        Set Size to 177 238
        Set Location to 37 10
        Set peAnchors to anAll
        Set pbReadOnly to True

        Object oGWVIEWS_CODIGO is a cDbCJGridColumn_SI
            Entry_Item GWVIEWS.COD_VIEW
            Set piWidth to 64
            Set psCaption to "C¢digo"
        End_Object

        Object oGWVIEWS_NOME is a cDbCJGridColumn_SI
            Entry_Item GWVIEWS.NOME
            Set piWidth to 260
            Set psCaption to "Nome"
        End_Object
        
        Object oGWVIEWS_STATUS is a cDbCJGridColumn_SI
            Entry_Item GWVIEWS.STATUS
            Set piWidth to 64
            Set psCaption to "Situaá∆o"
            Set pbComboButton to True
        End_Object
    End_Object

    Object oDbGridViewUser is a cDbCJGrid_SI
        Set Server to oGWVIEWUSE_DD
        Set Size to 178 263
        Set Location to 37 288
        Set peAnchors to anTopBottomRight
        Set pbReadOnly to True

        Object oGWVIEWUSE_COD_VIEW is a cDbCJGridColumn_SI
            Entry_Item GWVIEWUSE.COD_VIEW
            Set piWidth to 83
            Set psCaption to "C¢d. Tela"
        End_Object

        Object oGWVIEWUSE_NOME is a cDbCJGridColumn_SI
            Entry_Item GWVIEWUSE.NOME
            Set piWidth to 225
            Set psCaption to "Nome da Tela"
        End_Object

        Object oGWVIEWUSE_STATUS is a cDbCJGridColumn_SI
            Entry_Item GWVIEWUSE.STATUS
            Set piWidth to 68
            Set psCaption to "Situaá∆o"
            Set pbComboButton to True
        End_Object
    End_Object

    Object OBtnFiltra is a Button
        Set Location to 12 145
        Set Label to "Processa"
    
        // fires when the button is clicked
        Procedure OnClick
            String sUser
            
            Get Field_Current_Value of oGUSER_DD Field GUSER.ID to sUser
            
            If (Rtrim(sUser) <> '') Begin
                
                Send Execute_ScriptSQL of (oBPCoreBase(Self)) "GERA_GWUSER" ("#COD_USER;"+Rtrim(sUser)+";#COD_CURRENT_USER;"+Rtrim(gsCodUser)+";") 0 "Carregando dados..." 0 False
                
                Send Rebuild_Constraints of oGWVIEWS_DD
                Send Rebuild_Constraints of oGWVIEWUSE_DD
                
                Send Atualiza_Grids
                
                Set pbEnabled of oIdleHandler to True
                
                Set pbLoad to True
                Set psCodUserLoad to sUser
                
            End
            
        End_Procedure
    
    End_Object

    Object oBtnSalvar is a Button
        Set Location to 12 200
        Set Label to "Salvar"
    
        // fires when the button is clicked
        Procedure OnClick
            String sUser sUserLoad
            
            Get Field_Current_Value of oGUSER_DD Field GUSER.ID to sUser
            Get psCodUserLoad to sUserLoad
            If (Trim(sUser) = Trim(sUserLoad)) Send Salvar
            Else Send Info_Box "Usu†rio selecionado n∆o corresponde ao carregado na mem¢ria! Favor, carregar dados novamente." "Atená∆o"
            Send Atualiza_Grids
        End_Procedure
    
    End_Object

    Object oBtnAdd is a Button
        Set Size to 14 18
        Set Location to 38 258
        Set peImageAlign to Button_ImageList_Align_Center
        Set psImage to "ActionNextArea.ico"
        Set peAnchors to anTopRight
    
        // fires when the button is clicked
        Procedure OnClick
            Send Add_View
            Send Atualiza_Grids
        End_Procedure
    
    End_Object

    Object oBtnRemove is a Button
        Set Size to 14 18
        Set Location to 59 258
        Set peImageAlign to Button_ImageList_Align_Center
        Set psImage to "ActionPrevArea.ico"
        Set peAnchors to anTopRight
    
        // fires when the button is clicked
        Procedure OnClick
            Send Rem_View
            Send Atualiza_Grids
        End_Procedure
    
    End_Object
    
    Procedure Add_View
        Clear GWVIEWUSE
        Move gsCodUser          to GWVIEWUSE.COD_CURRENT_USER
        Move GUSER.ID           to GWVIEWUSE.COD_USER
        Move GWVIEWS.COD_VIEW   to GWVIEWUSE.COD_VIEW
        Find eq GWVIEWUSE by Index.1
        If (Found) Begin 
            Reread GWVIEWUSE
                Move 1 to GWVIEWUSE.STATUS
                SaveRecord GWVIEWUSE
            Unlock
            
        End
        Else Begin
            Clear GWVIEWUSE
            Move gsCodUser          to GWVIEWUSE.COD_CURRENT_USER
            Move GUSER.ID           to GWVIEWUSE.COD_USER
            Move GWVIEWS.COD_VIEW   to GWVIEWUSE.COD_VIEW
            Move GWVIEWS.NOME       to GWVIEWUSE.NOME
            Move 1                  to GWVIEWUSE.STATUS
            SaveRecord GWVIEWUSE
        End
        Reread GWVIEWS
            Move 1 to GWVIEWS.STATUS
            SaveRecord GWVIEWS 
        Unlock
         
    End_Procedure
    
    Procedure Rem_View
        Clear GWVIEWS
        Move gsCodUser          to GWVIEWS.COD_CURRENT_USER
        Move GWVIEWUSE.COD_USER to GWVIEWS.COD_USER
        Move GWVIEWUSE.COD_VIEW to GWVIEWS.COD_VIEW
        Find eq GWVIEWS by Index.1
        If (Found) Begin
            Reread GWVIEWS
                Move 0 to GWVIEWS.STATUS
                SaveRecord GWVIEWS
            Unlock
            Lock
                Delete GWVIEWUSE
            Unlock
        End
    End_Procedure
    
    Procedure Atualiza_Grids
        Send MoveToFirstRow of oDbGridViews
        Send MoveToFirstRow of oDbGridViewUser
    End_Procedure
    
    Procedure Hab_Botoes
        Integer Srvr# Crnt
        Boolean bLoad
        
        Get Server                      to Srvr#
        Get Current_Record of Srvr#     to Crnt
        Get pbLoad                      to bLoad
        Set Shadow_State of oBtnAdd     to (Crnt = 0 or not(bLoad))
        Set Shadow_State of oBtnRemove  to (Crnt = 0 or not(bLoad))
        
    End_Procedure

    Procedure Entering_Scope Returns Integer
        Integer iRetVal
        Forward Get msg_Entering_Scope to iRetVal
        
        Send Rebuild_Constraints of oGWVIEWS_DD
        Send Rebuild_Constraints of oGWVIEWUSE_DD
        
        Set pbEnabled of oIdleHandler to True
        
        Procedure_Return iRetVal
    End_Procedure
    
    Procedure Salvar
//        Clear GWVIEWUSE
//        Move gsCodUser to GWVIEWUSE.COD_CURRENT_USER
//        Repeat
//            Find gt GWVIEWUSE by Index.1
//            If (Found and gsCodUser = GWVIEWUSE.COD_CURRENT_USER) Begin
//                Clear GVIEWUSER
//                Move GWVIEWUSE.COD_USER to GVIEWUSER.COD_USER
//                Move GWVIEWUSE.COD_VIEW to GVIEWUSER.COD_VIEW
//                Find eq GVIEWUSER by Index.1
//                If (Found) Begin
//                    Reread
//                        Move GWVIEWUSE.STATUS to GVIEWUSER.STATUS
//                        SaveRecord GVIEWUSER
//                    Unlock
//                End
//                Else Begin
//                    Clear GVIEWUSER
//                    Move GWVIEWUSE.COD_USER to GVIEWUSER.COD_USER
//                    Move GWVIEWUSE.COD_VIEW to GVIEWUSER.COD_VIEW
//                    Move GWVIEWUSE.STATUS   to GVIEWUSER.STATUS 
//                    SaveRecord GVIEWUSER
//                End
//            End
//            Else Break
//        Loop
//        
//        Clear GVIEWUSER
//        Move GVIEWS.CODIGO  to GVIEWUSER.COD_USER
//        Repeat
//            Find gt GVIEWUSER by Index.1
//            If (Found and GVIEWS.CODIGO = GVIEWUSER.COD_USER) Begin
//                Clear 
//            End
//            Else Break
//        Loop

        Send Execute_ScriptSQL of (oBPCoreBase(Self)) 'SALVA_CONTROLE_VIEW' ("#COD_CURRENT_USER;"+Trim(gsCodUser)+";#COD_USER;"+Trim(GUSER.ID)+";") 0 "Salvando..." 0 False
        Send OnClick of OBtnFiltra
        
    End_Procedure

Cd_End_Object
