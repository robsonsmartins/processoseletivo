<%

	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if

	dim discip
	
	set objeto2 = createobject("ProcessoSeletivo.Acesso")
	objeto2.setSQL("select * from area")
	set discip = objeto2.openSQL 



	set objeto = createobject("Processoseletivo.Acesso")
	set registros = createobject("ADODB.Recordset")
	objeto.setSQL ("select * from conf_exame, area where (conf_exame.cod_area = area.cod_area)")
	set registros = objeto.openSQL
   
%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE>Configuração dos Exames</TITLE>
</HEAD>
<!-- #include file="header.asp" -->

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3 color=black>Cadastro e Configuração dos EXAMES:</b>
<br><br>
<Center>
<table width=80% border=0  >
<tr bgcolor=#104376 color=#c8cfc7><th ALIGN=LEFT color=#c8cfc7><font face=arial size=2 >Período</th><th ALIGN=LEFT ><font face=arial size=2  >Descrição</th><th ALIGN=LEFT ><font face=arial size=2  >Área</th></tr>
<% do while not (registros.EOF) %>

<tr><td><font face=arial size=2 color=black ><%=registros.Fields("ano") & " - " & registros.Fields("semestre")%>o sem.</td><td><a style="size=3 color=blue;" href=mostraexame.asp?exame=<%=registros.Fields("cod_conf_exame")%>><font face=arial size=2 color=blue ><%=registros.Fields("conf_exame.descricao")%></a></td><td><font face=arial size=2 color=black ><%=registros.Fields("area.descricao")%></td></tr>
<TR><TD COLSPAN=3 bgcolor=#003366></TD></TR>
<%		registros.MoveNext 
   loop%>
</table><br>
<DIV ID=PAINEL>
<input type=button value="Criar novo exame" onClick="javascript:clique();">

<!-- <a style="color=blue; size=2;" href=javascript:clique();><br>Criar Novo Exame</a>
-->
</DIV>
<%

	dim area_texto
	
	area_texto = "<select name=cod_area><option value=>Selecione</option>"
	
	do while not (discip.eof)
	
		area_texto = area_texto & "<OPTION value=" & discip.fields("cod_area") & ">" & discip.fields("descricao") & "</OPTION>" 
	
		discip.movenext
	loop

		area_texto = area_texto & "</select>"

%>
<script language=JavaScript>
function clique(){
	PAINEL.innerHTML = "<center><form name=frm method=get action=operacao.asp><table border=0 width=80%><tr bgcolor=#003366><td align=center><input type=hidden name=origem value=EXAME><input type=hidden name=comando value=INSERE><font face=arial size=2>Descrição: <input type=text name=descricao size =20> Área: <%=area_texto%><br>Ano: <input type=text name=ano size=4> Semestre: <select name=semestre><option value=>Selecione</option><option value=1>1</option><option value=2>2</option></select> <br><a href=javascript:envia()>CADASTRAR EXAME</a></font></td></tr></table></form>";
}

function envia(){
	
	if (document.frm.ano.value != "" && document.frm.semestre.value != "" && document.frm.descricao.value != "" && document.frm.cod_area.value != ""){
		
		document.frm.submit();
		
	}else{

		window.alert('Verifique o preenchimento de todos os campos!');
		
	}
}	
</script>
<!-- #include file="../footer.asp" -->
</BODY>
</HTML>
