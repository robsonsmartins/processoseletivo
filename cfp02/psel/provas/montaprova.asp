<%
  if session("logado") <> "SIM" then
    Response.Redirect("../candidato/logincandidato.asp")    
  end if
  dim codprova
  codprova = Request.QueryString("prova")
  if (session("cod_conf_prova") <> "") and (session("cod_conf_prova") <> codprova) then
    Response.Redirect("escolhaprova.asp")
  end if
  session("cod_conf_prova") = codprova
  dim acesso
  dim provades
  dim descricao
  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("select descricao from conf_prova where cod_conf_prova = "&codprova)
  set provades = acesso.openSQL
  descricao = provades.Fields("descricao")
  session("desc_prova") = descricao
  dim provaman
  dim prova
  set provaman = createObject("ProcessoSeletivo.ProvaManager")
  dim provacriada
  acesso.setSQL("select 0 as nada from prova where cod_conf_prova = "&codprova&" and cod_candidato = "&session("cod_candidato"))
  set provacriada = acesso.openSQL
  if provacriada.Eof then
    set prova = provaman.CriarProva(cint(session("cod_candidato")),cint(codprova))
  else
    set prova = provaman.GetProva(cint(session("cod_candidato")),cint(codprova))
  end if  
  set session("prova") = prova
  session("questao") = 1
  dim notaprova
  acesso.setSQL("select 0 as nada from nota_prova where cod_conf_prova = "&codprova&" and cod_candidato = "&session("cod_candidato"))
  set notaprova = acesso.openSQL
  if notaprova.Eof then
    acesso.setSQL("insert into nota_prova (cod_candidato, cod_conf_prova, nota, hora_inicio) values ("&session("cod_candidato")&", "&codprova&", 0, '"&time&"')")
    acesso.openSQL
  end if
  acesso.setSQL("select hora_inicio from nota_prova where cod_conf_prova = "&codprova&" and cod_candidato = "&session("cod_candidato"))
  set notaprova = acesso.openSQL
  session("hora_inicio") = notaprova.Fields("hora_inicio")
  acesso.setSQL("select tempo_min, tempo_max from conf_prova where cod_conf_prova = "&codprova)
  set notaprova = acesso.openSQL
  
  dim hora
  dim minuto
  dim tempo
  tempo = cint(notaprova.Fields("tempo_min"))
  hora = cint(tempo\60)          
  minuto = tempo - hora * 60
  tempo = cstr(hora)&":"&cstr(minuto)&":00"
  session("tempo_min") = tempo

  tempo = cint(notaprova.Fields("tempo_max"))
  hora = cint(tempo\60)          
  minuto = tempo - hora * 60
  tempo = cstr(hora)&":"&cstr(minuto)&":00"
  session("tempo_max") = tempo
  
  Response.Redirect("prova.asp")
%>

