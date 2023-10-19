<%
	
if NOT((session("acesso") = "prof") or (session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if
	
	session("origem") = "nova"
	cod_disciplina = session("disciplina")
	cod_topico=99999
	cod_divisao=99999
	
		set objeto = createobject("ProcessoSeletivo.Acesso")
		objeto.setSQL("select cod_disciplina, descricao from disciplina")
		set disc = objeto.openSQL 
	
	
	if (Request.QueryString("cod_disciplina") <> "") then
	
		cod_disciplina = Request.QueryString("cod_disciplina")
		cod_divisao = Request.QueryString("cod_divisao")
		cod_topico = Request.QueryString("cod_topico")

		if cod_divisao = "" then
			cod_divisao = "99999"
			cod_topico = ""
		end if
		
		if cod_topico = "" then
			cod_topico = "99999"		
		end if


	end if

		
		set objeto3 = createobject("ProcessoSeletivo.Acesso")
		objeto3.setSQL("select cod_divisao, descricao from divisao where cod_disciplina=" & cod_disciplina)
		set divis = objeto3.openSQL 


		if divis.eof then
			cod_topico = "99999"
			cod_divisao = "99999"
		end if

		set objeto2 = createobject("ProcessoSeletivo.Acesso")
		objeto2.setSQL("select cod_topico, descricao from topico where cod_divisao =" & cod_divisao)
		set topic = objeto2.openSQL	

%>

<HTML>
<HEAD>

<TITLE></TITLE>
</HEAD>


<!-- #include file="header.asp" -->


    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3>Cadastro de Questões:</font><br><br>

<center>  

<form name=frm1 method=get action=operacao.asp>

<table bgcolor=#104376 color=#c8cfc7 border=0 cellspacing=1 width=80%><tr><td>

  <table border="0" bgcolor=#c8cfc7 width="100%" cellspacing="3" cellpadding="3" >
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font  size=2 color="#800000">Disciplina</font></b></td>
      <td width="74%" height="25" align=left valign=top><font size=3 >
			<select name="cod_disciplina" onChange="javascript:mudou();"><option value="">Selecione...</option>
				<% do while not disc.EOF%>
					<option value=<%
								Response.write(disc.fields("cod_disciplina"))
								if (int(disc.fields("cod_disciplina")) = int(cod_disciplina)) then
									Response.Write(" selected ")
								end if
								%>><%=disc.fields("descricao")%></option>
					
					
					<%	disc.movenext
					loop%>
			</select>
		</td>
    </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font size=2 color="#800000">Divisão</font></b></td>
      <td width="74%" height="25" align=left valign=top><font size=3 >
      
			<select name="cod_divisao" onChange="javascript:mudou();"><option value="">Selecione...</option>
				<% do while not divis.EOF%>
					<option value=<%
								Response.write(divis.fields("cod_divisao"))
								if (int(divis.fields("cod_divisao")) = int(cod_divisao)) then
									Response.Write(" selected ")
								end if
								%>><%=divis.fields("descricao")%></option>
					
					
					<%	divis.movenext
					loop%>
			</select>    
    
	  </td>
    </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font size=2 color="#800000">Tópico</font></b></td>
      <td width="74%" height="25" align=left valign=top><font size=3 >
      
			<select name="cod_topico" ><option value="">Selecione...</option>
				<% do while not topic.EOF%>
					<option value=<%
								Response.write(topic.fields("cod_topico"))
								if (int(topic.fields("cod_topico")) = int(cod_topico)) then
									Response.Write(" selected ")
								end if
								%>><%=topic.fields("descricao")%></option>
					
					
					<%	topic.movenext
					loop%>
			</select>     

	  </td>
    </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font size=2 color="#800000">Grau Dificuldade</font></b></td>
      <td width="74%" height="25" align=left valign=top>
		<select name=cod_dificuldade>
			<option value="F" <% if dificuldade="F" then Response.Write ("selected") End if%>>Fácil</option>
			<option value="M" <% if dificuldade="M" then Response.Write ("selected") End if%>>Média</option>
			<option value="D" <% if dificuldade="D" then Response.Write ("selected") End if%>>Difícil</option>
		<select id=select1 name=select1>
     
      
       </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font  size=2 color="#800000">Enunciado</font></b>
        <p>&nbsp;</p>
      </td>
      <td width="74%" height="25" align=left valign=top>
        <p align="left"><textarea rows="6" name="enunciado" cols="52"><%=enunciado%></textarea>
      
    </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font  size=2 color="#800000">Alternativa A</font></b></td>
      <td width="74%" height="25" align=left valign=top><textarea rows="4" name="alternativa_a" cols="52"><%=alternativa_a%></textarea>
      
    </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font size=2 color="#800000">Alternativa B</font></b></td>
      <td width="74%" height="25" align=left valign=top><textarea rows="4" name="alternativa_b" cols="52"><%=alternativa_b%></textarea>
      
    </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font size=2 color="#800000">Alternativa C</font></b></td>
      <td width="74%" height="25" align=left valign=top><textarea rows="4" name="alternativa_c" cols="52"><%=alternativa_c%></textarea>
      
    </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font size=2 color="#800000">Alternativa D</font></b></td>
      <td width="74%" height="25" align=left valign=top><textarea rows="4" name="alternativa_d" cols="52"><%=alternativa_d%></textarea>
      
    </tr>
    <tr>
      <td width="26%" height="25" align=left valign=top><b><font size=2 color="#800000">Alternativa E</font></b></td>
      <td width="74%" height="25" align=left valign=top><textarea rows="4" name="alternativa_e" cols="52"><%=alternativa_e%></textarea>
      
    </tr>
    <tr>
      <td width="123%" height="21" align=center colspan="2">

        <%
        
			if (figura <> "") then
			
				%><input type=hidden value="<%=figura%>" name=figura ><img border=0 src="../cadastros/figura/<%=figura%>"><%
			
			end if
        
        %>
        
    </tr>
    <tr>
      <td width="100%" height="10" colspan="2">
      </td>
    </tr>
    <tr>
      <td width="26%" height="25"><b><font color="#800000">Alternativa Correta</font></b></td>
      <td width="74%" height="25">
      
      <input type="text" value="<%=gabarito%>" name="alternativa_correta" size="5">
        
        </td>
    </tr>
	  </form>
  </table>
  </td></tr></table>
  </form>
  <p align="center"><input type=button name="Voltar" value="Voltar à lista" onClick="javascript:history.go(-1);" >&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onClick="javascript:enviar();" value="Gravar Questão" name="B1"></p>
  &nbsp;
<script language=JavaScript>
function mudou(){

	//window.alert('ai vamos nos!');
	document.frm1.action="nova.asp?codquest=<%=codquestao%>";
	document.frm1.submit();
}
function enviar(){
	//Vamos fazer um check de consistencia antes de enviar os dados

	if (document.frm1.cod_disciplina.value != '' && document.frm1.cod_divisao.value != '' && document.frm1.cod_topico.value != '' && document.frm1.cod_dificuldade.value != '' && document.frm1.enunciado.value != '' && document.frm1.alternativa_a.value != '' && document.frm1.alternativa_b.value != '' && document.frm1.alternativa_c.value != '' && document.frm1.alternativa_d.value != '' && document.frm1.alternativa_e.value != '' && document.frm1.alternativa_correta.value != '' ){
		
			document.frm1.action = "operacao.asp";
			document.frm1.method = "get";
			document.frm1.submit();
				
	}else {
		window.alert ('Verifique o preenchimento ou seleção de todos os campos!');
	}


}
function selfile(){

	document.frm1.possuiimagem.value = 'SIM';

}
</script>

<%

	set q_local = nothing
	set objeto = nothing
	set questao = nothing
	set disc = nothing
	set objeto2 = nothing
	set objeto3 = nothing
	set divis = nothing
	set topic = nothing
	

%>
<!-- #include file="../footer.asp" -->

</BODY>
</HTML>
