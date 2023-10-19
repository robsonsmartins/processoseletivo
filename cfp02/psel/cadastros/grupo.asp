<%

if NOT((session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if

	dim registros
	dim objeto
	
	
	set objeto = createobject("Processoseletivo.Acesso")
	set registros = createobject("ADODB.Recordset")
	objeto.setSQL ("select * from grupo")
	set registros = objeto.openSQL
   
%>
<html>
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
      <td bgcolor="#003366"  align="left"><font size=2><b>Nome do Grupo</b></td>
      <td bgcolor="#003366"  align="left"><font size=2><b>Tipo de acesso</b></td>
    </tr>
    <% do while not (registros.EOF) %>
    <tr>
      <td  align="left"><a style="color:black; size=3" href="apagar.asp?cod_grupo=<%=registros.Fields("cod_grupo")%>"><img border="0" src="figura/lixo.gif" WIDTH="19" HEIGHT="16"></a></td>
      <td  align="left"><a title="Clique sobre o grupo desejado para cadastrar usuários" style="color:blue; size=3" href="usuario.asp?grupo=<%=registros.Fields("cod_grupo")%>&nome_grupo=<%=registros.Fields("descricao")%>"><font size=3><%=registros.Fields("descricao")%></a></td>
      <td  align="left"><%
      
		if (registros.Fields("acesso") = "adm") then
				Response.Write("<font size=3>Administrador")		
		end if

		if (registros.Fields("acesso") = "prof") then
				Response.Write("<font size=3>Professor")		
		end if
		
		if (registros.Fields("acesso") = "secret") then
				Response.Write("<font size=3>Secretaria")		
		end if

      
      %></td> 
    </tr>
    <tr><td colspan=3 bgcolor=3> </tD></tr>
   <%registros.MoveNext
      loop%> 
  </table></form>
  </center>
</div>
<div ID="PAINEL" style="HEIGHT: 26px; WIDTH: 717px">
<input type=button value="Cadastrar novo grupo" onClick="javascript:clique();">
<!--
<a  style="color:black; size=3" href="javascript:clique();">Cadastrar Novo Grupo</a></p>
-->
</div>
<center>
<br>
<script language="JavaScript">

function clique(){
	PAINEL.innerHTML = "<center><form name=frm method=get action=cadastro.asp><table border=0 width=50%><tr bgcolor=#003366><td align=center><font face=arial size=2>Grupo: <input type=text name=descricao size=20><br>Acesso:     <select name=acesso><option value=''>Selecione...</option><option value='adm'>Administrador</option><option value=secret>Secretaria</option><option value=prof>Professor</option></select><input type=hidden name=origem value=grupo size=20><br><a href=javascript:envia()>Cadastrar novo GRUPO</a></font></td></tr></table></form>";
}

function envia(){
	
	if (document.frm.descricao.value != '' && document.frm.acesso.value != ''){
		
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




