Use Windows.pkg
Use DFClient.pkg
Use GSEQ.dd
Use DFEntry.pkg
Use cDbView_SI.pkg
Use cDbForm_SI.pkg

Deferred_View Activate_oVWCADSEQ for ;
Object oVWCADSEQ is a cDbView_SI
    Object oGSEQ_DD is a GSEQDataDictionary
    End_Object

    Set Main_DD to oGSEQ_DD
    Set Server to oGSEQ_DD

    Set Border_Style to Border_Thick
    Set Size to 200 300
    Set Location to 2 2
    Set Label to "Configura‡Æo de Serializa‡Æo"

    Object oGSEQ_SEQ_FRDVH is a cDbForm_SI
        Entry_Item GSEQ.SEQ_FRDVH
        Set Location to 15 11
        Set Size to 13 54
        Set Label to "Seq. RDV:"
    End_Object

    Object oGSEQ_SEQ_GVIEWS is a cDbForm_SI
        Entry_Item GSEQ.SEQ_GVIEWS
        Set Location to 43 11
        Set Size to 13 54
        Set Label to "Seq. Cad. View"
    End_Object

Cd_End_Object
