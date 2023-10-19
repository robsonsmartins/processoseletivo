VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ProvaManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"Prova"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Base 0
'local variable(s) to hold property value(s)
Private locProva As prova
Private locQuest As Questao
Private dadoQuest As dadosQuestao
Private mvaridentCandidato As Variant 'local copy
Private mvarData As Variant 'local copy
Private habilita As Boolean
Implements ObjectControl

Public Property Let Data(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Data = 5
    mvarData = vData
End Property


Public Property Set Data(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.Data = Form1
    Set mvarData = vData
End Property


Public Property Get Data() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.Data
    If IsObject(mvarData) Then
        Set Data = mvarData
    Else
        Data = mvarData
    End If
End Property



Public Property Let identCandidato(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.identCandidato = 5
    mvaridentCandidato = vData
End Property


Public Property Set identCandidato(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.identCandidato = Form1
    Set mvaridentCandidato = vData
End Property


Public Property Get identCandidato() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.identCandidato
    If IsObject(mvaridentCandidato) Then
        Set identCandidato = mvaridentCandidato
    Else
        identCandidato = mvaridentCandidato
    End If
End Property


Public Sub HabilitaProva()
    
End Sub

Public Function CriarProva(ByVal CodCandidato, CodProva As Integer) As prova
'By Robson S. Martins - Sorteia questões para formar a prova
  Dim conexao As Acesso
  Dim SQL As String
  Dim rs, qs As ADODB.Recordset
  Dim qf, qm, qd, i, j As Integer
  Dim coddis, qc As Integer
  Dim codq(), qsorte() As Integer
  Dim qdific(3) As String
  Dim achou As Boolean
  Set conexao = CreateObject("ProcessoSeletivo.Acesso")
  Set rs = New ADODB.Recordset
  Set qs = New ADODB.Recordset
  Set locProva = CreateObject("ProcessoSeletivo.Prova")
  Set locQuest = CreateObject("ProcessoSeletivo.Questao")
  Set dadoQuest = CreateObject("ProcessoSeletivo.dadosQuestao")
  'pega numero de questões e disciplina
  SQL = "SELECT QUESTOES_FACEIS, QUESTOES_DIFICEIS, QUESTOES_MEDIAS, COD_DISCIPLINA FROM PROVA_DISC WHERE COD_CONF_PROVA = "
  SQL = SQL & CStr(CodProva)
  conexao.setSQL (SQL)
  Set rs = conexao.openSQL
  'apaga registros anteriores em prova
  SQL = "DELETE FROM PROVA WHERE COD_CANDIDATO = " & CStr(CodCandidato) & " AND COD_CONF_PROVA = " & CStr(CodProva)
  conexao.setSQL (SQL)
  conexao.openSQL
  'para cada disciplina pega questoes
  Do Until rs.EOF
    qf = rs!questoes_faceis
    qm = rs!questoes_medias
    qd = rs!questoes_dificeis
    coddis = rs!cod_disciplina
    qdific(0) = "'F'"
    qdific(1) = "'M'"
    qdific(2) = "'D'"
    For qc = 0 To 2
        'pega questoes faceis/medias/dificeis
        SQL = "SELECT COD_QUESTAO FROM QUESTAO WHERE COD_DISCIPLINA = "
        SQL = SQL & CStr(coddis) & " AND DIFICULDADE = " & qdific(qc) & " AND FLAG_SORTEIOPASSADO <> 1"
        conexao.setSQL (SQL)
        Set qs = conexao.openSQL
        'coloca questoes no array
        ReDim codq(0)
        Do Until qs.EOF
          ReDim Preserve codq(UBound(codq) + 1)
          codq(UBound(codq) - 1) = qs!cod_questao
          qs.MoveNext
        Loop
        'verifica se tem menos questoes do que o requisitado
        'traz nenhuma questão
        If (qc = 0) And (UBound(codq) < qf) Then
          qf = 0
        End If
        If (qc = 1) And (UBound(codq) < qm) Then
          qm = 0
        End If
        If (qc = 2) And (UBound(codq) < qd) Then
          qd = 0
        End If
        'sorteia questoes no array
        Randomize
        Select Case qc
          Case 0
            ReDim qsorte(qf)
          Case 1
            ReDim qsorte(qm)
          Case 2
            ReDim qsorte(qd)
        End Select
        For i = 0 To UBound(qsorte) - 1
          Do
            'sorteia somente questões não sorteadas
            qsorte(i) = codq(Int((UBound(codq)) * Rnd))
            achou = False
            For j = 0 To UBound(qsorte) - 1
              If (qsorte(i) = qsorte(j)) And (i <> j) Then
                achou = True
                Exit For
              End If
            Next j
          Loop Until Not achou
        Next i
        'coloca questoes no obj prova
        For i = 0 To UBound(qsorte) - 1
          Set dadoQuest = locQuest.getQuestao(qsorte(i))
          locProva.Add dadoQuest.enunciado, dadoQuest.cod_questao, dadoQuest.alternativa_a, dadoQuest.alternativa_b, dadoQuest.alternativa_c, dadoQuest.alternativa_d, dadoQuest.alternativa_e, dadoQuest.gabarito, dadoQuest.figura, dadoQuest.flag_sorteiopassado, dadoQuest.dificuldade, dadoQuest.cod_divisao, dadoQuest.cod_topico, dadoQuest.cod_item, dadoQuest.cod_usuario, dadoQuest.cod_disciplina
          'Faz Insert na tabela Prova
          SQL = "INSERT INTO PROVA (COD_QUESTAO,COD_CANDIDATO,COD_CONF_PROVA,RESPOSTA) VALUES (" & CStr(qsorte(i)) & ", " & CStr(CodCandidato) & ", " & CStr(CodProva) & ", ' ')"
          conexao.setSQL (SQL)
          conexao.openSQL
        Next i
    Next qc
    rs.MoveNext
  Loop
  Set rs = Nothing
  Set qs = Nothing
  Set conexao = Nothing
  Set CriarProva = locProva
End Function

Public Function GetProva(ByVal CodCandidato, CodProva As Integer) As prova
'By Robson S. Martins - Retorna uma prova já criada
  Dim conexao As Acesso
  Dim SQL As String
  Dim rs As ADODB.Recordset
  Set conexao = CreateObject("ProcessoSeletivo.Acesso")
  Set rs = New ADODB.Recordset
  Set locProva = CreateObject("ProcessoSeletivo.Prova")
  Set locQuest = CreateObject("ProcessoSeletivo.Questao")
  Set dadoQuest = CreateObject("ProcessoSeletivo.dadosQuestao")
  SQL = "SELECT COD_QUESTAO FROM PROVA WHERE COD_CANDIDATO = "
  SQL = SQL & CStr(CodCandidato) & " AND COD_CONF_PROVA = "
  SQL = SQL & CStr(CodProva)
  conexao.setSQL (SQL)
  Set rs = conexao.openSQL
  While Not rs.EOF
    Set dadoQuest = locQuest.getQuestao(rs!cod_questao)
    locProva.Add dadoQuest.enunciado, dadoQuest.cod_questao, dadoQuest.alternativa_a, dadoQuest.alternativa_b, dadoQuest.alternativa_c, dadoQuest.alternativa_d, dadoQuest.alternativa_e, dadoQuest.gabarito, dadoQuest.figura, dadoQuest.flag_sorteiopassado, dadoQuest.dificuldade, dadoQuest.cod_divisao, dadoQuest.cod_topico, dadoQuest.cod_item, dadoQuest.cod_usuario, dadoQuest.cod_disciplina
    rs.MoveNext
  Wend
  Set rs = Nothing
  Set conexao = Nothing
  Set GetProva = locProva
End Function

Public Sub CorrigirProva(ByVal CodCandidato, CodProva As Integer)
'By Robson S. Martins - Corrige uma prova
  Dim conexao As Acesso
  Dim SQL As String
  Dim disciplinas As ADODB.Recordset
  Dim prova As ADODB.Recordset
  Dim peso, pesototal, total, acertadas As Integer
  Dim nota As Double
  Set conexao = CreateObject("ProcessoSeletivo.Acesso")
  Set disciplinas = New ADODB.Recordset
  Set prova = New ADODB.Recordset
  'Pega prova com respostas e dados questoes
  SQL = "select p.*, q.gabarito, q.cod_disciplina from prova p, questao q where q.cod_questao = p.cod_questao and p.cod_conf_prova = " & CStr(CodProva) & " and p.cod_candidato = " & CStr(CodCandidato)
  conexao.setSQL (SQL)
  Set prova = conexao.openSQL
  'Pega disciplinas
  SQL = "select * from prova_disc where cod_conf_prova = " & CStr(CodProva)
  conexao.setSQL (SQL)
  Set disciplinas = conexao.openSQL
  'para cada disciplina, corrige questoes
  pesototal = 0
  nota = 0
  Do Until disciplinas.EOF
    'pega peso
    peso = disciplinas!peso
    'acumula peso total
    pesototal = pesototal + peso
    'pega total de questões da disciplina
    total = disciplinas!questoes_faceis + disciplinas!questoes_medias + disciplinas!questoes_dificeis
    acertadas = 0
    prova.MoveFirst
    Do Until prova.EOF
      'se a questão é da disciplina corrente, corrige (compara resposta com gabarito)
      If prova!cod_disciplina = disciplinas!cod_disciplina Then
        If UCase(prova!resposta) = UCase(prova!gabarito) Then
          'acumula questões acertadas
          acertadas = acertadas + 1
        End If
      End If
      prova.MoveNext
    Loop
    'acumula notas * peso
    nota = nota + acertadas / total * 10 * peso
    disciplinas.MoveNext
  Loop
  'calcula nota final
  nota = nota / pesototal
  'grava nota no BD
  SQL = "update nota_prova set nota = '" & CStr(nota) & "' where cod_conf_prova = " & CStr(CodProva) & " and cod_candidato = " & CStr(CodCandidato)
  conexao.setSQL (SQL)
  conexao.openSQL
  Set disciplinas = Nothing
  Set prova = Nothing
  Set conexao = Nothing
End Sub

Private Sub Class_Initialize()
    habilita = False
End Sub

Private Sub Class_Terminate()
    
    Set locProva = Nothing
    Set locQuest = Nothing
    Set dadoQuest = Nothing
    
End Sub

Private Sub ObjectControl_Activate()
    habilita = False
End Sub

Private Function ObjectControl_CanBePooled() As Boolean

    ObjectControl_CanBePooled = False

End Function

Private Sub ObjectControl_Deactivate()
    
    Set locProva = Nothing
    Set locQuest = Nothing
    Set dadoQuest = Nothing
   

End Sub
