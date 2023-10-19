<%

if NOT((session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if

	dim registros
	dim objeto
	
	
	set objeto = createobject("Processoseletivo.Acesso")
	set registros = createobject("ADODB.Recordset")
	objeto.setSQL ("select * from AREA")
	set registros = objeto.openSQL
   
%>
<html>
<!-- #include file="header.asp" -->
<font face=arial size=4 color="#003366"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cadastro de Áreas:</b>
<center>
<br>
</b>
<div align="center">
  <center>
  <table border="0" width="50%" >
    <tr bgcolor="#003366">
      <td width="2%" align="LEFT" color=#c8cfc7 bgcolor="#003366"><b><FONT SIZE=2>Excluir</b></td>
      <td width="60%" align="LEFT" color=#c8cfc7 bgcolor="#003366"><b><FONT SIZE=2>Descricao</b></td>
    </tr>
    <% do while not (registros.EOF) %>
    <tr>
      <td width="2%" align="left"><a  STYLE="COLOR=BLUE; SIZE=3;" href="apagar.asp?cod_area=<%=registros.Fields("cod_area")%>"><img border="0" src="figura/lixo.gif" WIDTH="19" HEIGHT="16"></a></td>
      <td width="60%" align=left color=black><font size=3 color=black ><%=registros.Fields("descricao")%></td>
    </tr>
    <TR BGCOLOR=BLACK ><TD bgcolor=black COLSPAN=2> </TD></TR>
   <%registros.MoveNext
      loop%> 
  </table>
  
  </center>
</div>
<div ID="PAINEL" style="width: 717; height: 57">
&nbsp;</center>
  <p align="center">
<INPUT TYPE=BUTTON VALUE="Cadastrar Nova Área" onClick="javascript:clique();"> 
<!--<a STYLE="COLOR=BLUE; SIZE=3" href="javascript:clique();">Cadastrar Nova Área</a>
-->
</div>
<center>
<br>
<script language="JavaScript">

function clique(){
	PAINEL.innerHTML = "<br><center><form name=frm method=get action=cadastro.asp><table border=0 width=50%><tr bgcolor=#003366><td align=center><font face=arial size=2>Descrição: <input type=text name=descricao size=20><br><input type=hidden name=origem value=area size=20><br><a href=javascript:envia()>Cadastrar nova Área</a></font></td></tr></table></form>";
}

function envia(){
	
	if (document.frm.descricao.value != ""){
		
		document.frm.submit();
		
	}else{

		window.alert('Verifique o preenchimento do campo!');
		document.frm.descricao.setfocus;
		
	}
}	

</script>
<!-- #include file="../footer.asp"-->

</body>
</html>




