VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "dadosConfigProvas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"dadosConfigProva"
Attribute VB_Ext_KEY = "Member0" ,"dadosConfigProva"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable to hold collection
Private mCol As Collection

Public Function Add(cod_conf_prova As Variant, tempoMin As Variant, tempoMax As Variant, descricao As Variant, provas As Variant, disciplinas As dadosProvasDisc, Optional sKey As String) As dadosConfigProva
    'create a new object
    Dim objNewMember As dadosConfigProva
    Set objNewMember = New dadosConfigProva


    'set the properties passed into the method
    If IsObject(cod_conf_prova) Then
        Set objNewMember.cod_conf_prova = cod_conf_prova
    Else
        objNewMember.cod_conf_prova = cod_conf_prova
    End If
    
    If IsObject(tempoMin) Then
        Set objNewMember.tempoMin = tempoMin
    Else
        objNewMember.tempoMin = tempoMin
    End If
    If IsObject(tempoMax) Then
        Set objNewMember.tempoMax = tempoMax
    Else
        objNewMember.tempoMax = tempoMax
    End If
    If IsObject(descricao) Then
        Set objNewMember.descricao = descricao
    Else
        objNewMember.descricao = descricao
    End If
    If IsObject(provas) Then
        Set objNewMember.provas = provas
    Else
        objNewMember.provas = provas
    End If
    'If IsObject(disciplinas) Then
        Set objNewMember.disciplinas = disciplinas
    'Else
    '    objNewMember.disciplinas = disciplinas
    'End If
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If


    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

Public Property Get Item(vntIndexKey As Variant) As dadosConfigProva
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

