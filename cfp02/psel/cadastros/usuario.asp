<%

if NOT((session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if


  dim sql
  dim objeto
  dim usuario
  dim grupo
  
  
   grupo   = Request.QueryString("grupo")    
   usuario = Request.QueryString("usuario")

	session("grupo") = grupo

	set objeto = createobject("ProcessoSeletivo.Acesso")
	set sql  = createobject("ADODB.Recordset")
	objeto.setSQL("Select * from usuario where(cod_grupo="& grupo &")")
	set sql = objeto.openSQL
	%>
<html>
<head>
<title>Cadastro Usuários</title>
</head>
<!-- #include file="header.asp" -->
<font face=arial size=4 color="#003366"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cadastro de grupos: <font color=black><%=nome_div%></b>
<center>
<br>
<form action="apagar.asp" method="gest" name="frma">
<div align="center">
  <center>
  <table border="0" width="50%">
    <tr>
      <td bgcolor="#003366"  align="left"><font size=2><b>Excluir</b></td>
      <td bgcolor="#003366"  align="left"><font size=2><b>Nome</b></td>
    </tr>
    <% do while not (sql.EOF) %>
    <tr>
      <td align="left"><a  STYLE="COLOR=BLACK; SIZE=3" href="apagar.asp?cod_usuario=<%=sql.Fields("cod_usuario")%>"><img border="0" src="figura/lixo.gif" WIDTH="19" HEIGHT="16"></a></td>
      <td align="left"><%=sql.Fields("nome")%></td>
    </tr>
    <tr><td colspan=2 bgcolor=black> </td></tr>
   <%sql.MoveNext
      loop%> 
  </table></form>
  </center>
</div>
<div ID="PAINEL" style="HEIGHT: 26px; WIDTH: 717px">
&nbsp;</center>
  <p align="center">
<a  STYLE="COLOR=BLUE; SIZE=3" href="javascript:clique();">Cadastrar Novo Usuário</a></p></div>
<center>
<br>
<script language="JavaScript">

function clique(){
	PAINEL.innerHTML = "<form name=frm method=get action=cadastro.asp><table border=0 width=50% bgcolor=#003366><tr><td><font face=arial size=2>Nome completo:</td><td><input type=text name=nome size=20></td></tr><tr><td>E-mail:</td><td><input type=text name=email size=18></td></tr><tr><td>Telefone:</td><td><input type=text name=telefone size=20></td></tr><tr><td>Usuário:</td><TD><input type=text name=usr size=20></td></tr><tr><td>Senha:</td><td><input type=text name=pwd size=20></td></tr><tr><td><input type=hidden name=cod_grupo size=20 value=<%=grupo%>></TD><TD> <input type=hidden name=origem value=usuario size=20></td></tr><tr><td align=center colspan=2><a style='color=blue; size=3;' href=javascript:envia()><font size=3 color=white>Cadastrar novo Usuário</a></font></td></tr></table></form>";
}

function envia(){
	
	if (document.frm.nome.value != "" && document.frm.email.value != "" && document.frm.telefone.value != "" && document.frm.usr.value != "" && document.frm.pwd.value != ""){
		
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




