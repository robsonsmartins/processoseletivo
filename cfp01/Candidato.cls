VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Candidato"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
Private infCand As dadosCandidato
Dim conexao As Acesso
Dim registros As adodb.Recordset
Implements ObjectControl

Public Function getCandidato(ByVal valor) As dadosCandidato


    

    conexao.setSQL ("SELECT * FROM CANDIDATO WHERE COD_CANDIDATO = " & valor)
    
    Set registros = New adodb.Recordset
    
    Set registros = conexao.openSQL
    
    If Not (registros.EOF) Then
    
        infCand.bairro = registros!bairro
        infCand.cep = registros!cep
        infCand.cidade = registros!cidade
        infCand.cod_candidato = registros!cod_candidato
        infCand.inscricao = registros!inscricao
        infCand.cpf = registros!cpf
        infCand.data_cadastro = registros!data_cadastro
        infCand.email = registros!email
        infCand.endereco = registros!endereco
        infCand.estado = registros!estado
        infCand.nascimento = registros!nascimento
        infCand.nome = registros!nome
        infCand.rg = registros!rg
        infCand.sexo = registros!sexo
        infCand.telefone = registros!telefone
    
    End If
    
    Set getCandidato = infCand

    
    
End Function

Public Function setCandidato(ByVal valor As dadosCandidato) As Boolean
    

    
    
    'conexao.setSQL ("INSERT INTO CANDIDATO (candidato.endereco, candidato.bairro, candidato.cep, candidato.cidade, candidato.estado, candidato.rg, candidato.cpf, candidato.telefone, candidato.email, candidato.cod_inscricao, candidato.cod_exame, candidato.data_cadastro, candidato.nome, candidato.nascimento, candidato.sexo) VALUES ('" & valor.endereco & "','" & valor.bairro & "','" & valor.cep & "','" & valor.cidade & "','" & valor.estado & "','" & valor.rg & "','" & valor.cpf & "','" & valor.telefone & "','" & valor.email & "'," & valor.cod_inscricao & ",'" & valor.cod_exame & "','" & valor.data_cadastro & "','" & valor.nome & "','" & valor.nascimento & "','" & valor.sexo & "')")
    conexao.setSQL ("INSERT INTO CANDIDATO (endereco, bairro, cep, cidade, estado, rg, cpf, telefone, email, inscricao, data_cadastro, nome, nascimento, sexo) VALUES ('" & valor.endereco & "','" & valor.bairro & "','" & valor.cep & "','" & valor.cidade & "','" & valor.estado & "','" & valor.rg & "','" & valor.cpf & "','" & valor.telefone & "','" & valor.email & "'," & valor.inscricao & ",'" & valor.data_cadastro & "','" & valor.nome & "','" & valor.nascimento & "','" & valor.sexo & "')")
    conexao.openSQL
    
    
    
End Function

Public Function GetInscricao() As String
  Dim a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t As Integer
  Dim codinsc As String
  Dim candins As adodb.Recordset
  Randomize
  Do
    a = Int(Rnd * 10)
    b = Int(Rnd * 10)
    c = Int(Rnd * 10)
    d = Int(Rnd * 10)
    e = Int(Rnd * 10)
    f = Int(Rnd * 10)
    g = Int(Rnd * 10)
    h = Int(Rnd * 10)
    i = Int(Rnd * 10)
    j = Int(Rnd * 10)
    k = Int(Rnd * 10)
    l = Int(Rnd * 10)
    m = Int(Rnd * 10)
    n = Int(Rnd * 10)
    o = Int(Rnd * 10)
    p = Int(Rnd * 10)
    q = Int(Rnd * 10)
    r = Int(Rnd * 10)
    s = Int(Rnd * 10)
    t = Int(Rnd * 10)
    codinsc = CStr(a) & CStr(b) & CStr(c) & CStr(d) & CStr(e) & CStr(f) & CStr(g) & CStr(h) & CStr(i) & CStr(j)
    codinsc = codinsc & CStr(l) & CStr(m) & CStr(n) & CStr(o) & CStr(p) & CStr(q) & CStr(g) & CStr(r) & CStr(s) & CStr(t)
    conexao.setSQL ("select inscricao from candidato where inscricao = '" & codinsc & "'")
    Set candins = conexao.openSQL
  Loop Until candins.EOF
  GetInscricao = codinsc
  Set candins = Nothing
End Function

Private Sub Class_Initialize()

    Set infCand = CreateObject("ProcessoSeletivo.dadosCandidato")
    Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Private Sub Class_Terminate()
    
    Set conexao = Nothing
    Set infCand = Nothing

End Sub

Private Sub ObjectControl_Activate()

    Set infCand = CreateObject("ProcessoSeletivo.dadosCandidato")
    Set conexao = CreateObject("ProcessoSeletivo.Acesso")

End Sub

Private Function ObjectControl_CanBePooled() As Boolean

    ObjectControl_CanBePooled = False

End Function

Private Sub ObjectControl_Deactivate()
    Set infCand = Nothing
    Set conexao = Nothing
End Sub
