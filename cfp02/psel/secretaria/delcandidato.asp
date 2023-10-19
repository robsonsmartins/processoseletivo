<%
'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if

  dim codcand
  dim acesso
  codcand = Request.QueryString("codcand")
  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("delete from agenda where cod_candidato = "&codcand)
  acesso.openSQL
  acesso.setSQL("delete from candidato where cod_candidato = "&codcand)
  acesso.openSQL
  Response.Redirect("listacandidato.asp")
%>

