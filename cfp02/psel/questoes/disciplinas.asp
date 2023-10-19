<%

if NOT((session("acesso") = "prof") or (session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if


dim discip

set disciplina = createobject("ProcessoSeletivo.Acesso")
disciplina.setSQL("Select * from disciplina")
set discip = disciplina.openSQL 


%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<TITLE></TITLE>
</HEAD>
<!-- #include file="header.asp" -->
<form name=frm1 action=navega.asp method=get>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3>Para prosseguir, por favor selecione a disciplina:</font><br><br><br><br>

<center>
<select name=disciplina>
<option value=>Selecione..</option>
<% 

do while not(discip.EOF)%>

<option value=<%=discip.fields("cod_disciplina").value%>><%=discip.fields("descricao").value%> </option>

<%	discip.movenext
loop%>


</select>&nbsp;&nbsp;
<input type=button value=Prosseguir onClick="javascript:enviar()">

</form>
<P>&nbsp;</P>
</center>
<%
	set discip = nothing
	set disciplina = nothing

%>
<script language=Javascript>
function enviar(){

	if (document.frm1.disciplina.value != "") {
	
		document.frm1.submit();
		
	}else {
	
	   window.alert('É NECESSÁRIO A DIGITAÇÃO DE PELO MENOS UM ITEM!');
	}
}

</script>
<!-- #include file="../footer.asp"  -->
</BODY>
</HTML>
