<%@ Language=VBScript %>
<%

	dim executivo
	set objeto = createobject("ProcessoSeletivo.ExameConfiguracao")

	dim cod_conf_exame
	dim cod_disciplina
	dim cod_conf_prova
	dim qd, qm, qf, peso, tempo_min, tempo_max
	dim descricao
	dim ano, semestre, cod_area
	
	
	'for each item in Request.querystring
	'	Response.Write item & " - "& Request.querystring(item) & "<br>"
	'next 

	'Response.End 
	
			cod_conf_exame = Request.querystring("cod_conf_exame")
			cod_disciplina = Request.querystring("cod_disciplina")
			cod_conf_prova = Request.querystring("cod_conf_prova")
			qd = Request.querystring("qd")
			qm = Request.querystring("qm")
			qf = Request.querystring("qf") 
			peso = Request.querystring("peso")
			tempo_min = Request.querystring("tempo_min")
			tempo_max = Request.querystring("tempo_max")
			descricao = Request.querystring("descricao")
			ano = Request.querystring("ano")
			semestre = Request.querystring("semestre")
			cod_area = Request.querystring("cod_area")
	
	select case Request.querystring("comando")
	
	case "INSERE"
	
		select case Request.querystring("origem")
		
		case "EXAME"    
			if ((ano <>"") and (semestre <>"") and (descricao <>"") and (cod_Area <> "" )) then
				objeto.setNewConfExame ano, semestre, descricao,cod_area
			end if
			Response.Redirect("default.asp" )
		
		case "PROVA"
			if ((tempo_min <> "" ) and (tempo_max <> "") and (descricao <> "") and (cod_conf_exame <> "" )) then
				objeto.setNewConfProva tempo_min, tempo_max, descricao, cod_conf_exame
			end if
			Response.Redirect("mostraexame.asp?exame=" & session("cod_Exame") )

		case "DISCIPLINA"
			if ((cod_disciplina <> "") and (qd <> "") and (qm <> "") and(qf <> "") and(peso <> "") and (cod_conf_prova <> ""))then	
				objeto.setNewProvaDisc cod_disciplina, qd,qm,qf,peso,cod_conf_prova
			end if
			Response.Redirect("mostraexame.asp?exame=" & session("cod_Exame") )
		case "MTEMPO"

				set objeto2 = createobject("ProcessoSeletivo.Acesso")
				objeto2.setSQL("update conf_prova set tempo_min = " & tempo_min & ", tempo_max = " & tempo_max & " where cod_conf_prova = " & cod_conf_prova )
				set conf_prova = objeto2.openSQL 

			Response.Redirect ("mostraexame.asp?exame=" & session("cod_exame"))

		case ELSE
			Response.Redirect ("default.asp")	

		end select	
	
	case "APAGA"
	
		select case Request.querystring("origem")
		
		case "EXAME"
			if (cod_conf_exame <> "") then
				executivo = objeto.delConfExame(cod_conf_exame)
			end if
			Response.Redirect("default.asp" )

		case "PROVA"
			if (cod_conf_prova <> "") then
				executivo = objeto.delConfProva (cod_conf_prova)
			end if
			Response.Redirect("mostraexame.asp?exame=" & session("cod_Exame") )

		case "DISCIPLINA"
			if (cod_conf_prova <> "") and (cod_disciplina) then
				executivo = objeto.delProvaDisc (cod_conf_prova,cod_disciplina)
			end if
			Response.Redirect("mostraexame.asp?exame=" & session("cod_Exame") )

		case ELSE
			Response.Redirect ("default.asp")	
		end select	

	case else
		Response.Redirect ("default.asp")
	end select
	



%>