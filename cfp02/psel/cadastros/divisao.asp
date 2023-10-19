<%
if NOT((session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if


	dim registros
	dim objeto
   dim divisao
   dim disciplina
  
   divisao      = Request.QueryString("divisao")    
   disciplina   = Request.QueryString("disciplina")
   
	if (Request.QueryString("nome_disc") <> "") then
		nome_disc    = Request.QueryString("nome_disc")
	end if
	if (session("nome_disc") <> "") then
		nome_disc    = session("nome_disc")
	end if

	session("disciplina") = disciplina
	

	set objeto = createobject("Processoseletivo.Acesso")
	set registros = createobject("ADODB.Recordset")
	objeto.setSQL ("select * from divisao Where(cod_disciplina="&disciplina&")")
	set registros = objeto.openSQL
   
%>
<html>

<!-- #include file="header.asp" -->
<font face=arial size=4 color="#003366"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cadastro de Divisões para <font color=black><%=nome_disc%></b>
<center>
<br>
<form action="apagar.asp" method="gest" name="frma">
<div align="center">
  <center>
  <table border="0" width="40%">
    <tr bgcolor="#003366">
      <td width="2%" align="left"><b><font size=2>Excluir</b></td>
      <b>
      <td width="60%" align="left"><b><font size=2>Nome da Divisão</b></td>
    </tr>
    <% do while not (registros.EOF) %>
    <tr>
      <td width="2%" align="left"><a  style="color:black; size=3" href="apagar.asp?link=disciplina.asp&nome_disc=<%=nome_disc%>&cod_divisao=<%=registros.Fields("cod_divisao")%>"><img border="0" src="figura/lixo.gif" WIDTH="19" HEIGHT="16"></a></td>
      <td width="60%" align="left"><a  style="color:blue; size=3" title="Clique na Divisão para criar novos tópicos" href="topico.asp?divisao=<%=registros.Fields("cod_divisao")%>&link=divisao.asp?disciplina=<%=disciplina%>&nome_div=<%=registros.Fields("descricao")%>"><font size=3><%=registros.Fields("descricao")%></a></td>
    </tr>
	<tr><td bgcolor=black colspan=2></td></tr>
   <%registros.MoveNext
      loop%> 
  </table></form>
  </center>
</div>
<div ID="PAINEL" style="HEIGHT: 26px; WIDTH: 717px">
 <input type=button value="Cadastrar nova divisão" onClick="javascript:clique();">
<!--
<a  style="color:black; size=3" href="javascript:clique();">Cadastrar Nova Divisão</a></p>
-->
</div>
<center>
<script language="JavaScript">

function clique(){
	PAINEL.innerHTML = "<center><form name=frm method=get action=cadastro.asp><table border=0 width=50%><tr bgcolor=#003366><td align=center><font face=arial size=2>Divisão: <input type=text name=descricao size=20><input type=hidden name=link value='disciplina.asp'><input type=hidden name=disciplina value='<%=disciplina%>'><br><input type=hidden name=nome_disc value='<%=nome_disc%>'><input type=hidden name=origem value=divisao size=20><br><a href=javascript:envia()>Cadastrar nova DIVISÃO</a></font></td></tr></table></form>";
}

function envia(){
	
	if (document.frm.descricao.value != ""){
		
		document.frm.submit();
		
	}else{

		window.alert('Verifique o preenchimento do campo!');
		document.frm.descricao.setfocus;
		
	}
}	

function apagar(){
	
	if (document.frma.area.value != ""){
		
		document.frma.submit();
		
	}else{

		window.alert('Não tem nenhuma área para ser apagada!');
	}
}	





</script></center></b>
<!-- #include file="../footer.asp" -->

</body>
</html>




