<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>
<html>
<!-- #include file="header.asp" -->
<font face=arial size=4 color="#003366"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cadastro de Recurso:</b>
<center>
<br>
<table border="0" width="80%">
  <tr>
    <td bgcolor="#003366" align="left">
      <font size="2" face="Arial"><b>Apagar</b></font>
    </td>
    <td bgcolor="#003366" align="left">
      <font size="2" face="Arial"><b>Descrição</b></font>
    </td>
    <td bgcolor="#003366" align="left">
      <font size="2" face="Arial"><b>Data</b></font>
    </td>
    <td bgcolor="#003366" align="left">
      <font size="2" face="Arial"><b>Hora</b></font>
    </td>
    <td bgcolor="#003366" align="left">
      <font size="2" face="Arial"><b>Total Vagas</b></font>
    </td>
  </tr>
<%
	dim recurso
	set objeto2 = createobject("ProcessoSeletivo.Acesso")
	objeto2.setSQL("select * from recurso order by descricao, data, hora")
	set recurso = objeto2.openSQL 
	do while not recurso.eof 
%>
  <tr><td align="left"> 
  <font size="2" face="Arial"> 
  <a href="delrecurso.asp?codrec=<%=recurso.Fields("cod_recurso")%>"><img border="0" src="../cadastros/figura/lixo.bmp" WIDTH="19" HEIGHT="16"></a>
  </font>
  </td><td> 
  <font size="2" face="Arial"> 
  <a style="color=blue; size=2;" href="cadastrorecurso.asp?codrec=<%=recurso.Fields("cod_recurso")%>"><%=recurso.Fields("descricao")%></a>
  </font>
  </td><td align="left"> 
  <font size="2" face="Arial"> 
  <%=recurso.Fields("data")%>
  </font>
  </td><td align="left"> 
  <font size="2" face="Arial"> 
  <%=recurso.Fields("hora")%>
  </font>
  </td><td align="left"> 
  <font size="2" face="Arial"> 
  <%=recurso.Fields("total")%>
  </font>
  </td></tr>
  <tr><td colspan=5 bgcolor=black></td></tr>
  <%        
      recurso.MoveNext
    loop
%>

</table>
<br>
<a style="color=blue;" href="cadastrorecurso.asp">Novo Recurso</a></center>
<!-- #include file="../footer.asp" -->
</body>

</html>
