
<%

    Dim selecao 
    
    selecao = Request.querystring("selecao")
   
	Select Case selecao
		
		Case "diciplina"    
			
			Response.Redirect("disciplina.asp")
		
		Case "usuario"
		
		    Response.Redirect("usuario.asp")
		    
		Case "area"
		    
		    Response.Redirect("area.asp")
		
	End Select	
    
    
%>