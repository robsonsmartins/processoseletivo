<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>

<script Language="JavaScript">
  function submeter() {
    document.frm.submit()
  }
</script>

<html>

<head>
<title>Agenda de Candidato</title>
</head>

<!-- #include file="header.asp" -->

          <%
            dim acesso
            dim codcand
            dim erro
            dim cand
            codcand = cint(Request.QueryString("codcand"))
            erro = Request.QueryString("erro")
            set acesso = createObject("ProcessoSeletivo.Acesso")
            acesso.setSQL("select nome, inscricao, cod_conf_exame from candidato where cod_candidato = "&codcand)
            set cand = acesso.OpenSQL
          %>

<form method="GET" name="frm" action="operacaoagenda.asp">
  <div align="center">
    <table border="1" cellpadding="0" width="70%">
      <tr>
        <td width="19%" align="center" bgcolor="#000080">
          <p align="left"><b><font size="2" face="Arial" color="#FFFFFF">Candidato:</font></b></td>
        <td width="88%" align="center" bgcolor="#000080">
          <p align="left"><b><font size="2" face="Arial" color="#FFFF00">
          <%=cand.Fields("nome")%>
          </font></b></td>
      </tr>
      <tr>
        <td width="19%" align="center" bgcolor="#000080">
          <p align="left"><b><font size="2" face="Arial" color="#FFFFFF">Inscrição:</font></b></td>
        <td width="88%" align="center" bgcolor="#000080">
          <p align="left"><b><font size="2" face="Arial" color="#FFFF00">
          <%=cand.Fields("inscricao")%>
          </font></b></td>
      </tr>
      
      <%
        dim provas
        dim i, j
        dim descr
        dim vagas
        dim agenda
        dim recurso
        dim temagenda
        dim temrecurso
        dim arrayagenda()
        dim achouagenda
        dim qtd
        acesso.setSQL("select count(cod_conf_exame) as qtdprova from exame_prova where cod_conf_exame = "&cand.Fields("cod_conf_exame"))
        set provas = acesso.openSQL
        acesso.setSQL("select cod_recurso from agenda where cod_candidato = "&codcand)
        set agenda = acesso.openSQL
        redim arrayagenda(0)
        temagenda = not agenda.eof
        do while not agenda.eof
          redim preserve arrayagenda(UBound(arrayagenda) + 1)
          arrayagenda(UBound(arrayagenda)) = cint(agenda.Fields("cod_recurso"))
          agenda.MoveNext
        loop
        acesso.setSQL("select *, (total - alocados) as vagas from recurso order by data, hora")
        set recurso = acesso.openSQL
        temrecurso = not recurso.eof
        qtd = 0
        for i = 1 to cint(provas.Fields("qtdprova"))
          qtd = qtd + 1
      %>
      <tr>
        <td width="19%" align="center" bgcolor="#000080">
          <p align="left"><b><font size="2" face="Arial" color="#FFFFFF">Data/Hora/Local:&nbsp;&nbsp;</font></b></td>
        <td width="7%" align="center" bgcolor="#CCFFFF">
          <p align="left"><select size="1" name="DataHora<%=cstr(i)%>">
          <option value="0">Selecione...</option>
          <%
            if temrecurso then
              recurso.MoveFirst
              achouagenda = 0
              do while not recurso.eof
          %>
          <option 
            <%
              if temagenda then
                for j = 1 to UBound(arrayagenda)
                  if (achouagenda = 0) and (arrayagenda(j) = cint(recurso.Fields("cod_recurso"))) then
                    arrayagenda(j) = 0
                    achouagenda = 1
                    Response.Write "selected" 
                  end if
                next
              end if
            %>
            value="<%=recurso.Fields("cod_recurso")%>">
            <%=recurso.Fields("data")&" "&recurso.Fields("hora")&" / Vagas: "&recurso.Fields("vagas")&" / Descrição: "&recurso.Fields("descricao")%>
          </option>
          <% 
                recurso.MoveNext
              loop
            end if
          %>
          </select></td>
      </tr>
      <%
        next
      %>
      <center>
      <tr>
        <td width="100%" align="center" bgcolor="#CCFFFF" colspan="2"><input type="hidden" name="qtd" value="<%=qtd%>"><input type="hidden" name="codcand" value="<%=codcand%>"><font size="2" face="Arial"><b><a style="color=blue;" href="JavaScript:submeter()">Gravar</a>&nbsp;&nbsp;
          <a style="color=blue;" href="listacandidato.asp">Cancelar</a></b></font></td>
      </tr>
      <% if erro = "1" then
           Response.Write "<tr><td width=100% align=center bgcolor=#CCFFFF colspan=2><font size=2 face=Arial color=red><b>Escolha Data/Hora/Local para a(s) prova(s) - diferentes para cada prova</b></font></td></tr>"
         end if %>
      </table>
    </center>
  </div>
</form>
<!-- #include file="../footer.asp" -->

</body>

</html>
