<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>

<!-- #include file="header.asp"-->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3>Pesquisas e Relatórios gerais:</font>
<center><br>
<font face=arial size=3 color=black>
<br>
<table border="0" width="70%" >
<td align=left valign=middle>
<font size="2" face="Arial" color=#003366><b>Lista de Classificação</b></font>
</td>
<td  align=left valign=middle>
<form method="GET" action="relclassificacao.asp" name="frm1">
<%
  dim acesso
  dim exames
  dim cand
  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("select descricao, cod_conf_exame, semestre, ano from conf_exame order by descricao, ano, semestre")
  set exames = acesso.openSQL
  acesso.setSQL("select inscricao, cod_candidato from candidato order by inscricao")
  set cand = acesso.openSQL
  %>
  <p align="left"><font size="2" face="Arial" color=#003366><b>Exame: <select size="1" name="codexame">
    <% do while not exames.eof %>
    <option value="<%=exames.Fields("cod_conf_exame")%>"><%=exames.Fields("descricao") & " - " & exames.Fields("semestre") & "/" & exames.Fields("ano")%></option>
    <%  exames.MoveNext
      loop %>
  </select></font>&nbsp; <input type="submit" value="Ver Relatório" name="B1"></p>
</form>
</td>
</tr>
<tr><Td colspan=2 bgcolor=black></tD></tr>
<tr>
<td >
<b>
<font size="2" face="Arial" color=#003366>Lista de Candidatos</font></b>
</td>
<td  align=left valign=middle >
<form method="GET" name="frm2" action="relcandidato.asp">
  <p><font face="arial" color=#003366 size="2"><b>Exame: </font><font face=arial size=3 color=black><select size="1" name="codexame">
    <% exames.MoveFirst 
      do while not exames.eof %>
    <option value="<%=exames.Fields("cod_conf_exame")%>"><%=exames.Fields("descricao") & " - " & exames.Fields("semestre") & "/" & exames.Fields("ano")%></option>
    <%  exames.MoveNext
      loop %>
  </select><br></font><font size="2" color=#003366 face="Arial"><b>Ordem: <select size="1" name="ordem">
    <option value="inscricao">Inscrição</option>
    <option value="nome">Nome</option>
  </select></font><font face=arial size=3 color=black>&nbsp; <input type="submit" value="Ver Relatório" name="B1">
  </form>
</font>
</td>
</tr>
<tr><Td colspan=2 bgcolor=black></tD></tr>
<tr>
<td width="33%"  height="18">
<b><font size="2" face="Arial" color=#003366><b>Prova e Gabarito</font></b>
</td>
<td  align=left valign=middle>
<form method="GET" action="relprova.asp" name="frm3">
  <p><font size="2" face="Arial" color=#003366><b>Inscrição do Candidato: <select size="1" name="codcand">
    <% 
      do while not cand.eof %>
    <option value="<%=cand.Fields("cod_candidato")%>"><%=cand.Fields("inscricao")%></option>
    <%  cand.MoveNext
      loop %>

  </select></font><font face=arial size=3 color=black>&nbsp; <input type="submit" value="Ver Relatório" name="B1"></font></p>
</form>
</td>
</tr>
</table>
<br><br>
<!-- #include file="../footer.asp" -->

</html>
