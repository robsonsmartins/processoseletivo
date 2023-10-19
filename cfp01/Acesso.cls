VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 1  'vbDataSource
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Acesso"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private SQL As String
Private estado As Boolean
Private conn As adodb.Connection
Private registros As adodb.Recordset

Implements ObjectControl


Private Sub Class_Initialize()

    SQL = ""

    Dim diretorio As String

    diretorio = App.Path
    
    estado = False
        
    Set conn = New adodb.Connection
    
    conn.Open ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & diretorio & "\psel.mdb;Persist Security Info=False")
    estado = True


End Sub

Public Sub setSQL(ByVal valor)
    
    SQL = valor

End Sub

Public Function getSQL() As String

    getSQL = SQL
    
End Function

Public Function openSQL() As adodb.Recordset
    
    Set openSQL = conn.Execute(SQL)

End Function

Public Function execSQL() As Integer

    conn.Execute (SQL)

End Function

Private Sub Class_Terminate()

    conn.Close
    
    Set conn = Nothing
    Set registros = Nothing
    
End Sub

Private Sub ObjectControl_Activate()

   ' SQL = ""

   ' estado = False
        
   ' Set conn = New ADODB.Connection
    
   ' conn.Open ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Documents and Settings\Aurelio\Desktop\psel.mdb;Persist Security Info=False")

   ' estado = True


End Sub

Private Function ObjectControl_CanBePooled() As Boolean

    ObjectControl_CanBePooled = False

End Function

Private Sub ObjectControl_Deactivate()
        
  '  conn.Close
    
  '  Set conn = Nothing
  '  Set registros = Nothing
        
End Sub
