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
  
  'set destination directory
  fuFile.Target = "C:\INETPUB\WWWROOT\PSEL\CADASTROS\FIGURA\"
  fuFile.Upload
  
  If Err.number = 0 Then
    strMsg = fuFile.FileName  & " was uploaded successfully."
  Else
    strMsg = "An error occurred uploading your file: " & Err.Description 
  End If
%>
<html>
<head></head>
<body>
<%=strMsg%>
</body>
</html>