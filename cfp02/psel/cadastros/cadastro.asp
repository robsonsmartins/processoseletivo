<%
 	dim descricao
	dim objeto
	dim registro
    dim origem
    dim acesso
    dim nome
    dim email
    dim telefone
    dim usr
    dim pwd
    dim cod_grupo
    dim cod_divisao
    dim disciplina
    
    origem      = Request.querystring("origem")
    descricao   = Request.querystring("descricao")
    acesso      = Request.QueryString("acesso")
    nome        = Request.QueryString("nome") 
    email       = Request.QueryString("email")
    telefone    = Request.QueryString("telefone")
    usr         = Request.QueryString("usr")
    pwd         = Request.QueryString("pwd")
    cod_grupo   = Request.QueryString("cod_grupo")
    cod_divisao = Request.QueryString("cod_divisao")
    disciplina  = Request.QueryString("disciplina")	

	session("nome_disc") = Request.QueryString("nome_disc")	    	  
	session("nome_div") = Request.QueryString("nome_div")	    
	session("link") = Request.QueryString("link")
	
     Select Case origem
       
       Case "disciplina"
           set objeto = createobject("Processoseletivo.Acesso")
	       set registros = createobject("ADODB.Recordset")
		   objeto.setSQL ("INSERT INTO DISCIPLINA (descricao)VALUES('"&descricao&"')")
           set registros = objeto.openSQL
     	   Response.Redirect("disciplina.asp")
     	   
       Case "area"	
		   set objeto = createobject("Processoseletivo.Acesso")
	       set registros = createobject("ADODB.Recordset")
		   objeto.setSQL ("INSERT INTO AREA (descricao)VALUES('"&descricao&"')")
           set registros = objeto.openSQL
		   Response.Redirect("area.asp")
		   
	   Case "grupo"
	      set objeto = createobject("Processoseletivo.Acesso")
	      set registros = createobject("ADODB.Recordset")
	      objeto.setSQL ("INSERT INTO grupo (descricao,acesso)VALUES('"&descricao&"','"&acesso&"')")
	      set registros = objeto.openSQL
	      Response.Redirect ("grupo.asp")
	      
	   Case "usuario"
	   
			grupo = session("grupo")
	   
	      set objeto = createobject("Processoseletivo.Acesso")
	      set registros = createobject("ADODB.Recordset")
	      objeto.setSQL ("INSERT INTO usuario (nome,email,telefone,usr,pwd,cod_grupo)VALUES('"&nome&"','"&email&"','"&telefone&"','"&usr&"','"&pwd&"','"&cod_grupo&"')")
	      set registros = objeto.openSQL
	      Response.Redirect ("usuario.asp?grupo=" & grupo)
	      
	   Case "divisao"
          set objeto = createobject("Processoseletivo.Acesso")
	      set registros = createobject("ADODB.Recordset")
		  objeto.setSQL ("INSERT INTO divisao (descricao, cod_disciplina)VALUES('"&descricao&"','" & disciplina & "')")
          set registros = objeto.openSQL
     	  Response.Redirect("divisao.asp?disciplina=" & disciplina)
     	       	  
       Case "topico"
          set objeto = createobject("Processoseletivo.Acesso")
	      set registros = createobject("ADODB.Recordset")
		  objeto.setSQL ("INSERT INTO topico (descricao,cod_divisao)VALUES('"&descricao&"','"&cod_divisao&"')")
          set registros = objeto.openSQL
     	  Response.Redirect("topico.asp?disciplina=" & disciplina & "&divisao=" & cod_divisao)       	  
 
	 end select		    
%>