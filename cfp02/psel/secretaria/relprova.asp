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
  dim codcand
  dim exame
  dim cand
  dim prova
  codcand = Request.QueryString("codcand")
  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("select cod_conf_exame, nome, inscricao from candidato where cod_candidato = " & codcand)
  set cand = acesso.openSQL
  codexame = cand.Fields("cod_conf_exame")
  acesso.setSQL("select * from conf_exame where cod_conf_exame = " & codexame)
  set exame = acesso.openSQL
  acesso.setSQL("select cp.descricao as prova, p.resposta, q.* from questao q, prova p, conf_prova cp where p.cod_conf_prova = cp.cod_conf_prova and q.cod_questao = p.cod_questao and p.cod_candidato = " & codcand & "  order by p.cod_conf_prova")
  set prova = acesso.openSQL
%>
<div align="center">
  <table border="0" cellpadding="2" cellspacing=2 width="90%" cellspacing="0">
    <tr>
      <td width="100%" colspan="5" bgcolor="#003366">
        <font size="3" face="Arial" color="#FFFFFF"><b>Exame: <%=exame.Fields("descricao") & " - " & exame.Fields("semestre") & "/" & exame.Fields("ano")%></b></font></td>
    </tr>
    <tr>
      <td width="100%" colspan="5" bgcolor="#003366">
        <font size="2" face="Arial" color="#FFFFFF"><b>Candidato: <%=cand.Fields("inscricao") & " - " & cand.Fields("nome")%></b></font></td>
    </tr>
    <tr>
      <td align="left"><b><font size="2" color="#FFFFFF" face="Arial">Prova</font></b></td>
      <td align="left"><font size="2" face="Arial" color="#FFFFFF"><b>Enunciado</b></font></td>
      <td align="left"><font size="2" face="Arial" color="#FFFFFF"><b>Alternativas</b></font></td>
      <td align="left"><font size="2" face="Arial" color="#FFFFFF"><b>Resp. Cand.</b></font></td>
      <td align="left"><font size="2" face="Arial" color="#FFFFFF"><b>Gabarito</b></font></td>
    </tr>
    <tR><td colspan=5 bgcolor=black></tD></tr>
    <% 
    
      do while not prova.eof %>
    <tr color=black>
      <td color="black">
        <p align="left"><font face="Arial" color=black size="1"><%=prova.Fields("prova")%></font></td>
      <td color="black"><font face="Arial" color=black size="1"><%=prova.Fields("enunciado")%></font></td>
      <td color="black"><font face="Arial" color=black size="1">
        Alternativa A: <%=prova.Fields("alternativa_a")%><br>
        Alternativa B: <%=prova.Fields("alternativa_b")%><br>
        Alternativa C: <%=prova.Fields("alternativa_c")%><br>
        Alternativa D: <%=prova.Fields("alternativa_d")%><br>
        Alternativa E: <%=prova.Fields("alternativa_e")%><br>
        </font></td>
      <td color="black">
        <p align="left"><font color=black face="Arial" size="1"><%=prova.Fields("resposta")%>&nbsp;</font></td>
      <td color="black">
        <p align="left"><font color=black face="Arial" size="1"><%=prova.Fields("gabarito")%></font></td>
    </tr>
    <tR><td colspan=5 bgcolor=black></tD></tr>
    <% prova.MoveNext
     loop %>  
  </table>

</div>
<br>
<a style="color=blue; size=2;" href="pesquisarps.asp">Voltar</a>
<!-- #include file="../footer.asp" -->

</html>


