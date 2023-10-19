<%
'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if

  dim qtd, codcand
  dim i, j
  dim datas()
  dim acesso
  
  codcand = Request.QueryString("codcand")
  qtd = Request.QueryString("qtd")
  
  redim datas(0)
  for i = 1 to qtd
    redim preserve datas(ubound(datas) + 1)
    datas(ubound(datas)) = cint(Request.QueryString("DataHora"&i))
  next
  
  'valida se há algum campo vazio
  for i = 1 to ubound(datas)
    if datas(i) = 0 then
      Response.Redirect("agendacandidato.asp?codcand="&codcand& "&erro=1")
    end if
  next
  
  'valida se há campos iguais
  for i = 1 to ubound(datas) - 1
    for j = i + 1 to ubound(datas)
      if datas(i) = datas(j) then
        Response.Redirect("agendacandidato.asp?codcand="&codcand& "&erro=1")
      end if
    next
  next
  
  set acesso = createObject("ProcessoSeletivo.Acesso")
   
  'se houver agenda anterior, decrementa nro de alocados
  acesso.setSQL("update recurso set alocados=(alocados-1) where cod_recurso in (select a.cod_recurso from recurso r, agenda a where a.cod_recurso = r.cod_recurso and a.cod_candidato = "&codcand&")")
  acesso.openSQL
  'apaga agenda anterior
  acesso.setSQL("delete from agenda where cod_candidato = "&codcand)
  acesso.openSQL
  'grava nova agenda
  for i = 1 to ubound(datas)
    acesso.setSQL("insert into agenda (cod_candidato, cod_recurso) values ("&codcand&", "&datas(i)&")") 
    acesso.openSQL
    acesso.setSQL("update recurso set alocados=(alocados+1) where cod_recurso = "&datas(i))
    acesso.openSQL
  next
  Response.Redirect("listacandidato.asp")
%>