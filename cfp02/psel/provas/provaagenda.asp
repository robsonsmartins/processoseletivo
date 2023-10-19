<%
  if session("logado") <> "SIM" then
    Response.Redirect("../candidato/logincandidato.asp")    
  end if
%>
<html>

<head>
  <title>
    <%
      Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & "Prova não agendada - " & session("nome_candidato")
    %>
  </title>
</head>

<!-- #include file="header.asp" -->
  <h4><font face="Arial">
  <p align="center">
    <%
     Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & session("nome_candidato") & ", você não está agendado para este instante.<P>"
     session("logado") = "NAO"
    %>
  </p></h4></font>
  <font face="Arial">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Data/Hora atual: <b><%=now%></b> <p>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sua agenda de provas: <p>
  <div align="center">
    <center>
    <table border="0" width="50%" cellpadding="0">
    <%
     dim acesso
     dim agenda     
     set acesso = createObject("ProcessoSeletivo.Acesso")
     acesso.setSQL("select r.descricao, r.hora, r.data from recurso r, agenda a where a.cod_recurso = r.cod_recurso and a.cod_candidato = "&session("cod_candidato"))
     set agenda = acesso.openSQL
     do until agenda.eof %>
       <tr><td width="25%"><font face=arial size=3><b>
     <%Response.Write agenda.Fields("data") %>
       </td><td width="25%"><font face=arial size=3><b>
     <%Response.Write agenda.Fields("hora") %>
       </td><td width="50%"><font face=arial size=3><b>
     <%Response.Write agenda.Fields("descricao") %>
       </td></tr>
     <%
       agenda.MoveNext
     loop
    %>
    </table>
    </center>
  </div>
  </font>
  <p align="center"><a href="../candidato/logincandidato.asp"><font color=blue size=2>Voltar à tela de Login</a></p>

<!-- #include file="../footer.asp" -->
</body>

</html>
