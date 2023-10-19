<%

	dim usr
	dim pwd
	dim acesso
	dim cod_grupo
	dim objeto1
	dim registros1	
	usr = Request.Form("usr")
	pwd = Request.Form("pwd")
	

	 set objeto = createobject("ProcessoSeletivo.Acesso")
	 objeto.setSQL("Select *  from usuario Where(usr='"&usr&"')AND(pwd='"&pwd&"') ")
	 set registros = objeto.openSQL
     
     if registros.eof then
     
		Response.Redirect("login_.asp")
     
     end if
     
     cod_grupo = registros.Fields("cod_grupo")   
    session("usr") = registros.Fields("usr") 
    session("pwd") = registros.Fields("pwd") 


    if not registros.EOF then
           set objeto1 = createobject("ProcessoSeletivo.Acesso")
	       objeto1.setSQL("Select * from grupo Where cod_grupo="&cod_grupo&" ")
	       set registros1 = objeto1.openSQL  
          acesso = registros1.Fields("acesso")  
      
      if acesso = "prof" then
      'Acesso do professor, cadastra questoes 
      session("acesso") = acesso
      response.redirect("../questoes/disciplinas.asp")
      End if
      
      if acesso = "secret" then
      session("acesso") = acesso
      response.redirect("../secretaria/default.asp")
       
      End if

      if acesso = "adm" then
      session("acesso") = acesso 
      response.redirect("../cadastros/adm.asp")
      
      End if
      
   
   else
     session("acesso") = ""       
     response.redirect("login_.asp")          
   end if

%>



