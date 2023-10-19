VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "dadosConfProva"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvarnumero_questoes_faceis As Variant 'local copy
Private mvarcod_conf_prova As Variant 'local copy
Private mvarcod_disciplina As Variant 'local copy
Private mvarnumero_questoes_medias As Variant 'local copy
Private mvarnumero_questoes_dificeis As Variant 'local copy
Private mvarpeso_prova As Variant 'local copy
Private mvartempo_min As Variant 'local copy
Private mvartempo_max As Variant 'local copy
Public Property Let tempo_max(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.tempo_max = 5
    mvartempo_max = vData
End Property


Public Property Set tempo_max(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.tempo_max = Form1
    Set mvartempo_max = vData
End Property


Public Property Get tempo_max() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.tempo_max
    If IsObject(mvartempo_max) Then
        Set tempo_max = mvartempo_max
    Else
        tempo_max = mvartempo_max
    End If
End Property



Public Property Let tempo_min(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.tempo_min = 5
    mvartempo_min = vData
End Property


Public Property Set tempo_min(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.tempo_min = Form1
    Set mvartempo_min = vData
End Property


Public Property Get tempo_min() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.tempo_min
    If IsObject(mvartempo_min) Then
        Set tempo_min = mvartempo_min
    Else
        tempo_min = mvartempo_min
    End If
End Property



Public Property Let peso_prova(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.peso_prova = 5
    mvarpeso_prova = vData
End Property


Public Property Set peso_prova(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.peso_prova = Form1
    Set mvarpeso_prova = vData
End Property


Public Property Get peso_prova() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.peso_prova
    If IsObject(mvarpeso_prova) Then
        Set peso_prova = mvarpeso_prova
    Else
        peso_prova = mvarpeso_prova
    End If
End Property



Public Property Let numero_questoes_dificeis(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.numero_questoes_dificeis = 5
    mvarnumero_questoes_dificeis = vData
End Property


Public Property Set numero_questoes_dificeis(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.numero_questoes_dificeis = Form1
    Set mvarnumero_questoes_dificeis = vData
End Property


Public Property Get numero_questoes_dificeis() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.numero_questoes_dificeis
    If IsObject(mvarnumero_questoes_dificeis) Then
        Set numero_questoes_dificeis = mvarnumero_questoes_dificeis
    Else
        numero_questoes_dificeis = mvarnumero_questoes_dificeis
    End If
End Property



Public Property Let numero_questoes_medias(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.numero_questoes_medias = 5
    mvarnumero_questoes_medias = vData
End Property


Public Property Set numero_questoes_medias(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.numero_questoes_medias = Form1
    Set mvarnumero_questoes_medias = vData
End Property


Public Property Get numero_questoes_medias() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.numero_questoes_medias
    If IsObject(mvarnumero_questoes_medias) Then
        Set numero_questoes_medias = mvarnumero_questoes_medias
    Else
        numero_questoes_medias = mvarnumero_questoes_medias
    End If
End Property



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



Public Property Let numero_questoes_faceis(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.numero_questoes_faceis = 5
    mvarnumero_questoes_faceis = vData
End Property


Public Property Set numero_questoes_faceis(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.numero_questoes_faceis = Form1
    Set mvarnumero_questoes_faceis = vData
End Property


Public Property Get numero_questoes_faceis() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.numero_questoes_faceis
    If IsObject(mvarnumero_questoes_faceis) Then
        Set numero_questoes_faceis = mvarnumero_questoes_faceis
    Else
        numero_questoes_faceis = mvarnumero_questoes_faceis
    End If
End Property



