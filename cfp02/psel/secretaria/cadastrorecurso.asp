<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>


<script language="JavaScript">
  function envia() {
    if (document.frm.descricao.value != "" && document.frm.data.value != "" && document.frm.hora.value != "" && 
        document.frm.total.value != ""){
	
		document.frm.submit();
		
	}
	else
	{
		window.alert('Verifique o preenchimento de todos os campos!');
	}
  }
</script>
<%

'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if


	dim recurso
	dim descricao, data, hora, total, codrec
	dim operacao
	
	codrec = request.QueryString("codrec")
	
	set objeto = createobject("ProcessoSeletivo.Acesso")
	operacao = "INSERT"
	if codrec <>  "" then 
		operacao = "UPDATE"
		objeto.setSQL("select * from recurso where cod_recurso = " &codrec)
     	set recurso = objeto.openSQL 	
	  	descricao = recurso.Fields("descricao") 
	  	data = recurso.Fields("data") 
	  	hora = recurso.Fields("hora") 
	  	total = recurso.Fields("total") 
	end if	
%>
<html>

<head>
<title>Cadastro de Candidatos</title>
<style fprolloverstyle>A:hover {color: #0000FF; font-family: Arial; font-size: 10 pt; text-decoration: underline; font-weight: bold}
</style>
</head>

<!-- #include file="header.asp" -->

<form method="GET" action="operacaorecurso.asp" onSubmit="" name="frm">
  <input type="hidden" name="codrec" size="20" value="<%=codrec%>"><input type="hidden" name="operacao" size="20" value="<%=operacao%>">
  <div align="center">
    <center>
  <table border="0" width="60%" height="181" cellspacing="0">
    <tr>
      <td width="107" height="34"  align="left"><font size="2" face="Arial"><b>Descrição</b></font></td>
      <td width="671" height="34"  align="left"><font size="2" face="Arial"><input type="text" name="descricao" size="20" value = "<%=descricao%>" maxlength="20"></font></td>
    </tr>
    <tr>
      <td width="107" height="25"  align="left"><font size="2" face="Arial"><b>Data</b></font></td>
      <td width="671" height="25"  align="left"><font size="2" face="Arial"><input type="text" name="data" size="20" value = "<%= data%>" maxlength="10"></font></td>
    </tr>
    <tr>
      <td width="107" height="25"  align="left"><font size="2" face="Arial"><b>Hora</b></font></td>
      <td width="671" height="25"  align="left"><font size="2" face="Arial"><input type="text" name="hora" size="20" value = "<%=hora%>" maxlength="8"></font></td>
    </tr>
    <tr>
      <td width="107" height="25"  align="left"><font size="2" face="Arial"><b>Total
        Vagas</b></font></td>
      <td width="671" height="25"  align="left"><font size="2" face="Arial"><input type="text" name="total" size="20" value="<%=total%>" maxlength="3"></font></td>
    </tr>
    <tr>
      <td width="778" height="16"  colspan="2" align="left">
        <p align="left"><font size="2" face="Arial"> <b><a style="color=blue;" href="javascript:envia()">Gravar</a>&nbsp;&nbsp;
        <a style="color=blue;" href="listarecurso.asp">Cancelar e VOLTAR</a></b></font>&nbsp; </td>
    </tr>
  </table>
    </center>
  </div>
</form>
<!-- #include file="../footer.asp" -->

</body>

</html>
