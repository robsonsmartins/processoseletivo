<%
  if session("logado") <> "SIM" then
    Response.Redirect("../candidato/logincandidato.asp")    
  end if
%>
<html>

<head>
  <title>
    <%
      Response.Write "Prova: " & session("desc_prova") & " - " & session("nome_candidato")
    %>
  </title>
</head>

<!-- #include file="header.asp" -->
  <h4><font face="Arial">
  <p align="center">
    <%
      Response.Write session("nome_candidato") & ", sua prova foi finalizada com sucesso."
      session("logado") = "NAO"
    %>
  </p></font></h4>
  
  <!-- #include file="../footer.asp" -->
</body>

</html>




