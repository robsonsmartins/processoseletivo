<%

if NOT((session("acesso") = "prof") or (session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if


dim codDiscip, codDiv, codTop 

codDiscip = session ("disciplina")
codTop = Request.querystring("cod_topico")
codDiv = Request.querystring("cod_divisao")

	set navega = createobject("ProcessoSeletivo.Acesso")
	navega.setSQL("select * from questao where (questao.cod_disciplina =" &  codDiscip & ") and (questao.cod_divisao =" & codDiv & ")and (questao.cod_topico =" &  codTop & ")" ) 
	set listaq = navega.openSQL 

   
%>
<html>

<head>

</head>

<!-- #include file="header.asp"  -->

<form name=frm1 method="GET" >

     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=arial size=3>Relação de Questões por Disciplina do critério selecionado:</font><br><br>

<center>  

        <table border="0" width="60%">

       <tr bgcolor=#104376 color=#c8cfc7 ><tH align=left><font size=2>Remover</th><th align=left><font size=2>Descrição (enunciado)</th></tR>

            <%  dim contador
				dim var_especial()
				redim var_especial(500)
				contador = 1
				do while not (listaq.EOF) %>


				 <tr><td><!--<a style="color:red;" href="operacao.asp?cod_topico=<%=codtop%>&cod_divisao=<%=coddiv%>&comando=apaga&cod_questao=<%=listaq.fields("cod_questao")%>">Apagar</a>-->
				 
					<DIV ID=AP_<%=contador%>>
							<a style="color:red; " href="javascript:apagar(<%=contador%>);">Apagar</a>
					</DIV>
				 
				 </tD><td width="100%">
		            <a style="color:gray; font-size=14;" href="edita.asp?codquest=<%=listaq.fields("cod_questao")%>">          
						<%=left(listaq.fields("enunciado"),50) & "..." %>
					</a>
                         
		         </td></tr>
        
				<tr bgcolor=#003366><td colspan=2></td></tr>
						<%	var_especial(contador) = "<a style='color:red;' href='operacao.asp?cod_topico=" & codtop & "&cod_divisao=" & coddiv & "&comando=apaga&cod_questao=" & listaq.fields("cod_questao") & "'>CONFIRMA?</a>"
							contador = contador + 1
							listaq.MoveNext
              loop%> 

        </table><br><br>
        
    <input type="button" value="Clique aqui para adicionar uma nova questão" onClick="javascrip:nova_questao();" name="BNovo">
    
    <script language=JavaScript>
    
    var var_x;
    
    function nova_questao(){
    
		document.frm1.action = "nova.asp";
		document.frm1.submit();
    
    }
    
    function apagar(var_x){
		switch (var_x){
		<% for g=contador-1 to 1 step -1 %>		
			case <%=g%>:
				AP_<%=g%>.innerHTML = "<%=var_especial(g)%>";
			break;
		<% next %>
			default:
				// faz nada....
			break;
		}	
    }
    </script>
</form>
<!-- #include file="../footer.asp"  -->
</body>
</html>