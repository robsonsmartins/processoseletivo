<%
  dim sql
  dim objeto
  dim cod_area
  dim disciplina
  dim cod_divisao
  dim cod_grupo
  dim cod_usuario
  dim cod_topico  

   cod_area       = Request.QueryString("cod_area")
   cod_disciplina = Request.QueryString("cod_disciplina")
   cod_grupo      = Request.QueryString("cod_grupo")
   cod_usuario    = Request.QueryString("cod_usuario")
   cod_divisao    = Request.QueryString("cod_divisao")
   cod_topico     = Request.QueryString("cod_topico")
   
	session("nome_disc") = Request.QueryString("nome_disc")	    	  
	session("nome_div") = Request.QueryString("nome_div")	    
	session("link") = Request.QueryString("link")

   if (cod_area <> "") then
     set objeto = createobject("ProcessoSeletivo.Acesso")
	 objeto.setSQL("Delete from AREA Where cod_area ="&cod_area&"")
	 set sql = objeto.openSQL
     Response.Redirect("area.asp")
   end if  
   
   if (cod_disciplina <> "") then
     set objeto = createobject("ProcessoSeletivo.Acesso")
	 objeto.setSQL("Delete from DISCIPLINA Where cod_disciplina ="&cod_disciplina&"")
	 set sql = objeto.openSQL
     Response.Redirect("disciplina.asp")
   end if
   
   if (cod_grupo <> "") then
     set objeto = createobject("ProcessoSeletivo.Acesso")
  '   objeto.setSQL("Select * from usuario,grupo Where grupo.cod_grupo = usuario.cod_usuario")
  '    if () then     
      objeto.setSQL("Delete from grupo Where cod_grupo ="&cod_grupo&"")
	   set sql = objeto.openSQL
       Response.Redirect("grupo.asp")
    '  else
    '   mensagem de erro!!!
    '  end if
   end if  
   
   if (cod_usuario <> "") then
   
	grupo = session("grupo")
   
     set objeto = createobject("ProcessoSeletivo.Acesso")
	 objeto.setSQL("Delete from usuario Where cod_usuario ="&cod_usuario&"")
	 set sql = objeto.openSQL
     Response.Redirect("usuario.asp?grupo=" & grupo)
   end if
   
   if (cod_divisao <> "") then
   
      disciplina = session("disciplina")
		
     set objeto = createobject("ProcessoSeletivo.Acesso")
 '   objeto.setSQL("Select * from divisao,topico Where divisao.cod_divisao = topico.cod_topico"    
 '   if ()then
     objeto.setSQL("Delete from divisao Where cod_divisao ="&cod_divisao&"")
     set sql = objeto.openSQL
     Response.Redirect("divisao.asp?disciplina=" & disciplina)
 '   else
 '   mensagem de erro!!!
 '   end if 
   end if
   
     if (cod_topico <> "") then
     
        disciplina = session("disciplina")
		divisao = session("divisao")
   
     set objeto = createobject("ProcessoSeletivo.Acesso")
	 objeto.setSQL("Delete from topico Where cod_topico ="&cod_topico&"")
	 set sql = objeto.openSQL
     Response.Redirect("topico.asp?disciplina=" & disciplina & "&divisao=" & divisao)
   end if    
	
%>

