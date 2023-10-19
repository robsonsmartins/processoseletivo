VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Questao"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
Private infQuest As dadosQuestao
Dim conexao As Acesso
Dim registros As adodb.Recordset
Implements ObjectControl


Private Sub Class_Initialize()

    Set infQuest = CreateObject("ProcessoSeletivo.dadosQuestao")
    Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Private Sub Class_Terminate()
    
    Set conexao = Nothing
    Set infQuest = Nothing

End Sub

Private Sub ObjectControl_Activate()
    
    Set infQuest = CreateObject("ProcessoSeletivo.dadosQuestao")
    Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Private Function ObjectControl_CanBePooled() As Boolean

    ObjectControl_CanBePooled = False

End Function

Private Sub ObjectControl_Deactivate()
    
    Set conexao = Nothing
    Set infQuest = Nothing

End Sub

Public Function getQuestao(ByVal valor) As dadosQuestao
    

    conexao.setSQL ("SELECT * FROM QUESTAO WHERE COD_QUESTAO = " & valor)
    
    Set registros = New adodb.Recordset
    
    Set registros = conexao.openSQL
    
    If Not (registros.EOF) Then
    
        infQuest.alternativa_a = registros!alternativa_a
        infQuest.alternativa_b = registros!alternativa_b
        infQuest.alternativa_c = registros!alternativa_c
        infQuest.alternativa_d = registros!alternativa_d
        infQuest.alternativa_e = registros!alternativa_e
        infQuest.cod_disciplina = registros!cod_disciplina
        infQuest.cod_divisao = registros!cod_divisao
        infQuest.cod_item = registros!cod_item
        infQuest.cod_questao = registros!cod_questao
        infQuest.cod_topico = registros!cod_topico
        infQuest.cod_usuario = registros!cod_usuario
        infQuest.dificuldade = registros!dificuldade
        infQuest.enunciado = registros!enunciado
        infQuest.figura = registros!figura
        infQuest.flag_sorteiopassado = registros!flag_sorteiopassado
        infQuest.gabarito = registros!gabarito
            
    End If
    
    Set getQuestao = infQuest

    
    
End Function

Public Function setQuestao(ByVal valor As dadosQuestao) As Boolean
    
    conexao.setSQL ("INSERT INTO QUESTAO(enunciado, alternativa_a, alternativa_b, alternativa_c, alternativa_d, alternativa_e, gabarito, dificuldade, cod_divisao, cod_topico, cod_disciplina) VALUES ('" & valor.enunciado & "','" & valor.alternativa_a & "','" & valor.alternativa_b & "','" & valor.alternativa_c & "','" & valor.alternativa_d & "','" & valor.alternativa_e & "','" & valor.gabarito & "','" & valor.dificuldade & "'," & valor.cod_divisao & "," & valor.cod_topico & "," & valor.cod_disciplina & ")")
    '    conexao.setSQL ("INSERT INTO QUESTAO(enunciado, alternativa_a, alternativa_b, alternativa_c, alternativa_d, alternativa_e, gabarito, figura, flag_sorteiopassado, dificuldade, cod_divisao, cod_topico, cod_item, cod_usuario, cod_disciplina) VALUES ('" & valor.enunciado & "','" & valor.alternativa_a & "','" & valor.alternativa_b & "','" & valor.alternativa_c & "','" & valor.alternativa_d & "','" & valor.alternativa_e & "','" & valor.gabarito & "','" & valor.figura & "','" & valor.flag_sorteiopassado & "','" & valor.dificuldade & "'," & valor.cod_divisao & "," & valor.cod_topico & "," & valor.cod_item & "," & valor.cod_usuario & "," & valor.cod_disciplina & ")")
    conexao.openSQL
    
    
    
End Function

Public Function updateQuestao(ByVal valor As dadosQuestao) As Boolean
    
    conexao.setSQL ("UPDATE QUESTAO SET enunciado = '" & valor.enunciado & "', alternativa_a = '" & valor.alternativa_a & "', alternativa_b = '" & valor.alternativa_b & "', alternativa_c = '" & valor.alternativa_c & "', alternativa_d = '" & valor.alternativa_d & "', alternativa_e = '" & valor.alternativa_e & "', gabarito = '" & valor.gabarito & "', figura = '" & valor.figura & "', flag_sorteiopassado = " & valor.flag_sorteiopassado & ", dificuldade = '" & valor.dificuldade & "', cod_divisao = " & valor.cod_divisao & ", cod_topico = " & valor.cod_topico & ", cod_disciplina = " & valor.cod_disciplina & " WHERE cod_questao = " & valor.cod_questao)
    conexao.openSQL
    
End Function


