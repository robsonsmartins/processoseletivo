VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Prova"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"dadosQuestao"
Attribute VB_Ext_KEY = "Member0" ,"dadosQuestao"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable to hold collection
Private mCol As Collection

Public Function Add(enunciado As Variant, cod_questao As Variant, alternativa_a As Variant, alternativa_b As Variant, alternativa_c As Variant, alternativa_d As Variant, alternativa_e As Variant, gabarito As Variant, figura As Variant, flag_sorteiopassado As Variant, dificuldade As Variant, cod_divisao As Variant, cod_topico As Variant, cod_item As Variant, cod_usuario As Variant, cod_disciplina As Variant, Optional resposta As Variant, Optional sKey As String) As dadosQuestao
    'create a new object
    Dim objNewMember As dadosQuestao
    Set objNewMember = New dadosQuestao


    'set the properties passed into the method
    If IsObject(enunciado) Then
        Set objNewMember.enunciado = enunciado
    Else
        objNewMember.enunciado = enunciado
    End If
    If IsObject(cod_questao) Then
        Set objNewMember.cod_questao = cod_questao
    Else
        objNewMember.cod_questao = cod_questao
    End If
    If IsObject(alternativa_a) Then
        Set objNewMember.alternativa_a = alternativa_a
    Else
        objNewMember.alternativa_a = alternativa_a
    End If
    If IsObject(alternativa_b) Then
        Set objNewMember.alternativa_b = alternativa_b
    Else
        objNewMember.alternativa_b = alternativa_b
    End If
    If IsObject(alternativa_c) Then
        Set objNewMember.alternativa_c = alternativa_c
    Else
        objNewMember.alternativa_c = alternativa_c
    End If
    If IsObject(alternativa_d) Then
        Set objNewMember.alternativa_d = alternativa_d
    Else
        objNewMember.alternativa_d = alternativa_d
    End If
    If IsObject(alternativa_e) Then
        Set objNewMember.alternativa_e = alternativa_e
    Else
        objNewMember.alternativa_e = alternativa_e
    End If
    If IsObject(gabarito) Then
        Set objNewMember.gabarito = gabarito
    Else
        objNewMember.gabarito = gabarito
    End If
    If IsObject(figura) Then
        Set objNewMember.figura = figura
    Else
        objNewMember.figura = figura
    End If
    If IsObject(flag_sorteiopassado) Then
        Set objNewMember.flag_sorteiopassado = flag_sorteiopassado
    Else
        objNewMember.flag_sorteiopassado = flag_sorteiopasado
    End If
    If IsObject(dificuldade) Then
        Set objNewMember.dificuldade = dificuldade
    Else
        objNewMember.dificuldade = dificuldade
    End If
    If IsObject(cod_divisao) Then
        Set objNewMember.cod_divisao = cod_divisao
    Else
        objNewMember.cod_divisao = cod_divisao
    End If
    If IsObject(cod_topico) Then
        Set objNewMember.cod_topico = cod_topico
    Else
        objNewMember.cod_topico = cod_topico
    End If
    If IsObject(cod_item) Then
        Set objNewMember.cod_item = cod_item
    Else
        objNewMember.cod_item = cod_item
    End If
    If IsObject(cod_usuario) Then
        Set objNewMember.cod_usuario = cod_usuario
    Else
        objNewMember.cod_usuario = cod_usuario
    End If
    If IsObject(cod_disciplina) Then
        Set objNewMember.cod_disciplina = cod_disciplina
    Else
        objNewMember.cod_disciplina = cod_disciplina
    End If
    If IsObject(resposta) Then
        Set objNewMember.resposta = resposta
    Else
        objNewMember.resposta = resposta
    End If
'    If Len(sKey) = 0 Then
        mCol.Add objNewMember
 '   Else
  '      mCol.Add objNewMember, sKey
   ' End If


    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

Public Property Get Item(vntIndexKey As Variant) As dadosQuestao
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

