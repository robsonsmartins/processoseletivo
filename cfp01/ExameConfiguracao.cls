VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ExameConfiguracao"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"ConfExame"
Option Base 0
Private codAvaliacao As String
Private codAreaConhecimento As String
Private nomeExame As String
Private mvar_dadosConfig As dadosConfigExame
Private mvar_dadosConProvas As dadosConfigProvas
Private mvar_dadosProvasDisc_muitos() As dadosProvasDisc
Dim conexao As Acesso
Dim conexao2 As Acesso
Dim contador As Integer
Private AUX_LOCAL As Auxiliar
Dim registros As adodb.Recordset
Implements ObjectControl

Private Sub Class_Initialize()
    
    Set conexao2 = CreateObject("ProcessoSeletivo.Acesso")
    Set conexao = CreateObject("ProcessoSeletivo.Acesso")
    Set mvar_dadosConfig = CreateObject("ProcessoSeletivo.dadosConfigExame")
    Set mvar_dadosConProvas = CreateObject("ProcessoSeletivo.dadosConfigProvas")
    Set AUX_LOCAL = CreateObject("ProcessoSeletivo.Auxiliar")

End Sub

Private Sub Class_Terminate()
 
    Set conexao2 = Nothing
    Set conexao = Nothing
     Set mvar_dadosConfig = Nothing
    Set mvar_dadosConProvas = Nothing
    Set AUX_LOCAL = Nothing

End Sub


Public Sub setCodAvaliacao(ByVal valor)

    codAvaliacao = valor

End Sub
Public Function getNomeExame() As String

    getNomeExame = nomeExame

End Function

Public Sub setNomeExame(ByVal valor)

    nomeExame = valor

End Sub
Public Function getCodAvaliacao() As String

    getCodAvaliacao = codAvaliacao

End Function

Public Sub setCodAreaConhecimento(ByVal valor)

    codAreaConhecimento = valor

End Sub
Public Function getCodAreaConhecimento() As String

    getCodAreaConhecimento = codAreaConhecimento

End Function

Private Sub ObjectControl_Activate()
    

 
End Sub

Private Function ObjectControl_CanBePooled() As Boolean
    
    ObjectControl_CanBePooled = False

End Function

Public Function getConfExame(ByVal cod_exame As String) As dadosConfigExame
    
    contador = 1
    
    ReDim mvar_dadosProvasDisc_muitos(20)

    Set mvar_dadosProvasDisc_muitos(contador) = CreateObject("ProcessoSeletivo.DadosProvasDisc")
       
    'Este metodo retorna a configuração completa do exame (todas as provas)
    Dim LOCALSQL As String
    Dim LOCALCONFPROVA As String
    Dim VAR_TEMP_MIN As String
    Dim VAR_TEMP_MAX As String
    Dim VAR_DESCRICAO As String
    Dim vardisc_disc As String
    Dim vardisc_qd As String
    Dim vardisc_qm As String
    Dim vardisc_qf As String
    Dim vardisc_peso As String
    Dim vardisc_disciplina_texto As String
        
    Set registros = New adodb.Recordset
    Set registros2 = New adodb.Recordset
    Set conexao2 = CreateObject("ProcessoSeletivo.Acesso")

    conexao.setSQL ("SELECT * FROM EXAME_PROVA WHERE COD_conf_exame= " & cod_exame)
    Set registros = conexao.openSQL
      
    LOCALSQL = "SELECT * FROM CONF_PROVA WHERE (("

    If Not (registros.EOF) Then

    Do While Not (registros.EOF)
           
           LOCALSQL = LOCALSQL & "CONF_PROVA.COD_CONF_PROVA =" & registros!cod_conf_prova

           registros.MoveNext
      
            If Not (registros.EOF) Then
                LOCALSQL = LOCALSQL & ") OR ("
            End If
        
    Loop

    LOCALSQL = LOCALSQL & ")) ORDER BY COD_CONF_PROVA"

    conexao.setSQL (LOCALSQL)
    Set registros = conexao.openSQL
    
    If Not (registros.EOF) Then
    
        Do While Not (registros.EOF)
        
            If LOCALCONFPROVA = "" Then
                 LOCALCONFPROVA = registros.Fields("COD_CONF_PROVA")
            End If
          
            If (LOCALCONFPROVA <> registros.Fields("COD_CONF_PROVA")) Then
                
                mvar_dadosConProvas.Add LOCALCONFPROVA, VAR_TEMP_MIN, VAR_TEMP_MAX, VAR_DESCRICAO, "", mvar_dadosProvasDisc_muitos(contador)
                LOCALCONFPROVA = registros.Fields("COD_CONF_PROVA")
                    
                    contador = contador + 1
                    Set mvar_dadosProvasDisc_muitos(contador) = CreateObject("ProcessoSeletivo.DadosProvasDisc")
        
            End If
                           
                           
              ' BLOCO PROVA_DISCIPLINA***************************
              conexao2.setSQL ("select * from prova_disc, disciplina where (cod_conf_prova = " & LOCALCONFPROVA & ")  and (prova_disc.cod_disciplina = disciplina.cod_disciplina)")
              Set registros2 = conexao2.openSQL
                
                Do While Not (registros2.EOF)
          
                    vardisc_disc = registros2.Fields("disciplina.COD_DISCIPLINA")
                    vardisc_qd = registros2.Fields("questoes_dificeis")
                    vardisc_qm = registros2.Fields("questoes_MEDIAS")
                    vardisc_qf = registros2.Fields("questoes_faceis")
                    vardisc_peso = registros2.Fields("peso")
                    vardisc_disciplina_texto = registros2.Fields("descricao")
            
                    mvar_dadosProvasDisc_muitos(contador).Add vardisc_disc, vardisc_qd, vardisc_qm, vardisc_qf, vardisc_peso, vardisc_disciplina_texto
                                          
                    registros2.MoveNext
                    
                Loop
                '*************************************************
                
            
            VAR_TEMP_MIN = registros.Fields("TEMPO_MIN")
            VAR_TEMP_MAX = registros.Fields("TEMPO_MAX")
            VAR_DESCRICAO = registros.Fields("DESCRICAO")
          
            registros.MoveNext
        
        Loop
                        
            mvar_dadosConProvas.Add LOCALCONFPROVA, VAR_TEMP_MIN, VAR_TEMP_MAX, VAR_DESCRICAO, "", mvar_dadosProvasDisc_muitos(contador)
                        
   End If
   
   End If

    conexao.setSQL ("SELECT * FROM CONF_EXAME, AREA WHERE (AREA.COD_AREA = CONF_EXAME.COD_AREA) AND COD_conf_exame= " & cod_exame)
    Set registros = conexao.openSQL
    
    If Not (registros.EOF) Then
 
        mvar_dadosConfig.ano = registros.Fields("ano")
        mvar_dadosConfig.semestre = registros.Fields("semestre")
        mvar_dadosConfig.descricao = registros.Fields("CONF_EXAME.descricao")
        mvar_dadosConfig.area = registros.Fields("AREA.COD_area")
        mvar_dadosConfig.area_texto = registros.Fields("AREA.DESCRICAO")
    End If

    Set mvar_dadosConfig.provas = mvar_dadosConProvas
       
    Set registros2 = Nothing
    Set registros = Nothing
    Set getConfExame = mvar_dadosConfig

  For g = contador To 1 Step -1
       Set mvar_dadosProvasDisc_muitos(g) = Nothing
  Next

End Function

Private Sub ObjectControl_Deactivate()



End Sub

Public Sub setNewConfExame(ByVal ano As String, ByVal semestre As String, ByVal descricao As String, ByVal cod_area As String)
    
        Dim templocal As adodb.Recordset
        
    Set conexao = CreateObject("ProcessoSeletivo.Acesso")
    
    conexao.setSQL ("INSERT INTO CONF_EXAME (ANO,SEMESTRE, DESCRICAO, COD_AREA) VALUES (" & ano & "," & semestre & ",'" & descricao & "'," & cod_area & ")")

    Set templocal = conexao.openSQL
    
    Set conexao = Nothing
    Set templocal = Nothing

End Sub
Public Sub setNewConfProva(ByVal tempo_min As String, ByVal tempo_max As String, ByVal descricao As String, ByVal cod_conf_exame)

'Inserir em 2 tabelas, CONF_PROVA e EXAME_PROVA
    
    Dim contador As Integer
    Dim templocal As adodb.Recordset
        
    
    contador = AUX_LOCAL.getSequencia

    Set conexao = CreateObject("ProcessoSeletivo.Acesso")
    
    conexao.setSQL ("INSERT INTO CONF_PROVA (cod_conf_prova, TEMPO_MIN,TEMPO_MAX, DESCRICAO) VALUES (" & contador & "," & tempo_min & "," & tempo_max & ",'" & descricao & "')")

    Set templocal = conexao.openSQL
    
    conexao.setSQL ("INSERT INTO EXAME_PROVA (COD_CONF_PROVA, COD_CONF_EXAME) VALUES (" & contador & "," & cod_conf_exame & ")")

    Set templocal = conexao.openSQL
    
    
    Set conexao = Nothing
    Set templocal = Nothing


End Sub
Public Sub setNewProvaDisc(ByVal cod_disciplina As String, ByVal qd As String, ByVal qm As String, ByVal qf As String, ByVal peso As String, ByVal cod_conf_prova As String)

    Dim templocal As adodb.Recordset

    Set conexao = CreateObject("ProcessoSeletivo.Acesso")
    
    conexao.setSQL ("INSERT INTO PROVA_DISC (COD_DISCIPLINA, QUESTOES_DIFICEIS, QUESTOES_MEDIAS, QUESTOES_FACEIS, PESO, COD_CONF_PROVA) VALUES (" & cod_disciplina & "," & qd & "," & qm & "," & qf & "," & peso & "," & cod_conf_prova & ")")

    Set templocal = conexao.openSQL

    Set conexao = Nothing
    Set templocal = Nothing

End Sub
Public Function delConfExame(ByVal cod_conf_exame As String) As Integer

    Dim templocal As adodb.Recordset

    Set conexao = CreateObject("ProcessoSeletivo.Acesso")
    conexao.setSQL ("DELETE FROM CONF_EXAME WHERE COD_CONF_EXAME =" & cod_conf_exame)
    Set templocal = conexao.openSQL
    
    conexao.setSQL ("DELETE FROM EXAME_PROVA WHERE COD_CONF_EXAME =" & cod_conf_exame)
    Set templocal = conexao.openSQL
    
    Set registros = Nothing
    Set templocal = Nothing

End Function
Public Function delConfProva(ByVal cod_conf_prova As String) As Integer

    Dim templocal As adodb.Recordset

    Set conexao = CreateObject("ProcessoSeletivo.Acesso")
    
    conexao.setSQL ("DELETE FROM CONF_PROVA WHERE COD_CONF_PROVA =" & cod_conf_prova)
    Set templocal = conexao.openSQL
    
    conexao.setSQL ("DELETE FROM EXAME_PROVA WHERE COD_CONF_PROVA =" & cod_conf_prova)
    Set templocal = conexao.openSQL
        
    Set registros = Nothing
    Set templocal = Nothing

End Function
Public Function delProvaDisc(ByVal cod_conf_prova As String, ByVal cod_disciplina As String) As Integer
    
    Dim templocal As adodb.Recordset
    
    Set conexao = CreateObject("ProcessoSeletivo.Acesso")
    
    conexao.setSQL ("DELETE FROM prova_disc WHERE (COD_CONF_PROVA =" & cod_conf_prova & ") and (cod_disciplina = " & cod_disciplina & ") ")
    
    Set templocal = conexao.openSQL
    
    Set registros = Nothing
    Set templocal = Nothing
        
End Function

