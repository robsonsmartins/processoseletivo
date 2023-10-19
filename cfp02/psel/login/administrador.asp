<%
   
    dim acesso
    
    acesso = session("acesso")
      
      if acesso = "P" then
      response.redirect("professor.htm")
      End if
      
      if acesso = "S" then
      response.redirect("secretaria.htm")
      End if

      if acesso = "A" then
      response.redirect("administrador.htm")
      End if
      
      if acesso = "D" then
      response.redirect("diretor.htm")
      End if
      
      if acesso = "" then
      response.redirect("login_.htm")
      End if
      

      
      
%>




<html>
<head>
<title>Página</title>
</head>
<body>
<p>&nbsp;</p>
<p><center><font face="Arial" size="7" color="#990033">ADMINISTRADOR</font>&nbsp;</center>

</p>
<p>
<center>
<font face="Arial" color="#990033" size="6">Entre</font></center>

</p>
<p>
<center>&nbsp;
<font face="Arial" color="#990033" size="1">(Clique Aqui)</font></center>

</p>

</body>
</html>
