<html>

<head>
<title>Processo Seletivo - Login do Candidato</title>
</head>

<!-- #include file="header.asp" -->

<form method="GET" action="loginc.asp" name="formlogin">
  <div align="center">
    <center>
    <table border="0" width="64%" bgcolor=#273f6f cellspacing="3">
      <tr>
        <td width="100%" colspan="2">
          <h4 align="center"><font face="Arial">Processo Seletivo - Login do
          Candidato</font></h4>
        </td>
      </tr>
    </center>
    <tr>
      <td width="35%" align="center">
        <p align="right"><font size=3 face="Arial">Inscrição:</font></td>
      <center>
      <td width="72%"><input type="text" name="inscricao" size="20"></td>
      </tr>
    </center>
    <tr>
      <td width="35%" align="center">
        <p align="right"><font size=3 face="Arial">RG:</font></td>
      <center>
      <td width="72%"><input type="password" name="rg" size="20"></td>
      </tr>
      <tr>
        <td width="107%" align="center" colspan="2">
          <font face="Arial" color="Red">
        <%
          if Request.QueryString("logado") = "nao" then
            Response.Write "Login incorreto!"
          end if
        %>
          </font>
        </td>
      </tr>
      <tr>
        <td width="107%" align="center" colspan="2"><input type="submit" value=" Login " name="B1"></td>
      </tr>
    </table>
    </center>
  </div>
  <p>&nbsp;</p>
</form>
<!-- #include file="../footer.asp" -->
</body>

</html>
