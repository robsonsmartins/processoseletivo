
<%
	session("acesso") = "" 
	session("tipo_acesso") = "" 
%>

<HTML>
<!-- #include file="header.asp"  -->
<form method="post" action="loginusuario.asp" id=form1 name=form1>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=4 color=#003366><b>Login do sistema: </b></font><b><br>
<br>
<div align="center">

<center>
<table border="0" width="50%" bgcolor=#104376 cellspacing=5 >
  <tr>
    <td><font color=#c8cfc7 size=4>Usuário:&nbsp;&nbsp;</font></td>
    <td><input name="usr"></td>
  </tr>
  <tr>
	<td><font color=#c8cfc7 size=4>Senha:&nbsp;&nbsp;</font></td>
	<td><input type="password" name="pwd" ></td>
  </tr>
  <tr><td colspan=2 align=right>
      <input type="submit" value=" Efetuar o Login  " name="B1"></td>
  </tr>
</table></FORM><!-- #include file="../footer.asp"  --></center></center></div></b>
</BODY>

</html>
