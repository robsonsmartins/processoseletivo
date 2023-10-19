VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "dadosProvaDisc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvarcod_disciplina As Variant 'local copy
Private mvarnumeroQuestoesDificeis As Variant 'local copy
Private mvarnumeroQuestoesMedias As Variant 'local copy
Private mvarnumeroQuestoesFaceis As Variant 'local copy
Private mvarpeso As Variant 'local copy
'local variable(s) to hold property value(s)
Private mvardisciplina_texto As Variant 'local copy
Public Property Let disciplina_texto(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.disciplina_texto = 5
    mvardisciplina_texto = vData
End Property


Public Property Set disciplina_texto(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.disciplina_texto = Form1
    Set mvardisciplina_texto = vData
End Property


Public Property Get disciplina_texto() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.disciplina_texto
    If IsObject(mvardisciplina_texto) Then
        Set disciplina_texto = mvardisciplina_texto
    Else
        disciplina_texto = mvardisciplina_texto
    End If
End Property



Public Property Let peso(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.peso = 5
    mvarpeso = vData
End Property


Public Property Set peso(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.peso = Form1
    Set mvarpeso = vData
End Property


Public Property Get peso() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.peso
    If IsObject(mvarpeso) Then
        Set peso = mvarpeso
    Else
        peso = mvarpeso
    End If
End Property



Public Property Let numeroQuestoesFaceis(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.numeroQuestoesFaceis = 5
    mvarnumeroQuestoesFaceis = vData
End Property


Public Property Set numeroQuestoesFaceis(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.numeroQuestoesFaceis = Form1
    Set mvarnumeroQuestoesFaceis = vData
End Property


Public Property Get numeroQuestoesFaceis() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.numeroQuestoesFaceis
    If IsObject(mvarnumeroQuestoesFaceis) Then
        Set numeroQuestoesFaceis = mvarnumeroQuestoesFaceis
    Else
        numeroQuestoesFaceis = mvarnumeroQuestoesFaceis
    End If
End Property



Public Property Let numeroQuestoesMedias(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.numeroQuestoesMedias = 5
    mvarnumeroQuestoesMedias = vData
End Property


Public Property Set numeroQuestoesMedias(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.numeroQuestoesMedias = Form1
    Set mvarnumeroQuestoesMedias = vData
End Property


Public Property Get numeroQuestoesMedias() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.numeroQuestoesMedias
    If IsObject(mvarnumeroQuestoesMedias) Then
        Set numeroQuestoesMedias = mvarnumeroQuestoesMedias
    Else
        numeroQuestoesMedias = mvarnumeroQuestoesMedias
    End If
End Property



Public Property Let numeroQuestoesDificeis(ByVal vData As Variant)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.numeroQuestoesDificeis = 5
    mvarnumeroQuestoesDificeis = vData
End Property


Public Property Set numeroQuestoesDificeis(ByVal vData As Variant)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.numeroQuestoesDificeis = Form1
    Set mvarnumeroQuestoesDificeis = vData
End Property


Public Property Get numeroQuestoesDificeis() As Variant
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.numeroQuestoesDificeis
    If IsObject(mvarnumeroQuestoesDificeis) Then
        Set numeroQuestoesDificeis = mvarnumeroQuestoesDificeis
    Else
        numeroQuestoesDificeis = mvarnumeroQuestoesDificeis
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



