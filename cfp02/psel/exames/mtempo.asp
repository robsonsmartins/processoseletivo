<%@ Language=VBScript %>
<%

	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if


	dim discip
	
	set objeto2 = createobject("ProcessoSeletivo.Acesso")
	objeto2.setSQL("select * from conf_prova where cod_conf_prova = " & Request.QueryString("prova"))
	set conf_prova = objeto2.openSQL 

%>

<HTML>

<!-- #include file="header.asp" -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font FACE=arial size=3 color=#273f6f>Modifique os tempos para a prova <b><%=conf_prova("descricao")%></b>
<br>
<centeR>
<form name=frm1 action=operacao.asp method=get>
<table border=0 width=50%>
<tr><td><font size=3 color=black>Tempo mínimo para a realização da prova</tD><td><input type=text value="<%=conf_prova("tempo_min")%>" name="tempo_min"></td></tr>
<tr><td><font size=3 color=black>Tempo máximo para a realização da prova</tD><td><input type=text value="<%=conf_prova("tempo_max")%>" name="tempo_max"></td></tr>
<tr><td><input type=hidden value="<%=conf_prova("cod_conf_prova")%>" name="cod_conf_prova"><input type=hidden value="MTEMPO" name=origem></td><td><input type=hidden value="INSERE" name=comando></td></tr>

<tr><td colspan=2 align=center><input type=button value="Gravar Alteração" onclick="javascript:envia();"></td></tr>

</table>
</form>
<script language=JavaScript>
function envia(){
	
		if (document.frm1.tempo_min.value != '' && document.frm1.tempo_max.value != '') {
			document.frm1.submit();		
		}


}

</script>
<!-- #include file="../footer.asp" -->
</BODY>
</HTML>
