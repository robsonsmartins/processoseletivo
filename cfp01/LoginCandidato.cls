VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "LoginCandidato"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
Private conexao As Acesso
Private rg As String
Private inscricao As String

Implements ObjectControl

Private Sub Class_Initialize()
    
     Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Public Sub setRg(ByVal valor)

    rg = valor

End Sub

Public Function getRg() As String

    getRg = rg

End Function

Public Sub setInscricao(ByVal valor)

    inscricao = valor

End Sub

Public Function getInscricao() As String
    
    getInscricao = inscricao

End Function

Public Function efetuaLogin() As Boolean

    

    
    Dim valida As Boolean

    If (rg = "") Or (inscricao = "") Then
        efetuaLogin = False
    Else
        conexao.setSQL ("SELECT 0 AS NADA FROM CANDIDATO WHERE RG = '" & rg & "' AND COD_INSCRICAO = " & inscricao)
        efetuaLogin = Not (conexao.openSQL.EOF)
    End If

    
    

End Function



Private Sub Class_Terminate()

    Set conexao = Nothing

End Sub



Private Sub ObjectControl_Activate()

      Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Private Function ObjectControl_CanBePooled() As Boolean

    ObjectControl_CanBePooled = False

End Function

Private Sub ObjectControl_Deactivate()

    Set conexao = Nothing

End Sub
