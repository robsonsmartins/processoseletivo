VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "dadosCandidato"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvarendereco As String 'local copy
Private mvarcod_candidato As Variant 'local copy
Private mvarbairro As Variant 'local copy
Private mvarcep As Variant 'local copy
Private mvarcidade As Variant 'local copy
Private mvarestado As Variant 'local copy
Private mvarrg As Variant 'local copy
Private mvarcpf As Variant 'local copy
Private mvartelefone As Variant 'local copy
Private mvaremail As Variant 'local copy
Private mvarinscricao As Variant 'local copy
Private mvardata_cadastro As Variant 'local copy
Private mvarnome As Variant 'local copy
Private mvarnascimento As Variant 'local copy
Private mvarsexo As Variant 'local copy

Public Property Let sexo(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.sexo = 5
    mvarsexo = vData
End Property


Public Property Set sexo(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.sexo = Form1
    Set mvarsexo = vData
End Property


Public Property Get sexo() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.sexo
    If IsObject(mvarsexo) Then
        Set sexo = mvarsexo
    Else
        sexo = mvarsexo
    End If
End Property



Public Property Let nascimento(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.nascimento = 5
    mvarnascimento = vData
End Property


Public Property Set nascimento(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.nascimento = Form1
    Set mvarnascimento = vData
End Property


Public Property Get nascimento() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.nascimento
    If IsObject(mvarnascimento) Then
        Set nascimento = mvarnascimento
    Else
        nascimento = mvarnascimento
    End If
End Property



Public Property Let nome(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.nome = 5
    mvarnome = vData
End Property


Public Property Set nome(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.nome = Form1
    Set mvarnome = vData
End Property


Public Property Get nome() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.nome
    If IsObject(mvarnome) Then
        Set nome = mvarnome
    Else
        nome = mvarnome
    End If
End Property



Public Property Let data_cadastro(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.data_cadastro = 5
    mvardata_cadastro = vData
End Property


Public Property Set data_cadastro(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.data_cadastro = Form1
    Set mvardata_cadastro = vData
End Property


Public Property Get data_cadastro() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.data_cadastro
    If IsObject(mvardata_cadastro) Then
        Set data_cadastro = mvardata_cadastro
    Else
        data_cadastro = mvardata_cadastro
    End If
End Property


Public Property Let inscricao(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.inscricao = 5
    mvarinscricao = vData
End Property


Public Property Set inscricao(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.inscricao = Form1
    Set mvarinscricao = vData
End Property


Public Property Get inscricao() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.inscricao
    If IsObject(mvarinscricao) Then
        Set inscricao = mvarinscricao
    Else
        inscricao = mvarinscricao
    End If
End Property



Public Property Let email(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.email = 5
    mvaremail = vData
End Property


Public Property Set email(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.email = Form1
    Set mvaremail = vData
End Property


Public Property Get email() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.email
    If IsObject(mvaremail) Then
        Set email = mvaremail
    Else
        email = mvaremail
    End If
End Property



Public Property Let telefone(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.telefone = 5
    mvartelefone = vData
End Property


Public Property Set telefone(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.telefone = Form1
    Set mvartelefone = vData
End Property


Public Property Get telefone() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.telefone
    If IsObject(mvartelefone) Then
        Set telefone = mvartelefone
    Else
        telefone = mvartelefone
    End If
End Property



Public Property Let cpf(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cpf = 5
    mvarcpf = vData
End Property


Public Property Set cpf(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cpf = Form1
    Set mvarcpf = vData
End Property


Public Property Get cpf() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cpf
    If IsObject(mvarcpf) Then
        Set cpf = mvarcpf
    Else
        cpf = mvarcpf
    End If
End Property



Public Property Let rg(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.rg = 5
    mvarrg = vData
End Property


Public Property Set rg(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.rg = Form1
    Set mvarrg = vData
End Property


Public Property Get rg() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.rg
    If IsObject(mvarrg) Then
        Set rg = mvarrg
    Else
        rg = mvarrg
    End If
End Property



Public Property Let estado(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.estado = 5
    mvarestado = vData
End Property


Public Property Set estado(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.estado = Form1
    Set mvarestado = vData
End Property


Public Property Get estado() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.estado
    If IsObject(mvarestado) Then
        Set estado = mvarestado
    Else
        estado = mvarestado
    End If
End Property



Public Property Let cidade(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cidade = 5
    mvarcidade = vData
End Property


Public Property Set cidade(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cidade = Form1
    Set mvarcidade = vData
End Property


Public Property Get cidade() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cidade
    If IsObject(mvarcidade) Then
        Set cidade = mvarcidade
    Else
        cidade = mvarcidade
    End If
End Property



Public Property Let cep(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cep = 5
    mvarcep = vData
End Property


Public Property Set cep(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cep = Form1
    Set mvarcep = vData
End Property


Public Property Get cep() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cep
    If IsObject(mvarcep) Then
        Set cep = mvarcep
    Else
        cep = mvarcep
    End If
End Property



Public Property Let bairro(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.bairro = 5
    mvarbairro = vData
End Property


Public Property Set bairro(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.bairro = Form1
    Set mvarbairro = vData
End Property


Public Property Get bairro() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.bairro
    If IsObject(mvarbairro) Then
        Set bairro = mvarbairro
    Else
        bairro = mvarbairro
    End If
End Property



Public Property Let cod_candidato(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cod_candidato = 5
    mvarcod_candidato = vData
End Property


Public Property Set cod_candidato(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cod_candidato = Form1
    Set mvarcod_candidato = vData
End Property


Public Property Get cod_candidato() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cod_candidato
    If IsObject(mvarcod_candidato) Then
        Set cod_candidato = mvarcod_candidato
    Else
        cod_candidato = mvarcod_candidato
    End If
End Property



Public Property Let endereco(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.endereco = 5
    mvarendereco = vData
End Property


Public Property Get endereco() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.endereco
    endereco = mvarendereco
End Property



