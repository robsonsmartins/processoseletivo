VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "dadosConfigExame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Private mvarano As Variant 'local copy
Private mvarsemestre As Variant 'local copy
Private mvardescricao As Variant 'local copy
Private mvararea As Variant 'local copy
Private mvarprovas As dadosConfigProvas 'local copy
Private mvararea_texto As Variant 'local copy
Public Property Let area_texto(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.area_texto = 5
    mvararea_texto = vData
End Property


Public Property Set area_texto(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.area_texto = Form1
    Set mvararea_texto = vData
End Property


Public Property Get area_texto() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.area_texto
    If IsObject(mvararea_texto) Then
        Set area_texto = mvararea_texto
    Else
        area_texto = mvararea_texto
    End If
End Property



Public Property Set provas(ByVal vData As dadosConfigProvas)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.provas = Form1
    Set mvarprovas = vData
End Property


Public Property Get provas() As dadosConfigProvas
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.provas
    Set provas = mvarprovas
End Property



Public Property Let area(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.area = 5
    mvararea = vData
End Property


Public Property Set area(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.area = Form1
    Set mvararea = vData
End Property


Public Property Get area() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.area
    If IsObject(mvararea) Then
        Set area = mvararea
    Else
        area = mvararea
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



Public Property Let semestre(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.semestre = 5
    mvarsemestre = vData
End Property


Public Property Set semestre(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.semestre = Form1
    Set mvarsemestre = vData
End Property


Public Property Get semestre() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.semestre
    If IsObject(mvarsemestre) Then
        Set semestre = mvarsemestre
    Else
        semestre = mvarsemestre
    End If
End Property



Public Property Let ano(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ano = 5
    mvarano = vData
End Property


Public Property Set ano(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.ano = Form1
    Set mvarano = vData
End Property


Public Property Get ano() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ano
    If IsObject(mvarano) Then
        Set ano = mvarano
    Else
        ano = mvarano
    End If
End Property



