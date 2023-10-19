<%
	if NOT((session("acesso") = "secret") or (session("acesso") = "adm")) then
		Response.Redirect("../login/login_e.asp")
	end if
%>

<script language="JavaScript">
  function envia() {
    if (document.frm.nome.value != "" && document.frm.endereco.value != "" && document.frm.cidade.value != "" && 
        document.frm.telefone.value != "" && document.frm.rg.value != "" && document.frm.nascimento.value != "" &&
        document.frm.bairro.value != "" && document.frm.estado.value != "" && document.frm.cep.value != "" &&
        document.frm.email.value != "" && document.frm.cpf.value != "" && document.frm.exame.value != "0"){
	
		document.frm.submit();
		
	}
	else
	{
		window.alert('Verifique o preenchimento de todos os campos!');
	}
  }
</script>
<%

	dim candidato
	dim exame
	dim nome, endereco, cidade, telefone, rg, codexame
	dim nascimento, sexo, bairro, estado, cep, email, cpf, inscricao
	dim codcand
	dim operacao
	
	codcand = request.QueryString("codcand")
	
	set objeto = createobject("ProcessoSeletivo.Acesso")
	operacao = "INSERT"
	if codcand <>  "" then 
		operacao = "UPDATE"
		objeto.setSQL("select * from candidato where cod_candidato = " &codcand)
     	set candidato = objeto.openSQL 	
	  	nome = candidato.Fields("nome") 
		endereco = candidato.Fields("endereco") 
		cidade = candidato.Fields("cidade") 
		telefone = candidato.Fields("telefone") 
		rg = candidato.Fields("rg") 
		codexame = candidato.Fields("cod_conf_exame") 
		nascimento = candidato.Fields("nascimento") 
		sexo = candidato.Fields("sexo") 
		bairro = candidato.Fields("bairro") 
		estado = candidato.Fields("estado") 
		cep = candidato.Fields("cep") 
		email = candidato.Fields("email") 
		cpf = candidato.Fields("cpf") 
		inscricao = candidato.Fields("inscricao")
	end if	
	objeto.setSQL("select cod_conf_exame, descricao from conf_exame ")
	set exame = objeto.openSQL 
%>
<html>

<head>
<title>Cadastro de Candidatos</title>
</style>
</head>

<!-- #include file="header.asp" -->
<centeR>
<form method="GET" action="operacao.asp" onSubmit="" name="frm">
  <table border="0" width="734" height="219" cellspacing="0">
    <tr>
      <td width="240" height="23" ><font size="2" face="Arial"><b>Nome</b></font></td>
      <td width="538" height="23" ><font size="2" face="Arial"><input type="text" name="nome" size="36" value = "<%=nome%>" maxlength="50"></font></td>
      <td width="68" height="23" ><font size="2" face="Arial"><b>D.Nasc.<br>
        </b>(</font><font face="Arial" size="1">dd/mm/aaaa)</font></td>
      <td width="88" height="23" ><font size="2" face="Arial"><input type="text" name="nascimento" size="10" value = "<%=nascimento%>" maxlength="10"></font></td>
      <td width="64" height="23" ><font size="2" face="Arial"><b>Sexo</b></font></td>
      <td width="178" height="23" ><font size="2" face="Arial"><select size="1" name="sexo">
          <option value = "M" <% if sexo = "M" then
          response.write "selected"
          end if%>>Masculino</option>
          <option value = "F" <% if sexo = "F" then
          response.write "selected"
          end if%>>Feminino</option>
        </select></font></td>
    </tr>
    <tr>
      <td width="240" height="23" ><font size="2" face="Arial"><b>Endereço</b></font></td>
      <td width="538" height="23" ><font size="2" face="Arial"><input type="text" name="endereco" size="36" value = "<%= endereco%>" maxlength="100"></font></td>
      <td width="68" height="23" ><font size="2" face="Arial"><b>Bairro&nbsp;&nbsp;</b></font> </td>
      <td width="175" colspan="3" height="23" ><font size="2" face="Arial"><input type="text" name="bairro" size="26" value = "<%=bairro%>" maxlength="20"></font></td>
    </tr>
    <tr>
      <td width="240" height="23" ><font size="2" face="Arial"><b>Cidade</b></font></td>
      <td width="538" height="23" ><font size="2" face="Arial"><input type="text" name="cidade" size="36" value = "<%=cidade%>" maxlength="20"></font></td>
      <td width="68" height="23" ><font size="2" face="Arial"><b>UF</b></font></td>
      <td width="88" height="23" ><font size="2" face="Arial"><input type="text" name="estado" size="5" value = "<%=estado%>" maxlength="2"></font></td>
      <td width="64" height="23" ><font size="2" face="Arial"><b>CEP</b></font></td>
      <td width="178" height="23" ><font size="2" face="Arial"><input type="text" name="cep" size="13" value = "<%=cep%>" maxlength="9"></font></td>
    </tr>
    <tr>
      <td width="240" height="23" ><font size="2" face="Arial"><b>Telefone</b></font></td>
      <td width="538" height="23" ><font size="2" face="Arial"><input type="text" name="telefone" size="36" value="<%=telefone%>" maxlength="20"></font></td>
      <td width="68" height="23" ><font size="2" face="Arial"><b>E-mail</b></font></td>
      <td width="175" colspan="3" height="23" ><font size="2" face="Arial"><input type="text" name="email" size="34" value = "<%=email%>" maxlength="20"></font></td>
    </tr>
    <tr>
      <td width="240" height="23" ><font size="2" face="Arial"><b>RG</b></font></td>
      <td width="538" height="23" ><font size="2" face="Arial"><input type="text" name="rg" size="36" value = "<%=rg%>" maxlength="20"></font></td>
      <td width="68" height="23" ><font size="2" face="Arial"><b>CPF</b></font></td>
      <td width="175" colspan="3" height="23" ><font size="2" face="Arial"><input type="text" name="cpf" size="34" value = "<%=cpf%>" maxlength="11"></font></td>
    </tr>
    <tr>
      <td width="240" height="19" >
        <p><font size="2" face="Arial"><b>Opção de Exame</b></font>
      </td>
      <td width="538" height="19" >
        <font size="2" face="Arial"><select size="1" name="exame">
             <option value = "0">Selecione...</option>   
              <% do while not exame.eof %>
                <option <% if exame.fields("cod_conf_exame") = codexame then
                             Response.Write "selected"
                           end if %> value="<%=exame.fields("cod_conf_exame")%>" > <%=exame.fields("descricao")%></option>
              <% exame.movenext
              loop%>
              </select>
        </font>
      </td>
      <td width="270" colspan="4" align="center"  rowspan="2">
        <p align="left">&nbsp;
        <p align="left"><font size="2" face="Arial"> <b><a style="color=blue; size=3;" href="javascript:envia()">Gravar</a>&nbsp;&nbsp;
        <a style="color=blue; size=3;" href="listacandidato.asp">Cancelar</a></b></font>
        <input type="hidden" name="operacao" size="20" value="<%=operacao%>">
        <input type="hidden" name="codcand" size="20" value="<%=codcand%>">
      </td>
    </tr>
    <tr>
      <td width="240" height="23" ><font size="2" face="Arial"><b>Inscrição</b></font></td>
      <td width="538" height="23" ><b><font size="2" face="Arial" color="#FF0000">
          <% if inscricao > 0 then
               Response.Write inscricao
             else
               Response.Write "Novo Candidato"  
             end if %>
        </font></b></td>
    </tr>
  </table>
</form>
<!-- #include file="../footer.asp" -->
</body>

</html>
