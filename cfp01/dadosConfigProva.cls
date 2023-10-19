VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "dadosConfigProva"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvartempoMin As Variant 'local copy
Private mvartempoMax As Variant 'local copy
Private mvardescricao As Variant 'local copy
Private mvarprovas As Variant 'local copy
Private mvardisciplinas As dadosProvasDisc 'local copy
'local variable(s) to hold property value(s)
Private mvarcod_conf_prova As Variant 'local copy
Public Property Let cod_conf_prova(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cod_conf_prova = 5
    mvarcod_conf_prova = vData
End Property


Public Property Set cod_conf_prova(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.cod_conf_prova = Form1
    Set mvarcod_conf_prova = vData
End Property


Public Property Get cod_conf_prova() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cod_conf_prova
    If IsObject(mvarcod_conf_prova) Then
        Set cod_conf_prova = mvarcod_conf_prova
    Else
        cod_conf_prova = mvarcod_conf_prova
    End If
End Property



Public Property Set disciplinas(ByVal vData As dadosProvasDisc)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.disciplinas = Form1
    Set mvardisciplinas = vData
End Property


Public Property Get disciplinas() As dadosProvasDisc
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.disciplinas
    Set disciplinas = mvardisciplinas
End Property



Public Property Let provas(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.provas = 5
    mvarprovas = vData
End Property


Public Property Set provas(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.provas = Form1
    Set mvarprovas = vData
End Property


Public Property Get provas() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.provas
    If IsObject(mvarprovas) Then
        Set provas = mvarprovas
    Else
        provas = mvarprovas
    End If
End Property



Public Property Let descricao(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.descricao = 5
    mvardescricao = vData
End Property


Public Property Set descricao(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.descricao = Form1
    Set mvardescricao = vData
End Property


Public Property Get descricao() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.descricao
    If IsObject(mvardescricao) Then
        Set descricao = mvardescricao
    Else
        descricao = mvardescricao
    End If
End Property



Public Property Let tempoMax(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.tempoMax = 5
    mvartempoMax = vData
End Property


Public Property Set tempoMax(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.tempoMax = Form1
    Set mvartempoMax = vData
End Property


Public Property Get tempoMax() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.tempoMax
    If IsObject(mvartempoMax) Then
        Set tempoMax = mvartempoMax
    Else
        tempoMax = mvartempoMax
    End If
End Property



Public Property Let tempoMin(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.tempoMin = 5
    mvartempoMin = vData
End Property


Public Property Set tempoMin(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.tempoMin = Form1
    Set mvartempoMin = vData
End Property


Public Property Get tempoMin() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.tempoMin
    If IsObject(mvartempoMin) Then
        Set tempoMin = mvartempoMin
    Else
        tempoMin = mvartempoMin
    End If
End Property



