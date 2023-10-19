<%
  if session("logado") <> "SIM" then
    Response.Redirect("../candidato/logincandidato.asp")    
  end if
  
  dim operacao
  dim prova
  dim provaman
  dim resposta
  dim acesso
  dim selq
  dim i
  operacao = Request.QueryString("operacao")
  resposta = Request.QueryString("alternativas")
  set prova = session("prova")
  selq = cint(session("questao"))
  if cdate(cdate(session("tempo_max")) + cdate(session("hora_inicio"))) < time then
    operacao = "FINALIZAR"
  end if
  if operacao = "PROXIMA" then
    if cint(session("questao")) < prova.Count then
      session("questao") = cint(session("questao")) + 1
    end if
  end if
  if operacao = "ANTERIOR" then
    if cint(session("questao")) > 1 then
      session("questao") = cint(session("questao")) - 1
    end if
  end if
  if operacao = "QUESTAO" then
    session("questao") = cint(Request.QueryString("questao"))
  end if
  if operacao = "NRESP" then
    session("questao") = cint(Request.QueryString("nresp"))
  end if
  if operacao = "DISCIPLINA" then
    for i = 1 to prova.count 
      if prova(i).cod_disciplina = cint(Request.QueryString("disciplina")) then
        session("questao") = i
        exit for
      end if
    next
  end if
  if operacao = "FINALIZAR" then
    set acesso = createObject("ProcessoSeletivo.Acesso")
    acesso.setSQL("update nota_prova set hora_fim = '"&cstr(now)&"' where cod_conf_prova = "&session("cod_conf_prova")&" and cod_candidato = "& session("cod_candidato"))
    acesso.openSQL
    set acesso = nothing
    set provaman = createObject("ProcessoSeletivo.ProvaManager")
    provaman.CorrigirProva cint(session("cod_candidato")), cint(session("cod_conf_prova"))
    set provaman = nothing
    Response.Redirect("provaok.asp")
  end if
  if resposta <> "" then
    set acesso = createObject("ProcessoSeletivo.Acesso")
    acesso.setSQL("update prova set resposta = '"& resposta & "' where cod_conf_prova = " & session("cod_conf_prova") & " and cod_candidato = " & session("cod_candidato") & " and cod_questao = " & prova(selq).cod_questao)
    acesso.OpenSQL
    set acesso = nothing
  end if
  Response.Redirect("prova.asp")
%>