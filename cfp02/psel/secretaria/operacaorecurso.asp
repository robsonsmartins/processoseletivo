<%
'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if

	dim descricao, data, hora, total, codrec
	dim operacao
	dim sql
	
	codrec = request.QueryString("codrec")
	descricao = request.QueryString("descricao")
	data = request.QueryString("data")
	hora = request.QueryString("hora")
	total = request.QueryString("total")
	operacao = request.QueryString("operacao")
	
	set objeto = createobject("ProcessoSeletivo.Acesso")
	
   if operacao = "INSERT" then
     sql = "insert into recurso (descricao, data, hora, total, alocados) values ('"
     sql = sql & descricao & "','" & data & "','" & hora & "'," & total & ",0)"
   else
     sql = "update recurso set descricao = '" & descricao & "', data = '" & data  
     sql = sql & "', hora = '" & hora & "', total = " & total & " where cod_recurso = " & codrec 
   end if
   objeto.setSQL(sql)
   objeto.openSQL    
   set objeto = nothing
   Response.Redirect("listarecurso.asp") 
%>