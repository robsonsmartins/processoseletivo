<%
  if session("logado") <> "SIM" then
    Response.Redirect("../candidato/logincandidato.asp")    
  end if
%>
<script language="JavaScript">
  function ProximaClique() {
    formprova.operacao.value = "PROXIMA";
    formprova.submit();
  }

  function AnteriorClique() {
    formprova.operacao.value = "ANTERIOR";
    formprova.submit();
  }

  function QuestaoClique() {
    formprova.operacao.value = "QUESTAO";
    formprova.submit();
  }

  function NRespClique() {
    if (formprova.nresp.value != "-1") { 
      formprova.operacao.value = "NRESP";
      formprova.submit();
    }
  }
  
  function DisciplinaClique() {
    formprova.operacao.value = "DISCIPLINA";
    formprova.submit();
  }

  function FinalClique() {
    formprova.operacao.value = "FINALIZAR";
    formprova.submit();
  }
</script>

<html>
<head>
  <title>
    <%
      Response.Write "Prova: " & session("desc_prova") & " - " & session("nome_candidato")
    %>
  </title>
</head>

<!-- #include file="header.asp" -->

<p align="center"><font face="Arial" size="2"><b>Prova: <%=session("desc_prova")%></b></font></p>

<form method="GET" action="operacao.asp" name="formprova">
<CENTER>
  <table border="1" width="90%" cellspacing="0" cellpadding="2">
    <tr>
      <td width="100%" valign="middle" align="center" bgcolor="#CCCCFF" bordercolor="#000080" colspan="2"><b><font face="Arial" size="2">Disciplina:
        <select size="1" name="disciplina" OnChange="DisciplinaClique()">
          <%
            dim acesso
            dim disc
            dim coddisc
            dim sql
            dim selq
            dim prova
            set prova = session("prova")
            selq = session("questao")
            set acesso = createObject("ProcessoSeletivo.Acesso")
            sql = "select d.descricao, d.cod_disciplina from disciplina d, prova_disc p where d.cod_disciplina = p.cod_disciplina and p.cod_conf_prova = "
            sql = sql & session("cod_conf_prova")
            acesso.setSQL(sql)
            set disc = acesso.OpenSQL
            do while not disc.eof
              if cint(prova(selq).cod_disciplina) = cint(disc.Fields("cod_disciplina")) then           
                Response.Write "<option selected value=" & disc.Fields("cod_disciplina") & ">" & disc.Fields("descricao") & "</option>" 
              else
                Response.Write "<option value=" & disc.Fields("cod_disciplina") & ">" & disc.Fields("descricao") & "</option>" 
              end if
              disc.MoveNext
            loop
          %>       
        </select> Questão: <select size="1" name="questao" OnChange="QuestaoClique()">
          <%       
            dim qtdq
            dim i
            qtdq = prova.count
            for i = 1 to qtdq
              if i = selq then
                Response.Write "<option selected value=" & cstr(i) & ">" & cstr(i) & "</option>"
              else
                Response.Write "<option value=" & cstr(i) & ">" & cstr(i) & "</option>"
              end if
            next
          %>
        </select> 
        <input type="hidden" name="operacao">
        <input type="button" value="&lt;&lt; Anterior " name="B1" onClick="AnteriorClique()"> 
        <input type="button" value=" Próxima &gt;&gt;" name="B2" onClick="ProximaClique()" >
        Não Respondidas: 
        <select size="1" name="nresp" OnChange="NRespClique()">
          <option selected value="-1">Ir Para</option> 
          <%
            dim acesso2
            dim resposta
            dim respq
            set acesso2 = createObject("ProcessoSeletivo.Acesso")
            for i = 1 to qtdq
              acesso2.setSQL("select resposta from prova where cod_questao = " & prova(i).cod_questao & " and cod_conf_prova = "& session("cod_conf_prova") & " and cod_candidato = " & session("cod_candidato"))  
              set respq = acesso2.openSQL
              if respq.Fields("resposta") = " " then
                Response.Write "<option value=" & i & ">" & i & "</option>"
              end if
              if selq = i then
                resposta = respq.Fields("resposta")
              end if
            next
          %>
        </select> </font></b></td>
    </tr>
    <tr>
      <td width="100%" bgcolor="#FFFFCC" bordercolor="#FFFF00" colspan="2">
      <%=prova(selq).enunciado%>
      </td>
    </tr>
    <tr>
      <td width="100%" bgcolor="#FFFFCC" bordercolor="#FFFF00" colspan="2">
      <%
        if prova(selq).figura <> "" then      
          Response.Write "<img border=0 src=" & chr(34) & "../cadastros/figuras/" & prova(selq).figura & chr(34) & ">"
        end if
      %>
      <br>
      </td>
    </tr>
    <tr>
      <td width="100%" bgcolor="#CCFFCC" bordercolor="#008000" colspan="2">
        <p><font face="Arial" size="2">
        <input type="radio" value="A" name="alternativas" <%if resposta = "A" then Response.Write "checked"%>>
        <b>A - </b><%=prova(selq).alternativa_a%></font></p>
        <p><font face="Arial" size="2">
        <input type="radio" value="B" name="alternativas" <%if resposta = "B" then Response.Write "checked"%>>
        <b>B - </b><%=prova(selq).alternativa_b%></font></p>
        <p><font face="Arial" size="2">
        <input type="radio" value="C" name="alternativas" <%if resposta = "C" then Response.Write "checked"%>>
        <b>C - </b><%=prova(selq).alternativa_c%></font></p>
        <p><font face="Arial" size="2">
        <input type="radio" value="D" name="alternativas" <%if resposta = "D" then Response.Write "checked"%>>
        <b>D - </b><%=prova(selq).alternativa_d%></font></p>
        <p><font face="Arial" size="2">
        <input type="radio" value="E" name="alternativas" <%if resposta = "E" then Response.Write "checked"%>>
        <b>E - </b><%=prova(selq).alternativa_e%></font></p>
      </td>
    </tr>
    <tr>
      <td width="32%" bgcolor="#CCCCFF" bordercolor="#000080" bordercolorlight="#000080" bordercolordark="#000080">
        <p align="center"><b><font face="Arial" size="2">
        <%
          if cdate(cdate(time) - cdate(session("hora_inicio"))) >= cdate(session("tempo_min")) then       
            Response.Write "<input type="&chr(34)&"button"&chr(34)&" value="&chr(34)&" Finalizar Prova "&chr(34)&" name="&chr(34)&"B3"&chr(34)&" onClick="&chr(34)&"FinalClique()"&chr(34)&">" 
          end if
        %>
        <br>
        </font></b></p>
      </td>
      <td width="68%" bgcolor="#CCCCFF" bordercolor="#000080" bordercolorlight="#000080" bordercolordark="#000080">
        <font face="Arial" size="2">
        <p align="right">
        <% 
          dim inicio       
          dim fimmin
          dim fimmax
          dim falta
          inicio = cdate(session("hora_inicio"))
          fimmax = cdate(cdate(session("tempo_max")) + cdate(session("hora_inicio")))
          fimmin = cdate(cdate(session("tempo_min")) + cdate(session("hora_inicio")))
          falta = cdate(fimmax - time)
          if falta < cdate("00:15:00") then
            if falta < cdate("00:01:00") then
              Response.Write "<b><font color=red>Falta(m) "& mid(cstr(falta),len(cstr(falta)) - 1,2) & " segundo(s) para encerrar a prova! </font></b><br>"
            else
              Response.Write "<b><font color=red>Falta(m) "& mid(cstr(falta),len(cstr(falta)) - 4,2) & " minuto(s) para encerrar a prova! </font></b><br>"
            end if
          end if
          Response.Write "Início: " & inicio & " Término: " & fimmax & " Mínimo: " & fimmin
        %>
        </p>
        </font>
      </td>
    </tr>
  </table>
</form>
<!-- #include file="../footer.asp" -->
</body>

</html>
