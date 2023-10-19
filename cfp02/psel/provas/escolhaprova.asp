<%
  if session("logado") <> "SIM" then
    Response.Redirect("../candidato/logincandidato.asp")    
  end if
%>
<html>

<head>
  <title>
    <%
      Response.Write "Escolha de Prova - " & session("nome_candidato")
    %>
  </title>
</head>

<!-- #include file="header.asp" -->
  <h4><font face="Arial">
  <p align="center">
    <%
      Response.Write session("nome_candidato") & ", escolha uma das provas abaixo:"
    %>
  </p></font></h4>
  <form method="GET" action="montaprova.asp" name="form">
    <p align="center"><font face="Arial">Prova: </font>
    <select size="1" name="prova">
    <%
      dim acesso
      dim sql
      dim provas
      dim primeiro
      dim provaini
      dim codprova
      set acesso = createObject("ProcessoSeletivo.Acesso")
      acesso.setSQL("select cod_conf_prova from nota_prova where cod_candidato = "& session("cod_candidato") & " and hora_fim is null and hora_inicio is not null")
      set provaini = acesso.openSQL
      codprova = 0
      if not provaini.eof then
        codprova = provaini.Fields("cod_conf_prova")
      end if
      sql = "select cp.descricao, cp.cod_conf_prova from candidato c, exame_prova e, conf_prova cp where c.cod_candidato = "
      sql = sql & session("cod_candidato")
      sql = sql & " and c.cod_conf_exame = e.cod_conf_exame and cp.cod_conf_prova = e.cod_conf_prova and "
      sql = sql & "cp.cod_conf_prova not in (select n.cod_conf_prova  from nota_prova n where n.cod_candidato = c.cod_candidato and n.hora_fim is not null)"
      if session("cod_conf_prova") <> "" then
        sql = sql & " and cp.cod_conf_prova = " & session("cod_conf_prova")
      else 
        if codprova > 0 then
          sql = sql & " and cp.cod_conf_prova = " & codprova
        end if
      end if
      acesso.setSQL(sql)
      set provas = acesso.openSQL
      primeiro = 1
      do while not provas.eof
        if primeiro = 1 then     
          Response.Write "<option selected value="& provas.Fields("cod_conf_prova") & ">" & provas.Fields("descricao") & "</option>" 
        else
          Response.Write "<option value="& provas.Fields("cod_conf_prova") & ">" & provas.Fields("descricao") & "</option>" 
        end if
        primeiro = 0
        provas.MoveNext
      loop
    %>
  </select> <input type="submit" value=" OK " name="OK">
  </form>
  
  <!-- #include file="../footer.asp" -->
</body>

</html>












