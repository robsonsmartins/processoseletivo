<%@ Language=VBScript %>
<%

if NOT((session("acesso") = "prof") or (session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
end if


		'for each item in Request.QueryString 
		'	Response.Write item & "-" & Request.QueryString(item)
		'next
		'Response.End 

	if NOT(Request.QueryString ("comando") = "apaga") then

		dim processa
		set opera = createobject("ProcessoSeletivo.Questao")
		set quest = createobject("ProcessoSeletivo.dadosQuestao")


		dim cod_questao, enunciado, figura, alternativa_a, alternativa_b, alternativa_c
		dim alternativa_d, alternativa_e, gabarito, dificuldade, flag_sorteiopassado
		dim cod_disciplina, cod_divisao, cod_topico, cod_item, cod_usuario 
			
			
			'if (quest.figura <> "") then
			'' 	'Vamos pegar o nome do arquivo
			'	for g=len(quest.figura) to 1 step -1
			'		if mid(quest.figura ,g,1) = "\" then
			'			quest.figura = mid(quest.figura ,g+1,50)
			'			g = 1				
			'		end if
			'	next
			'end if
	
			quest.figura = request.querystring("figura")
			quest.cod_questao = request.querystring("cod_questao")
			quest.enunciado = request.querystring("enunciado")
			quest.alternativa_a = request.querystring("alternativa_a")
			quest.alternativa_b = request.querystring("alternativa_b")
			quest.alternativa_c = request.querystring("alternativa_c") 
			quest.alternativa_d = request.querystring("alternativa_d")
			quest.alternativa_e = request.querystring("alternativa_e")
			quest.gabarito = request.querystring("alternativa_correta")
			quest.dificuldade= request.querystring("cod_dificuldade")
			quest.flag_sorteiopassado = request.querystring("flag_sorteiopassado")
			quest.cod_disciplina= request.querystring("cod_disciplina")
			quest.cod_divisao = request.querystring("cod_divisao")
			quest.cod_topico = request.querystring("cod_topico")
			quest.cod_item= request.querystring("cod_item")
			quest.cod_usuario = request.querystring("cod_usuario")

			if quest.cod_questao <> "" then
				'Significa que iremos apenas ATUALIZAR um registro existente
				temp = opera.updatequestao(quest)
			else
				'Significa que iremos CRIAR UM NOVO REGISTRO!!!!
				temp = opera.setquestao(quest)			
			end if	
			
			Response.Redirect ("Listagem.asp?cod_topico=" & quest.cod_topico & "&cod_divisao=" & quest.cod_divisao)

			
	else
	
	
		'for each item in Request.QueryString 
		'	Response.Write item & "-" & Request.QueryString(item)
		'next
		'Response.End 
	

	
			COD_QUESTAO = request.querystring("cod_questao")
			cod_topico = request.querystring("cod_topico")
			cod_divisao = request.querystring("cod_divisao")
	
			if cod_questao <> "" then
	
				set opera = createobject("ProcessoSeletivo.Acesso")
				opera.setSQL("DELETE FROM QUESTAO WHERE COD_QUESTAO = " & COD_QUESTAO)
				obj2 = opera.execSQL
						
			end if

			
			Response.Redirect ("Listagem.asp?cod_topico=" & cod_topico & "&cod_divisao=" & cod_divisao)
	end if

%>