<%

	dim verdadeiro
	

	if    session("logado") = "verdadeiro"= true then
	
		  response.redirect("principal.htm")

	else 
 
    	response.redirect("login_.htm")
	   session("logado") = "falso"
	end if

%>
	
<html>
<head>
<title>P�gina</title>
</head>
<body>
<p>&nbsp;</p>
<p>
<center><font face="Arial" size="7" color="#990033">P�gina Principal</font>
<font face="Arial" size="7" color="#990033">Seja Bem Vindo ao Processo Seletivo do Batista.</font>&nbsp;</center>

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
