<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>

<html>


<!-- #include file="header.asp" -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3 bgcolor=#003366><b>Lista de Candidatos:</font>
<center><br>


<%
  dim acesso
  dim codexame
  dim ordem
  dim exame
  dim cand
  ordem = Request.QueryString("ordem")
  codexame = Request.QueryString("codexame")
  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("select * from conf_exame where cod_conf_exame = " & codexame)
  set exame = acesso.openSQL
  acesso.setSQL("select * from candidato where cod_conf_exame = " & codexame & " order by " & ordem)
  set cand = acesso.openSQL
%>

<div align="center">
  <center>
  <table border="0" cellpadding="3" cellspacing=2 width="90%" cellspacing="0">
    <tr>
      <td  colspan="6" bgcolor="#003366">
        <font size="2" face="Arial" color="#FFFFFF"><b>Exame: <%=exame.Fields("descricao") & " - " & exame.Fields("semestre") & "/" & exame.Fields("ano")%></b></font></td>
    </tr>
    <tr>
      <td   bgcolor="#000099" align="left"><b><font size="2" color="#FFFFFF" face="Arial">Inscrição</font></b></td>
      <td  bgcolor="#000099" align="left"><font size="2" face="Arial" color="#FFFFFF"><b>Nome</b></font></td>
      <td   bgcolor="#000099" align="left"><font size="2" face="Arial" color="#FFFFFF"><b>Endereço</b></font></td>
      <td  bgcolor="#000099" align="left"><font size="2" face="Arial" color="#FFFFFF"><b>Telefone</b></font></td>
      <td  bgcolor="#000099" align="left"><font size="2" face="Arial" color="#FFFFFF"><b>e-mail</b></font></td>
      <td  bgcolor="#000099" align="left"><font size="2" face="Arial" color="#FFFFFF"><b>RG</b></font></td>
    </tr>
    <%  
      do while not cand.eof %>
    <tr>
      <td   valign="top"><font size="3" color=black face="Arial"><%=cand.Fields("inscricao")%></font></td>
      <td  valign="top"><font size="3" color=black face="Arial"><%=cand.Fields("nome")%></font></td>
      <td  valign="top"><font size="3" color=black face="Arial"><%=cand.Fields("endereco") & ", " & cand.Fields("bairro") & " - " & cand.Fields("cidade") & " - " & cand.Fields("estado") & " - CEP:" & cand.Fields("cep") %></font></td>
      <td  valign="top"><font size="3" color=black face="Arial"><%=cand.Fields("telefone")%></font></td>
      <td  valign="top"><font size="3" color=black face="Arial"><%=cand.Fields("email")%></font></td>
      <td  valign="top"><font size="3" color=black face="Arial"><%=cand.Fields("rg")%></font></td>
    </tr>
    <Tr><td colspan=6 bgcolor=black></tD></tr>
    <% cand.MoveNext
       
     loop %>  
  </table>
  </center>
</div>
<br>
<a href="pesquisarps.asp"><font color="#000080">Voltar</font></a>

<!-- #include file="../footer.asp" -->


</body>

</html>
