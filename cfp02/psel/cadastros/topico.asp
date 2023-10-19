<%

if NOT((session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if


  dim sql
  dim objeto
  dim topico
  dim divisao
  
  
   divisao   = Request.QueryString("divisao")    
   topico    = Request.QueryString("topico")
   
    if (Request.QueryString("nome_div") <> "") then
	   nome_div  = Request.QueryString("nome_div")
	end if

    if (session("nome_div") <> "") then
	   nome_div  = session("nome_div")
	end if
	
	session("divisao") = divisao
	disciplina = session("disciplina")
	
	set objeto = createobject("ProcessoSeletivo.Acesso")
	set sql  = createobject("ADODB.Recordset")
	objeto.setSQL("Select * from topico where(cod_divisao="&divisao&")")
	set sql = objeto.openSQL
	%>
<html>
<!-- #include file="header.asp" -->
<font face=arial size=4 color="#003366"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cadastro de tópicos para a divisão <font color=black><%=nome_div%></b>
<center>
<br>
<form action="apagar.asp" method="gest" name="frma">
<div align="center">
  <center>
  <table border="0" width="50%">
    <tr>
      <td  bgcolor="#003366" align="left"><font size=2><b>Excluir</b></td>
      <b>
      <td  bgcolor="#003366" align="left"><font size=2><b>Nome do Topico</b></td>
    </tr>
    <% do while not (sql.EOF) %>
    <tr>
      <td   align="left"><a  style="color:black; size=3" href="apagar.asp?link=divisao.asp?disciplina=<%=disciplina%>&nome_div=<%=nome_div%>&cod_topico=<%=sql.Fields("cod_topico")%>"><img border="0" src="figura/lixo.gif" WIDTH="19" HEIGHT="16"></a></td>
      <td   align="left"><font size=3 color=black><%=sql.Fields("descricao")%></td>
    </tr>
    <tr><td color=black colspan=2><tD></tr>
   <%sql.MoveNext
      loop%> 
  </table></form>
  </center>
</div>
<div ID="PAINEL" style="HEIGHT: 26px; WIDTH: 717px">
<input type=button value="Cadastrar novo topico" onClick="javascript:clique();">
<!-- <a  style="color:black; size=3" href="javascript:clique();">Cadastrar Novo Topico</a></p>
-->
</div>
<center>
<script language="JavaScript">

function clique(){
	PAINEL.innerHTML = "<form name=frm method=get action=cadastro.asp><table bgcolor=#003366 border=0 width=50%><tr><td align=center><font face=arial size=2>Descrição:<input type=text name=descricao size=20><input name=link type=hidden value='divisao.asp?disciplina=<%=disciplina%>'><input type=hidden name=name_div value='<%=name_div%>'><input type=hidden name=cod_divisao value='<%=divisao%>' size=20 value=<%=topico%>> <input type=hidden name=origem value=topico size=20><br></td></tr><Td align=center><a style='color=white; size=3;' href=javascript:envia()><font size=2>Cadastrar novo Topico</a></font></td></tr></table></form>";
}

function envia(){
	
	if (document.frm.descricao.value != ""){
		
		document.frm.submit();
		
	}else{

		window.alert('Verifique o preenchimento do campo!');
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




