<%

if NOT((session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if

	dim discip
	
	
	set objeto = createobject("Processoseletivo.Acesso")
	set registros = createobject("ADODB.Recordset")
	objeto.setSQL("select * from disciplina")
	set registros = objeto.openSQL
   session("link") = ""
%>
<html>
<!-- #include file="header.asp" -->
<font face=arial size=4 color="#003366"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cadastro de Disciplinas:</b>
<center>
<br>
</center>
<div align="center">
  <center>
  <table border="0" width="50%">
    <tr>
      <td width="2%" align="left" bgcolor="#003366"><font size=2><b>Excluir</td>
      <td width="50%" align="left" bgcolor="#003366"><font size=2><b>Descrição</b></td>
    </tr>
    <% do while not (registros.EOF) %>
    <tr>
      <td width="2%" align="left"><a STYLE="COLOR=BLACK; SIZE=2" href="apagar.asp?cod_disciplina=<%=registros.Fields("cod_disciplina")%>"><img border="0" src="figura/lixo.gif" WIDTH="19" HEIGHT="16"></a></td>
     <td width="50%" align="left"><a STYLE="COLOR=BLUE; SIZE=2" title="Clique na disciplina para criar e configurar novas divisões" href="divisao.asp?disciplina=<%=registros.Fields("cod_disciplina")%>&link=disciplina.asp&nome_disc=<%=registros.Fields("descricao")%>"><font size=3 ><%=registros.Fields("descricao")%></a></td>
    </tr>
        <TR BGCOLOR=BLACK ><TD bgcolor=black COLSPAN=2> </TD></TR>
    <%	registros.MoveNext
    loop%>
  </table>
  </form>
  </center>
</div>
<center><br>
<div ID="PAINEL">
<input type=button value="Cadastrar nova Disciplina" onClick="javascript:clique();">

<!-- <a  STYLE="COLOR=BLUE; SIZE=3"href="javascript:clique();"><br>Cadastra Nova Disciplina</a>
-->
</div>
<br>
<script language="JavaScript">

function clique(){
	PAINEL.innerHTML = "<center><form name=frm method=get action=cadastro.asp><table border=0 width=50%><tr bgcolor=#003366><td align=center><font face=arial size=2>Descrição: <input type=text name=descricao size=20><br><input type=hidden value=disciplina name=origem size=20><br><a href=javascript:envia();>Cadastrar nova Disciplina</a></font></td></tr></table></form>";
}

function envia(){
	
	if (document.frm.descricao.value != ""){
		
		document.frm.submit();
		
	}else{

		window.alert('Verifique os campos vazios!');
		
	}
}

function excluir(){
	
	if (document.frma.disc.value != ""){
		
		document.frma.submit();
		
	}else{
	     
	    window.alert('Não tem nenhuma disciplina para ser excluida!');
   }
}	
</script>
<!-- #include file="../footer.asp" -->

</body>
</html>



