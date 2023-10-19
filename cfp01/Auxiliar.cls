VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Auxiliar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvarsequencia As Variant 'local copy
Private conexao As Acesso
Implements ObjectControl

Public Function getSequencia() As Integer

    Dim TEMP As adodb.Recordset
    Dim result As Integer
    
    conexao.setSQL ("INSERT INTO SEQUENCIA (REQUISITOR) VALUES ('AUX')")
    Set TEMP = conexao.openSQL
    
    conexao.setSQL ("SELECT MAX(SEQUENCIA) as res FROM SEQUENCIA")
    Set TEMP = conexao.openSQL
    
    result = TEMP.Fields("res")
    
    getSequencia = result
    
End Function





Private Sub Class_Initialize()
    
    Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Private Sub Class_Terminate()

    Set conexao = Nothing

End Sub

Private Sub ObjectControl_Activate()

End Sub

Private Function ObjectControl_CanBePooled() As Boolean
  
  ObjectControl_CanBePooled = False

End Function

Private Sub ObjectControl_Deactivate()

End Sub
