<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>

<html>
<!-- #include file="header.asp" -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3 bgcolor=#003366><b>Relatório de Classificação:</font>
<center><br>

<%
  dim acesso
  dim codexame
  dim exame
  dim cand
  dim cont
  codexame = Request.QueryString("codexame")
  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("select * from conf_exame where cod_conf_exame = " & codexame)
  set exame = acesso.openSQL
  acesso.setSQL("select * from candidato c, nota_exame n where c.cod_candidato = n.cod_candidato and n.cod_conf_exame = " & codexame & " order by n.nota_final desc")
  set cand = acesso.openSQL
%>
<div align="center">
  <table border="0" cellpadding="0" width="70%" cellspacing="0">
    <tr>
      <td width="100%" colspan="4" align=center bgcolor="#003366">
        <font size="3" face="Arial" color="white"><b>Exame: <%=exame.Fields("descricao") & " - " & exame.Fields("semestre") & "/" & exame.Fields("ano")%></b></font></td>
    </tr>
    <tr>
      <td width="9%" bgcolor="#000099"><b><font size="3" color="#FFFFFF" face="Arial">Pos.</font></b></td>
      <td width="40%" bgcolor="#000099"><font size="3" face="Arial" color="#FFFFFF"><b>Nome</b></font></td>
      <td width="30%" bgcolor="#000099"><font size="3" face="Arial" color="#FFFFFF"><b>Inscrição</b></font></td>
      <td width="21%" bgcolor="#000099"><font size="3" face="Arial" color="#FFFFFF"><b>Nota
        Final</b></font></td>
    </tr>
    <% cont = 1 
      do while not cand.eof %>
    <tr>
      <td ><font size="3" face="Arial" color=black><%=cont%></font></td>
      <td ><font size="3" face="Arial" color=black><%=cand.Fields("nome")%></font></td>
      <td ><font size="3" face="Arial" color=black><%=cand.Fields("inscricao")%></font></td>
      <td ><font size="3" face="Arial" color=black><%=cand.Fields("nota_final")%></font></td>
    </tr>
    <tr><td colspan=4 bgcolor=black></td></tr>
    <% cand.MoveNext
       cont = cont + 1
     loop %>  
  </table>

</div>
<br>
<a style="color=blue; size=2;" href="pesquisarps.asp">Voltar</a>
</center>
<!-- #include file="../footer.asp" -->
</body>

</html>


