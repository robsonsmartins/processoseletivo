    <%
    
    
    
    dim descricao
	dim objeto
	dim registro
    dim acesso
	descricao = Request.querystring("descricao")
	acesso    = Request.QueryString("acesso")
	set objeto = createobject("Processoseletivo.Acesso")
	set registros = createobject("ADODB.Recordset")
	objeto.setSQL ("INSERT INTO grupo (descricao,acesso)VALUES('"&descricao&"','"&acesso&"')")
	set registros = objeto.openSQL
	
    Response.Redirect ("grupo.asp")
    
    
    %>
    
    