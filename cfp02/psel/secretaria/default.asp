<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>

<HTML>
<!-- #include file="header.asp" -->
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3 color=black>Seja bem vindo ao acesso da Secretaria.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Selecione a opção desejada:
<centeR>
<table border=0 width="50%">
<tr align=left><td><a style="color=blue; size=3;" href=listacandidato.asp><font face=arial size=3>Cadastro de CANDIDATOS</a><br></td></tr>
<tr align=left><td><a style="color=blue; size=3;" href="../exames/default.asp"><font face=arial size=3>Cadastro de EXAMES</a><br></td></tr>
<tr align=left><td><a style="color=blue; size=3;" href="../exames/escolhafimexame.asp"><font face=arial size=3>Finalização dos EXAMES</a><br></td></tr>
<tr align=left><td><a style="color=blue; size=3;" href="listarecurso.asp"><font face=arial size=3>Cadastro de RECURSOS</a><br></td></tr>
<tr align=left><td><a style="color=blue; size=3;" href=pesquisarps.asp><font face=arial size=3>Pesquisas e Relatorios Gerais</a><br></td></tr>
<P>&nbsp;</P>
</table>
<!-- #include file="../footer.asp" -->

</BODY>
</HTML>
