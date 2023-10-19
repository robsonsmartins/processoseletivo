VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "dadosProvasDisc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"dadosProvaDisc"
Attribute VB_Ext_KEY = "Member0" ,"dadosProvaDisc"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable to hold collection
Private mCol As Collection

Public Function Add(cod_disciplina As Variant, numeroQuestoesDificeis As Variant, numeroQuestoesMedias As Variant, numeroQuestoesFaceis As Variant, peso As Variant, disciplina_texto As Variant, Optional sKey As String) As dadosProvaDisc
    'create a new object
    Dim objNewMember As dadosProvaDisc
    Set objNewMember = New dadosProvaDisc


    'set the properties passed into the method
    If IsObject(disciplina_texto) Then
        Set objNewMember.disciplina_texto = disciplina_texto
    Else
        objNewMember.disciplina_texto = disciplina_texto
    End If
    If IsObject(cod_disciplina) Then
        Set objNewMember.cod_disciplina = cod_disciplina
    Else
        objNewMember.cod_disciplina = cod_disciplina
    End If
    If IsObject(numeroQuestoesDificeis) Then
        Set objNewMember.numeroQuestoesDificeis = numeroQuestoesDificeis
    Else
        objNewMember.numeroQuestoesDificeis = numeroQuestoesDificeis
    End If
    If IsObject(numeroQuestoesMedias) Then
        Set objNewMember.numeroQuestoesMedias = numeroQuestoesMedias
    Else
        objNewMember.numeroQuestoesMedias = numeroQuestoesMedias
    End If
    If IsObject(numeroQuestoesFaceis) Then
        Set objNewMember.numeroQuestoesFaceis = numeroQuestoesFaceis
    Else
        objNewMember.numeroQuestoesFaceis = numeroQuestoesFaceis
    End If
    If IsObject(peso) Then
        Set objNewMember.peso = peso
    Else
        objNewMember.peso = peso
    End If
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If


    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

Public Property Get Item(vntIndexKey As Variant) As dadosProvaDisc
Attribute Item.VB_UserMemId = 0
    'used when referencing an element in the collection
    'vntIndexKey contains either the Index or Key to the collection,
    'this is why it is declared as a Variant
    'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
  Set Item = mCol(vntIndexKey)
End Property



Public Property Get Count() As Long
    'used when retrieving the number of elements in the
    'collection. Syntax: Debug.Print x.Count
    Count = mCol.Count
End Property


Public Sub Remove(vntIndexKey As Variant)
    'used when removing an element from the collection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)


    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'this property allows you to enumerate
    'this collection with the For...Each syntax
    Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
    'creates the collection when this class is created
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    'destroys collection when this class is terminated
    Set mCol = Nothing
End Sub

