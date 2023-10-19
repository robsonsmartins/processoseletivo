<%

'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if

	dim navega
	dim disciplina 
	dim cod_divisao
	
	cod_disciplina = Request.querystring("disciplina")
	cod_divisao = Request.QueryString("cod_divisao")	
  
    set discip = createobject("ProcessoSeletivo.Acesso")
	discip.setSQL("select * from disciplina where cod_disciplina=" & cod_disciplina)
	set campodesc = discip.openSQL 
  
   set div = createobject("ProcessoSeletivo.Acesso")
	div.setSQL("select * from divisao where cod_disciplina =" & cod_disciplina  )
	set DivQuest = div.openSQL 
  
  
	if (cod_divisao <> "") then
  
		set topico = createobject("ProcessoSeletivo.Acesso")
		topico.setSQL("select * from topico where cod_divisao = " & cod_divisao)
		set TopQuest = topico.openSQL 

	end if
	
	session("disciplina") = cod_disciplina

%>

<html>

<head>

</head>

<!-- #include file="header.asp" -->

<form method="GET" action="Listagem.asp" name=frm1>

 <!-- <p align="center"><i><font color="#800000" face="Arial Black" size="4">CONSULTA
  DE QUESTÕES</font></i></p> -->
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3>Cadastro e consulta de questões de <b><%=campodesc.fields("descricao")%></b></font><br><br><br><br>

<input type=hidden value="<%=cod_disciplina%>" name=disciplina>

<center>

    <table border="0" width="40%" cellspacing="0" cellpadding="0" height="10">
    
            
    <tr>
      <td width="26%" height="25"><b><font size=2>Divisão</font></b></td>
      <td width="74%" height="25">
      <select  name=cod_divisao onChange="javascript:mudou();">
				<option value=>Selecione a divisão...</option>
        <% do while not (DivQuest.EOF) %>
					<option value="<%=DivQuest.Fields("cod_divisao")%>" <%if (cint(DivQuest.Fields("cod_divisao")) = cint(cod_divisao)) then Response.write(" selected ") end if%>><%=DivQuest.Fields("descricao")%></option>
				<%DivQuest.MoveNext 
   		   loop%>

      
        </select>
    
      </font>
      
      </td>
    </tr>
    <tr>
      <td width="26%" height="25"><b><font size=2>Tópico</font></b>
          
      </td>
      <td width="74%" height="25"><select size="1" name="cod_topico">
      <option value=>Selecione o tópico...</option>

<% 
		if cod_divisao <> "" then		  
       
		  do while not (TopQuest.EOF) %>

			<option value=<%=topquest.Fields("cod_topico")%>><%=TopQuest.Fields("descricao")%></option>
      
				<%TopQuest.MoveNext 
   		  loop
   		  
   		end if
   		  
   		  
%>
      
        </select></td>
   
         </tr>
  </table>
  <p align="center"><!-- <input type="button" value="Voltar" name="B2"> -->
  <input type="button" value="Consultar" name="B1" onClick="javascript:consultar();"></p>
  
</form>
<script language=Javascript>
function consultar(){

	if (document.frm1.cod_divisao.value != "" && document.frm1.cod_topico.value != "") {
		document.frm1.action = "Listagem.asp";
		document.frm1.method = "get";
		document.frm1.submit();
		
	}else {
	
	   window.alert('Você deve selecionar um item !');
	}
}
function mudou(){
	//A seleção foi alterada e faremos a atualização da tela
	if (document.frm1.cod_divisao.value != '<%=cod_divisao%>' ){
		document.frm1.action = "navega.asp";
		document.frm1.method = "get";
		document.frm1.submit();
	}
}

</script>

<!-- #include file="../footer.asp"  -->
</body>

</html>
