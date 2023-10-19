<%

	session("tipo_login") = "adm"

if NOT((session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if

	session("link") = ""

%>

<html>

<head>

</head>

<!-- #include file="header.asp" -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3>Cadastros gerais do sistema:</font><br><br>
<centeR>
<table border=0 width=80%>

<tr><td align=left valign=top>
	<form method="POST" action="area.asp"> 
	<input type="submit" value="      Área     " name="area"> </TD><TD><font size=3>Cadastra Áreas de Ensino da Faculdade
	</form>
</td></tr>
<tr><td align=left valign=top>
	<form method="POST" action="disciplina.asp"> 
	<input type="submit" value="Disciplina" name="disciplina"></TD><TD><font size=3>Cadastra as disciplinas envolvidas com os proocessos seletivos existentes para todas a Faculdade
	</form>
</td></tr>
<!--
<tr><td align=left valign=top>		
	<form method="POST" action="divisao.asp">
	<input type="submit" value="  Divisao  " name="divisao"></TD><TD><font size=3>Cadastra Tópicos a serem associados com as disciplina de Ensino da Faculdade
	</form>
</td></tr>
<tr><td align=left valign=top>		
	<form method="POST" action="usuario.asp" id=form1 name=form1>
	<input type="submit" value="  Usuário  " name="usuario"></TD><TD><font size=3>Cadastra usuários a serem autorizados a acessar o sistema
	</form>
</TD></TR>
-->
<tr><td align=left valign=top>		
	<form method="POST" action="grupo.asp">
	<input type="submit" value="  Grupos  " name="grupos"></TD><TD><font size=3>Cadastra os grupos, as permissões e faz a associação com os usuários
	</form>
</TD></TR>
</table><br>

</center>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3>Links diversos para acompanhamento:</font><br><br>
<center>
<table border=0 width=80%>

<tr><td align=left valign=top>
	<a style="color=red; size=3;" href="../questoes/disciplinas.asp?origem=adm"><font face=arial color= blue size=3>Cadastro de Questões</a>
</td></tr>
<tr><td align=left valign=top>
	<a style="color=red; size=3;" href="../exames/default.asp?origem=adm"><font face=arial color= blue size=3>Cadastro de Exames</a>
</td></tr>
<tr><td align=left valign=top>
	<a style="color=red; size=3;" href="../exames/escolhafimexame.asp?origem=adm"><font face=arial color= blue size=3>Finalização de Exames</a>
</td></tr>

<tr><td align=left valign=top>
	<a style="color=red; size=3;" href="../secretaria/listacandidato.asp?origem=adm"><font face=arial color= blue size=3>Cadastro de Candidatos</a>
</td></tr>
<tr><td align=left valign=top>
	<a style="color=red; size=3;" href="../secretaria/listarecurso.asp?origem=adm"><font face=arial color= blue size=3>Cadastro de Recursos</a>
</td></tr>
<tr><td align=left valign=top>
	<a style="color=red; size=3;" href="../secretaria/pesquisarps.asp?origem=adm"><font face=arial color= blue size=3>Relatórios Diversos</a>
</td></tr>

</table><br>
<!-- #include file="../footer.asp" -->
</body>

</html>
