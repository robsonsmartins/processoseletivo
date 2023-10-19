<%

	dim descricao
	dim objeto
	dim registro

	descricao = Request.querystring("descricao")
	set objeto = createobject("Processoseletivo.Acesso")
	set registros = createobject("ADODB.Recordset")
	objeto.setSQL ("INSERT INTO AREA (descricao)VALUES('"&descricao&"')")
	set registros = objeto.openSQL
    Response.Redirect ("area.asp")
%>