VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ConfExame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"dadosConfProva"
Attribute VB_Ext_KEY = "Member0" ,"dadosConfProva"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable to hold collection
Private mCol As Collection

Public Function Add(numero_questoes_faceis As Variant, cod_conf_prova As Variant, cod_disciplina As Variant, numero_questoes_medias As Variant, numero_questoes_dificeis As Variant, peso_prova As Variant, tempo_min As Variant, tempo_max As Variant, Optional sKey As String) As dadosConfProva
    'create a new object
    Dim objNewMember As dadosConfProva
    Set objNewMember = New dadosConfProva


    'set the properties passed into the method
    If IsObject(numero_questoes_faceis) Then
        Set objNewMember.numero_questoes_faceis = numero_questoes_faceis
    Else
        objNewMember.numero_questoes_faceis = numero_questoes_faceis
    End If
    If IsObject(cod_conf_prova) Then
        Set objNewMember.cod_conf_prova = cod_conf_prova
    Else
        objNewMember.cod_conf_prova = cod_conf_prova
    End If
    If IsObject(cod_disciplina) Then
        Set objNewMember.cod_disciplina = cod_disciplina
    Else
        objNewMember.cod_disciplina = cod_disciplina
    End If
    If IsObject(numero_questoes_medias) Then
        Set objNewMember.numero_questoes_medias = numero_questoes_medias
    Else
        objNewMember.numero_questoes_medias = numero_questoes_medias
    End If
    If IsObject(numero_questoes_dificeis) Then
        Set objNewMember.numero_questoes_dificeis = numero_questoes_dificeis
    Else
        objNewMember.numero_questoes_dificeis = numero_questoes_dificeis
    End If
    If IsObject(peso_prova) Then
        Set objNewMember.peso_prova = peso_prova
    Else
        objNewMember.peso_prova = peso_prova
    End If
    If IsObject(tempo_min) Then
        Set objNewMember.tempo_min = tempo_min
    Else
        objNewMember.tempo_min = tempo_min
    End If
    If IsObject(tempo_max) Then
        Set objNewMember.tempo_max = tempo_max
    Else
        objNewMember.tempo_max = tempo_max
    End If
'    If Len(sKey) = 0 Then
        mCol.Add objNewMember
'    Else
 '       mCol.Add objNewMember, sKey
 '   End If


    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

Public Property Get Item(vntIndexKey As Variant) As dadosConfProva
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

