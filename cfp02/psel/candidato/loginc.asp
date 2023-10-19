<%
  	dim loginc
  	dim provaja
  	dim provahoje
  	dim agenda
	dim inscricao, rg
	session("cod_conf_prova") = ""
	inscricao = Request.QueryString("inscricao")
	rg = Request.QueryString("rg")
	set acesso = createobject("ProcessoSeletivo.Acesso")
	acesso.setSQL("select cod_candidato, nome from candidato where inscricao = '" & inscricao & "' and rg = '" & rg & "'")
	set loginc = acesso.openSQL 
   if loginc.eof then
     Response.Redirect("logincandidato.asp?logado=nao")
   else
     session("cod_candidato") = loginc.Fields("cod_candidato")
     session("nome_candidato") = loginc.Fields("nome")
     session("logado") = "SIM"
     acesso.setSQL("select hora_fim from nota_prova where hora_fim is not null and cod_candidato = "&session("cod_candidato"))
     set provaja = acesso.openSQL
     provahoje = 0
     do until provaja.eof
       if cstr(cdate(int(provaja.Fields("hora_fim")))) = cstr(date) then
         provahoje = 1
         exit do
       end if
       provaja.MoveNext
     loop
     if provahoje = 1 then
       Response.Redirect("../provas/provaja.asp")
     end if
     acesso.setSQL("select r.hora, r.data from recurso r, agenda a where a.cod_recurso = r.cod_recurso and a.cod_candidato = "&session("cod_candidato"))
     set agenda = acesso.openSQL
     dim hoje
     dim agora
     hoje = 0
     agora = 0
     do until agenda.eof
       if agenda.Fields("data") = date then
         hoje = 1
       end if
       if agenda.Fields("hora") <= time then
         agora = 1
       end if
       agenda.MoveNext
     loop
     if (hoje = 0) or (agora = 0) then
       Response.Redirect("../provas/provaagenda.asp")
     else
       Response.Redirect("../provas/escolhaprova.asp")
     end if
  end if 

%>