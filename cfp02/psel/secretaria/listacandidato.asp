<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>

<html>

<!-- #include file="header.asp" -->
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3>Listagem de candidatos inscritos:</font>
<center><br>
<table border="0" width="80%">
  <tr bgcolor="#273F6F" color=#c8cfc7>
    <th  align=left >
      <font size="2" face="Arial"><b>Apagar</b></font>
    </th>
    <th  align=left >
      <font size="2" face="Arial" ><b>
      Agenda</b></font>
    </th>
    <th  align=left >
      <font size="2" face="Arial" ><b>
      Nome do Candidato</b></font>
    </th>
    <td  align=left>
      <font size="2" face="Arial" ><b>
      Código de Inscrição</b></font>
    </th>
    <td  align=left>
      <font size="2" face="Arial" ><b>
      Imprimir comprovante</b></font>
    </th>
  </tr>
<%
	dim candidato
	dim agenda
	set objeto2 = createobject("ProcessoSeletivo.Acesso")
	objeto2.setSQL("select * from candidato order by nome")
	set candidato = objeto2.openSQL 
	do while not candidato.eof 
%>
  <tr color=#c8cfc7><td align="left"> 
  <a style="color=blue; size=2;" href="delcandidato.asp?codcand=<%=candidato.Fields("cod_candidato")%>"><font color=red>Apagar!<!--<img border="0" src="../cadastros/figura/lixo.gif" WIDTH="19" HEIGHT="16">--></a>
  </td> 
  <td align="left"><font size="2" face="Arial"> 
  <% 
   objeto2.setSQL("select 0 as nada from agenda where cod_candidato= "& candidato.fields ("cod_candidato"))
   set agenda = objeto2.openSQL 
   if not agenda.eof then 
    response.write "<a style='color=blue; size=2;' href = agendacandidato.asp?codcand="&candidato.fields("cod_candidato")&">" & "Agendado</a>" 
  else 
    response.write "<a style='color=blue; size=2;' href = agendacandidato.asp?codcand="&candidato.fields("cod_candidato")&">" & "Não Agendado</a>" 
  end if
  %>
  </font>
  </td><td align="left"> 
  <font size="2" face="Arial">
  <% 
     Response.Write "<a style='color=blue; size=2;' href = cadastrocandidato.asp?codcand="&candidato.fields("cod_candidato")&">" & candidato.Fields("nome") & "</a><br>"
  %> 
  </font>
  </td>
  <td ><font size="2" face="Arial" color=black><%=candidato.fields("inscricao")%></td>
  <td ><font size="2" face="Arial"><a style="color=blue;" href="javascript:abrerecibo('<%="recibo.asp?codigo=" & candidato.fields("inscricao")%>');">Comprovante!</a></td>
  
  </tr>
  
  <tR><td colspan=5 bgcolor=#273F6F> </tD></tr>
  <%        
      candidato.MoveNext
    loop
%>

</table>
<br>
<a style="color=blue; size=3;" href="cadastrocandidato.asp"><b>Cadastrar novo candidato </a>
</center>
<script language="JavaScript">
function abrerecibo(var_x) {

		window.open(var_x,"Comprovante","alwaysRaised=true,dependent=no,directories=no,fullscreen=no,hotkeys=no,location=no,menubar=no,scrollbars=no,status=no,toolbar=no, width=550, height=500",true)	

}
</script>

<!-- #include file="../footer.asp" -->
</body>

</html>
