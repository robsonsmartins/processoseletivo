<%
'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if

  dim codrec
  dim acesso
  codrec = Request.QueryString("codrec")
  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("delete from agenda where cod_recurso = "&codrec)
  acesso.openSQL
  acesso.setSQL("delete from recurso where cod_recurso = "&codrec)
  acesso.openSQL
  Response.Redirect("listarecurso.asp")
%>

