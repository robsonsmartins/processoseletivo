VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "dadosQuestao"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvarenunciado As Variant 'local copy
Private mvarcod_questao As Variant 'local copy
Private mvaralternativa_a As Variant 'local copy
Private mvaralternativa_b As Variant 'local copy
Private mvaralternativa_c As Variant 'local copy
Private mvaralternativa_d As Variant 'local copy
Private mvaralternativa_e As Variant 'local copy
Private mvargabarito As Variant 'local copy
Private mvarfigura As Variant 'local copy
Private mvarflag_sorteiopassado As Variant 'local copy
Private mvardificuldade As Variant 'local copy
Private mvarcod_divisao As Variant 'local copy
Private mvarcod_topico As Variant 'local copy
Private mvarcod_item As Variant 'local copy
Private mvarcod_usuario As Variant 'local copy
Private mvarcod_disciplina As Variant 'local copy
Private mvarresposta As Variant 'local copy

Public Property Let cod_disciplina(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cod_disciplina = 5
    mvarcod_disciplina = vData
End Property


Public Property Set cod_disciplina(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cod_disciplina = Form1
    Set mvarcod_disciplina = vData
End Property


Public Property Get cod_disciplina() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cod_disciplina
    If IsObject(mvarcod_disciplina) Then
        Set cod_disciplina = mvarcod_disciplina
    Else
        cod_disciplina = mvarcod_disciplina
    End If
End Property



Public Property Let cod_usuario(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cod_usuario = 5
    mvarcod_usuario = vData
End Property


Public Property Set cod_usuario(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cod_usuario = Form1
    Set mvarcod_usuario = vData
End Property


Public Property Get cod_usuario() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cod_usuario
    If IsObject(mvarcod_usuario) Then
        Set cod_usuario = mvarcod_usuario
    Else
        cod_usuario = mvarcod_usuario
    End If
End Property



Public Property Let cod_item(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cod_item = 5
    mvarcod_item = vData
End Property


Public Property Set cod_item(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cod_item = Form1
    Set mvarcod_item = vData
End Property


Public Property Get cod_item() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cod_item
    If IsObject(mvarcod_item) Then
        Set cod_item = mvarcod_item
    Else
        cod_item = mvarcod_item
    End If
End Property



Public Property Let cod_topico(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cod_topico = 5
    mvarcod_topico = vData
End Property


Public Property Set cod_topico(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cod_topico = Form1
    Set mvarcod_topico = vData
End Property


Public Property Get cod_topico() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cod_topico
    If IsObject(mvarcod_topico) Then
        Set cod_topico = mvarcod_topico
    Else
        cod_topico = mvarcod_topico
    End If
End Property



Public Property Let cod_divisao(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cod_divisao = 5
    mvarcod_divisao = vData
End Property


Public Property Set cod_divisao(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cod_divisao = Form1
    Set mvarcod_divisao = vData
End Property


Public Property Get cod_divisao() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cod_divisao
    If IsObject(mvarcod_divisao) Then
        Set cod_divisao = mvarcod_divisao
    Else
        cod_divisao = mvarcod_divisao
    End If
End Property



Public Property Let dificuldade(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.dificuldade = 5
    mvardificuldade = vData
End Property


Public Property Set dificuldade(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.dificuldade = Form1
    Set mvardificuldade = vData
End Property


Public Property Get dificuldade() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.dificuldade
    If IsObject(mvardificuldade) Then
        Set dificuldade = mvardificuldade
    Else
        dificuldade = mvardificuldade
    End If
End Property

Public Property Let flag_sorteiopassado(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.flag_sorteio = 5
    mvarflag_sorteiopassado = vData
End Property


Public Property Set flag_sorteiopassado(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.flag_sorteio = Form1
    Set mvarflag_sorteiopassado = vData
End Property


Public Property Get flag_sorteiopassado() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.flag_sorteio
    If IsObject(mvarflag_sorteiopassado) Then
        Set flag_sorteiopassado = mvarflag_sorteiopassado
    Else
        flag_sorteiopassado = mvarflag_sorteiopassado
    End If
End Property



Public Property Let figura(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.figura = 5
    mvarfigura = vData
End Property


Public Property Set figura(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.figura = Form1
    Set mvarfigura = vData
End Property


Public Property Get figura() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.figura
    If IsObject(mvarfigura) Then
        Set figura = mvarfigura
    Else
        figura = mvarfigura
    End If
End Property



Public Property Let gabarito(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.gabarito = 5
    mvargabarito = vData
End Property


Public Property Set gabarito(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.gabarito = Form1
    Set mvargabarito = vData
End Property


Public Property Get gabarito() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.gabarito
    If IsObject(mvargabarito) Then
        Set gabarito = mvargabarito
    Else
        gabarito = mvargabarito
    End If
End Property



Public Property Let alternativa_e(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.alternativa_e = 5
    mvaralternativa_e = vData
End Property


Public Property Set alternativa_e(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.alternativa_e = Form1
    Set mvaralternativa_e = vData
End Property


Public Property Get alternativa_e() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.alternativa_e
    If IsObject(mvaralternativa_e) Then
        Set alternativa_e = mvaralternativa_e
    Else
        alternativa_e = mvaralternativa_e
    End If
End Property



Public Property Let alternativa_d(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.alternativa_d = 5
    mvaralternativa_d = vData
End Property


Public Property Set alternativa_d(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.alternativa_d = Form1
    Set mvaralternativa_d = vData
End Property


Public Property Get alternativa_d() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.alternativa_d
    If IsObject(mvaralternativa_d) Then
        Set alternativa_d = mvaralternativa_d
    Else
        alternativa_d = mvaralternativa_d
    End If
End Property



Public Property Let alternativa_c(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.alternativa_c = 5
    mvaralternativa_c = vData
End Property


Public Property Set alternativa_c(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.alternativa_c = Form1
    Set mvaralternativa_c = vData
End Property


Public Property Get alternativa_c() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.alternativa_c
    If IsObject(mvaralternativa_c) Then
        Set alternativa_c = mvaralternativa_c
    Else
        alternativa_c = mvaralternativa_c
    End If
End Property



Public Property Let alternativa_b(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.alternativa_b = 5
    mvaralternativa_b = vData
End Property


Public Property Set alternativa_b(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.alternativa_b = Form1
    Set mvaralternativa_b = vData
End Property


Public Property Get alternativa_b() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.alternativa_b
    If IsObject(mvaralternativa_b) Then
        Set alternativa_b = mvaralternativa_b
    Else
        alternativa_b = mvaralternativa_b
    End If
End Property



Public Property Let alternativa_a(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.alternativa_a = 5
    mvaralternativa_a = vData
End Property


Public Property Set alternativa_a(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.alternativa_a = Form1
    Set mvaralternativa_a = vData
End Property


Public Property Get alternativa_a() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.alternativa_a
    If IsObject(mvaralternativa_a) Then
        Set alternativa_a = mvaralternativa_a
    Else
        alternativa_a = mvaralternativa_a
    End If
End Property



Public Property Let cod_questao(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cod_questao = 5
    mvarcod_questao = vData
End Property


Public Property Set cod_questao(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cod_questao = Form1
    Set mvarcod_questao = vData
End Property


Public Property Get cod_questao() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cod_questao
    If IsObject(mvarcod_questao) Then
        Set cod_questao = mvarcod_questao
    Else
        cod_questao = mvarcod_questao
    End If
End Property

Public Property Let enunciado(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.enunciado = 5
    mvarenunciado = vData
End Property


Public Property Set enunciado(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.enunciado = Form1
    Set mvarenunciado = vData
End Property


Public Property Get enunciado() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.enunciado
    If IsObject(mvarenunciado) Then
        Set enunciado = mvarenunciado
    Else
        enunciado = mvarenunciado
    End If
End Property

Public Property Let resposta(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.enunciado = 5
    mvarresposta = vData
End Property


Public Property Set resposta(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.enunciado = Form1
    Set mvarresposta = vData
End Property


Public Property Get resposta() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.enunciado
    If IsObject(mvarresposta) Then
        Set resposta = mvarresposta
    Else
        resposta = mvarresposta
    End If
End Property


