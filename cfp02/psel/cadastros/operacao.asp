<%
	if NOT((session("acesso") = "adm"))  then
	Response.Redirect ("../login/login_e.asp")
	end if

 	dim descricao
	dim objeto
	dim registro
	dim operacao 
	
	operacao = Request.querystring("operacao")
	
	Select case "operacao"

	  case operacao = "area"
	   descricao = Request.querystring("descricao")
	   set objeto = createobject("Processoseletivo.Acesso")
	   set registros = createobject("ADODB.Recordset")
	   objeto.setSQL ("INSERT INTO DISCIPLINA (descricao)VALUES('"&descricao&"')")
	   set registros = objeto.openSQL
       Response.Redirect ("area.asp")
      end Select 
%>