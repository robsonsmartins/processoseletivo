<head>
<style type="text/css"><!--
table {font-size: 10.7px; color: gray; font-family: Arial, Helvetica, sans-serif; text-decoration: none; }
soldig {font-size: 10.7px; color: gray; font-family: Arial, Helvetica, sans-serif; text-decoration: none; }
texto { color:#003366; font-size=24; font-family: Arial; } 
  a:link { color: white; text-decoration: none; } 
a:hover {  color: yellow; bgcolor=yellow; text-decoration: none;} 
   a:visited { color: white; text-decoration: none; }
-->
<%
	if Request.QueryString("link") <> "" then
		SESSION("LINK") = Request.QueryString("LINK")
	end if
%>
</style>
</head>
<body bgcolor=#c8cfc7 leftmargin=0 rightmargin=0 topmargin=0 marginheight=0 marginwidth=0>

<table bgcolor="#003366" border=0 BACKGROUND="../images/BGTOP.bmp" text="#FFFFFF" width=100% height=80 cellspacing=0 cellpadding=0>
<tr valign=top>
		<td align=left>
						<table border=0 cellspacing=20>
							<tr><td><FONT color=#c8cfc7 face=Arial size=4>Processo Seletivo - <i>Administrador</i></FONT></td></tr>
						</table>
		</td>
		<td valign=top align=right><img src="../images/batista_logo2.bmp"></tD>
</tr>
</table>
<table border=0 width=100% cellspacing=0 cellpadding=0>
<tr><td bgcolor="#273f6f" align=right>
<%  if (session("link") <> "" ) then %>
		<A href="<%=session("link")%>">VOLTAR</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%	end if %>
<a href="adm.asp">MENU ADMINISTRADOR</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../login/login.asp">LOGIN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.close()">SAIR DO SISTEMA</a></td></tr>
<tr><td><img src="../images/degrade2.bmp" width=100% height=10></td></tr>
<tr><td align=right><font color=gray>(C)2002 Faculdade Batista Grupo PSEL - 6o semestre</font></td></tr>
</table>