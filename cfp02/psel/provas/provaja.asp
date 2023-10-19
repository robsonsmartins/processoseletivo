<%
  if session("logado") <> "SIM" then
    Response.Redirect("../candidato/logincandidato.asp")    
  end if
%>
<html>

<head>
  <title>
    <%
      Response.Write "Prova já realizada hoje - " & session("nome_candidato")
    %>
  </title>
</head>

<!-- #include file="header.asp" -->

  <h4><font face="Arial">
  <p align="center">
    <%
      Response.Write session("nome_candidato") & ", você já fez uma prova hoje, não pode fazer mais de uma prova por dia."
      session("logado") = "NAO"
    %>
  </p></font></h4>
  <p>
  <p align="center"><a href="../candidato/logincandidato.asp"><font color=blue face=arial size=2>Voltar à tela de Login</a></p>
<!--  #include file="../footer.asp" -->
</body>

</html>
