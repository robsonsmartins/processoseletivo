<%
'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if
%>

<html>


<!-- #include file="header.asp" -->

<form method="GET" action="finalizaexame.asp" name="form">
  <div align="center">
    <center>
    <table border="0" cellpadding="0" width="436">
      <tr>
        <td width="388"><font size="2" face="Arial"><b>Escolha o Exame a
          Finalizar:</b></font></td>
        <td width="38">
          <select size="1" name="exame">
            <%
              dim acesso
              dim exames
              set acesso = createObject("ProcessoSeletivo.Acesso")
              acesso.setSQL("select * from conf_exame")
              set exames = acesso.openSQL
              do while not exames.eof 
                Response.Write "<option value="&exames.Fields("cod_conf_exame")&">"&exames.Fields("descricao")&" - "&exames.Fields("semestre")&"/"&exames.Fields("ano")&"</option>"
                exames.MoveNext
              loop
            %>
          </select>
        </td>
      </tr>
    </table>
    </center>
  </div>
  <p align="center"><input type="submit" value="Finalizar Exame" name="B1"></p>
</form>
<p>&nbsp;</p>
<!-- #include file="../footer.asp" -->
</body>

</html>
