<%@ Language=VBScript %>
<OBJECT id="fuFile" progid="ASPFileUpload.File" runat="server" VIEWASTEXT></OBJECT>
<%
  '//////////////////////////////////////////////////////////////////////////////////
  '//  ASPFileUpload.File API
  '//  
  '//  Properties
  '//     FileName
  '//       - Read/Write 
  '//       - The file will be saved with this file name. 
  '//       - This property can only be set prior to calling Upload.
  '//       - If no value is specified, then the original file name
  '//       - in the HTTP post will be used.
  '//     
  '//     OverWrite
  '//       - Read/Write
  '//       - This property can only be set prior to calling Upload.
  '//       - If set to false and if the target file exists, an error
  '//       - is raised. The default value is False.
  '//     
  '//     Target 
  '//       - Read/Write
  '//       - The file will be written to this directory.
  '//       - This property can only be set prior to calling Upload.
  '//       - There is no default value for this property and it is required.
  '//   
  '//  Methods
  '//     Upload
  '//       - This method parses the HTTP Post and writes the file
  '//  
  '//  Other
  '//    - ASPFileUpload requires COM+
  '//    - Any call to the Request.Form() collection will cause the Upload
  '//      method to fail as the method references the Binary contents of the
  '//      Request object  through the Request.BinaryRead method. 
  '//    - Also, if you access a variable in the Request collection without 
  '//      specifying which subcollection it belongs to, the Request.Form collection 
  '//      may be searched, thus causing an error in the Upload method.
  '//      
  '//////////////////////////////////////////////////////////////////////////////////
  
  Dim strMsg 'As String
  
  On Error Resume Next
  dim loc_figura
  dim questao
  
  'set destination directory
  fuFile.Target = "C:\inetpub\wwwroot\psel\cadastros\figura\"
  fuFile.OverWrite = true
  fuFile.Upload
  
  loc_figura = fuFile.FileName 
  questao = session("cod_questao")
  
 'atualizacao do banco
 set objeto4 = createobject("ProcessoSeletivo.Acesso")
 objeto4.setSQL("UPDATE QUESTAO SET FIGURA = '" & loc_figura & "' WHERE COD_QUESTAO=" & questao)
 SET RESULT = OBJETO4.openSQL 

  
    strMsg = fuFile.FileName  & " was uploaded successfully."
    if session("origem") = "edita" then
		Response.Redirect("edita.asp?CODQUEST=" & questao)
	end if

%>