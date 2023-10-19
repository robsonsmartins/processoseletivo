<%@ Language=VBScript %>
<%

	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if


	dim discip
	
	set objeto2 = createobject("ProcessoSeletivo.Acesso")
	objeto2.setSQL("select * from disciplina")
	set discip = objeto2.openSQL 

	session("cod_Exame") = Request.querystring("exame")

	dim contador
	dim teste
	dim objeto
	dim cod_exame
	if session("cod_Exame") = "" then
		cod_exame = Request.Form("exame") 	
	else
		cod_exame = session("cod_Exame") 
	end if
	set objeto = createobject("ProcessoSeletivo.ExameConfiguracao")
	set teste = objeto.getConfExame (cod_Exame)

	contador = 1	
%>
<HTML>
<!-- #include file="header.asp" -->
<center>
<br>
<table border=0 color=#c8cfc7 width=95% cellspacing=0 cellpadding=0>
<tr ><td align=right><font color=black face=arial color=black size=4><b><%=teste.descricao%></b></font></td></tr>
<tr ><td align=right><font  color=black face=arial color=black size=2><b>Código do exame: </b><%=cod_Exame%></font></td></tr>
<tr ><td align=left><font  color=black face=arial color=black size=2><b>Área objetivo do exame: </b><%=teste.area_texto%></font></td></tr>
<tr ><td align=left><font  color=black face=arial color=black size=2><b>Período do exame: </b><%=teste.ano & ", " & teste.semestre%>o semestre</font></td></tr>
<tr bgcolor=black><td color=black> </td></tr>
<%  if teste.provas.count < 4 then%>

	<% if teste.provas.count = 0 then%>

			<tr ><td align=right><font face=arial color=blue size=1><a style="color=blue;" href="javascript:adicionar_prova();"  >Adiciona Prova ao EXAME</a> <a style="color=blue;"  href=operacao.asp?origem=EXAME&comando=APAGA&cod_conf_exame=<%=cod_exame%> >REMOVE EXAME</a></td></tr>	
	<!-- bgcolor=ddeebb -->
	<%	else %>

			<tr ><td align=right><font face=arial size=1><a style="color=blue;"  href="javascript:adicionar_prova();"  >Adiciona Prova ao EXAME</a></td></tr>

<%		end if

	end if%>

<tr  align=center><td><div id=prova></div></td></tr>

<%
	

		for each item in teste.provas 
		
			total_quest = 0
			for h=1 to item.disciplinas.count
				total_quest = total_quest + item.disciplinas(h).numeroQuestoesFaceis
				total_quest = total_quest + item.disciplinas(h).numeroQuestoesMedias
				total_quest = total_quest + item.disciplinas(h).numeroQuestoesDificeis
			next

%>
			<tr ><td align=left><font face=arial color=black color=black color=black size=2>Prova: <b><%=item.descricao%></b> - <a style="color=blue;" href="mtempo.asp?prova=<%=item.cod_conf_prova%>">(clique aqui para alterar o tempo de execução da prova)</a></font></td></tr>
			<tr ><td align=left><font face=arial color=black color=black size=2>Código de configuração da prova: <%=item.cod_conf_prova%> </font></td></tr>
			<tr ><td align=left><font face=arial color=black color=black size=2>Tempo mínimo para realização da prova: <%=item.tempomin%> minutos</font></td></tr>
			<tr ><td align=left><font face=arial color=black color=black size=2>Tempo máximo para realização da prova: <%=item.tempomax%> minutos</font></td></tr>
			<tr ><td align=left><font face=arial color=black size=2>Total de questões desta prova: <%=total_quest%> </font></td></tr>
			<tr><td colspan=6 bgcolor=black></td></tr>
			<!-- bgcolor=eeffcc -->
			<% if item.disciplinas.count < 5 then%>
			 
				<tr ><td align=right><font face=arial color=black size=1><a style="color=blue;"  href="javascript:adicionar(<%=contador%>, <%=item.cod_conf_prova%>);">Adiciona disciplina à prova <%=item.descricao%></a> <% if item.disciplinas.count = 0 then %> <a style="color=blue;"  href=operacao.asp?origem=PROVA&comando=APAGA&cod_conf_prova=<%=item.cod_conf_prova%>>Remover prova <%=item.descricao%></a><% end if %></td></tr>			
		
			<% end if%>
		
		<%	For Each disc In item.disciplinas %>
        
				<tr ><td align=right>
			
				<table border=0 width=90% >
				<tr ><td valign=top width=30%><font face=arial color=black size=2><b> <u><%=disc.disciplina_texto%></u></b></td>
				<td width=70%>
				<font face=arial color=black size=2>
					Peso da prova: <%=disc.peso%><BR>
					Questões Difíceis: <%=disc.numeroQuestoesDificeis%><BR>
					Questões Médias: <%=disc.numeroQuestoesMedias%><BR>
					Questões Fáceis: <%=disc.numeroQuestoesFaceis%><br>
					Total de questões na disciplina: <%=cint(disc.numeroQuestoesFaceis) + cint(disc.numeroQuestoesMedias) + cint(disc.numeroQuestoesDificeis)%><br>
						<Table border=0 cellspacing=0 cellpadding=0 width=100%>
						<tr><td align=right>
						<font face=arial color=black size=1><a style="color=blue;"  href=operacao.asp?comando=APAGA&origem=DISCIPLINA&cod_conf_prova=<%=item.cod_conf_prova%>&cod_disciplina=<%=disc.cod_disciplina%>>Remove <%=disc.disciplina_texto%> </a></font>
						</td></tr>
						</table>				
					</td></tr>
					<tr ><td colspan=2 bgcolor=black></td></tr>
					</table>	
					
					</td></tr>
					<!-- <tr><td bgcolor=black></td></tr>-->	
        
		<%	Next %>

			<tr><td align=right>
			
			<div id="ndisc_<%=contador%>"></div>
			
			</td></tr>
			
		<%	contador = contador + 1

		next
		
		
		set teste = nothing
		set objeto = nothing

	dim disciplinas_texto
	
	disciplinas_texto = "<select name=cod_disciplina>"
	
	do while not (discip.eof)
	
		disciplinas_texto = disciplinas_texto & "<OPTION value=" & discip.fields("cod_disciplina") & ">" & discip.fields("descricao") & "</OPTION>" 
	
		discip.movenext
	loop

		disciplinas_texto = disciplinas_texto & "</select>"

	%>
	
	<tr ><td align=left><font face=arial color=black size=2><a style="color=blue;"  href=default.asp>Voltar</a></td></tr>

	</table>
<P>&nbsp;</P>
<script language=JavaScript>
var habilitado ;
habilitado = true;

function adicionar(valor, valcnf){
<% for g=(contador-1) to 1 step -1 %>
if (valor == <%=g%> && habilitado == true) {
	ndisc_<%=g%>.innerHTML = "<form name=frm action=operacao.asp method=get><table border=0 width=90% ><tr bgcolor=ccffdd><td valign=top width=30%><font face=arial color=black size=2>Disciplina:<br><%=disciplinas_texto%></td><td width=70%><font face=arial color=black size=2>Peso da prova: <input type=text size=2 name=peso><br>Questões Difíceis: <input type=text name=qd size=2><input type=hidden name=cod_conf_prova size=4><br>Questões Médias: <input type=text name=qm size=2><input type=hidden name=origem value=DISCIPLINA><br>Questões Fáceis: <input type=text name=qf size=2><input type=hidden value=INSERE name=comando> </td></tr><tr bgcolor=ccddff><td></td><td bgcolor=ccddff align=right><font face=arial color=black size=1><a style='color=blue;'  href=javascript:enviar(<%=g%>)>CADASTRAR DISCIPLINA</a> ou <a style='color=blue;'  href=javascript:fechar(<%=g%>)>FECHAR</font></a></td></tr></table></form>";
	document.frm.cod_conf_prova.value = valcnf;
	habilitado = false; 
}
<% next %>
}

function enviar(configuracao){
	if (document.frm.cod_conf_prova.value != "" && document.frm.cod_disciplina.value!= "" && document.frm.qd.value != "" && document.frm.qm.value != "" && document.frm.qf.value != "" && document.frm.peso.value != "" ){
		
		document.frm.submit();
		
	}else{
		window.alert('Verifique o preenchimento dos campos! Todos os campos são obrigatórios!');
	}
}
function fechar(valor){
<% for g=(contador-1) to 1 step -1 %>
if (valor == <%=g%>) {
	ndisc_<%=g%>.innerHTML = "";
	habilitado = true;
}
<% next %>
}

function adicionar_prova(){

if (habilitado == true) {

	habilitado = false;
	prova.innerHTML = "<form name=frm action=operacao.asp method=get><table border=0 width=100%><tr align=ffffff bgcolor=ccffdd align=center><td align=center><font face=arial color=black size=2>Descrição da Prova:<input type=text name=descricao size=15> Tempo minimo: <input type=text name=tempo_min size=3> Tempo máximo: <input type=text name=tempo_max size=3 > <br><input type=hidden value=INSERE name=comando><input type=hidden value=PROVA name=origem><input type=hidden name=cod_conf_exame value=<%=cod_Exame%>></td></tr><tr bgcolor=ccddff><td align=right><font face=arial color=black size=1><a style='color=blue;'  href=javascript:enviar_prova() >CADASTRAR PROVA</a> <a style='color=blue;'  href=javascript:fechar_prova() >FECHAR</a></td></tr></table></form>";

}

}
function enviar_prova(){

	if (document.frm.descricao.value != "" && document.frm.tempo_min.value != "" && document.frm.tempo_max.value != "") {
	
		document.frm.submit();

	}else{
		window.alert('Verifique o preenchimento dos campos');
	}
}
function fechar_prova(){

	habilitado = true;
	prova.innerHTML = "";

}
</script>
<!-- #include file="../footer.asp" -->
</BODY>
</HTML>
