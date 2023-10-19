VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "LoginUsuario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
Private usuario
Private senha
Dim conexao As Acesso

Implements ObjectControl

Private Sub Class_Initialize()

    usuario = ""
    senha = ""
    
     Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Public Sub setSenha(ByVal valor)

    senha = valor

End Sub

Public Function getSenha() As String

    getSenha = senha

End Function

Public Sub setUsuario(ByVal valor)

    usuario = valor

End Sub

Public Function getUsuario() As String

    getUsuario = usuario

End Function

Private Sub Class_Terminate()

    Set conexao = Nothing
    
End Sub

Public Function efetuaLogin() As Boolean


    

    
    Dim valida As Boolean

    If (usuario = "") Or (senha = "") Then
        efetuaLogin = False
    Else
        conexao.setSQL ("SELECT 0 AS NADA FROM USUARIO WHERE USR = '" & usuario & "' AND PWD = '" & senha & "'")
        efetuaLogin = Not (conexao.openSQL.EOF)
    End If

    
    
End Function

Private Sub ObjectControl_Activate()

    usuario = ""
    senha = ""
    
     Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Private Function ObjectControl_CanBePooled() As Boolean

    ObjectControl_CanBePooled = False

End Function

Private Sub ObjectControl_Deactivate()
    
    Set conexao = Nothing
    
End Sub
