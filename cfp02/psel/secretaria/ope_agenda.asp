<%
	cod_candidato=Request.QueryString("cod_candidato")
	cod_recurso=Request.Querystring("cod_recurso")
	operacao = request.querystring("operacao")
	
	
	select case operacao

	case "cancelar"
	
		
	
	case else
	
	end select

	response.redirect("agendacandidato.asp")

%>