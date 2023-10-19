<%@ Language=VBScript %>
<% inscr = Request.QueryString("codigo")

  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("select * from candidato, conf_exame where (conf_exame.cod_conf_exame = candidato.cod_conf_exame) and inscricao = '" & inscr & "'" )
  set cand = acesso.openSQL

	if cand.eof then
	
		Response.Write("<HTML><BODY onload='javascript:window.close();'>...</BODY></HTML>")
		Response.End 
		
	end if

  set acesso2 = createObject("ProcessoSeletivo.Acesso")
  acesso2.setSQL("select data, hora, descricao from agenda, recurso where (recurso.cod_recurso = agenda.cod_recurso) and agenda.cod_candidato = " & cand.fields("cod_candidato") )
  set rec = acesso2.openSQL
  

%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY leftmargin=0 rightmargin=0 topmargin=0>
<table border=0 width=100% cellspacing=5>
<tr><td align=right ><table border=0 width=100%><tr><td valign=top align=left><font color=black size=5 face=arial><b>Comprovante de Inscrição</b></font><br><br>&nbsp;&nbsp;&nbsp;&nbsp;Curso:&nbsp;&nbsp;<b><font face=arial size=3><%=cand.fields("descricao")%></font></b></td><td align=right><img src="../images/logo.gif" border=0 width=150 height=120></td></tr></table></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Data da Inscrição:&nbsp;&nbsp;<B><%="Data: " & cand.fields("data_cadastro")%></b>&nbsp;&nbsp;Código:&nbsp;&nbsp;<font size=4><b><%=cand.fields("inscricao")%></b></font></td></tr>
<tr><td align=left bgcolor=black><font color=black size=2 face=arial></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Nome do candidato:&nbsp;&nbsp;<b><%=cand.fields("Nome")%></b></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Endereço:&nbsp;&nbsp;<b><%=cand.fields("endereco")%></b></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Bairro/Cidade:&nbsp;&nbsp;<b><%=cand.fields("bairro") & "/" & cand.fields("cidade")%></b></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Cep:&nbsp;&nbsp;<b><%=cand.fields("cep")%></b></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Telefone:&nbsp;&nbsp;<b><%=cand.fields("telefone")%></b></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Nascimento:&nbsp;&nbsp;<b><%=cand.fields("nascimento")%></b></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Cpf:&nbsp;&nbsp;<b><%=cand.fields("cpf")%></b>&nbsp;&nbsp;Rg:&nbsp;&nbsp;<b><%=cand.fields("rg")%></b></td></tr>
<tr><td align=left bgcolor=black><font color=black size=2 face=arial></td></tr>
<tr><td align=left><font color=black size=2 face=arial>Datas das Provas agendadas:</td></tr>

<% do while not(rec.eof)%>

<tr><td align=left><font color=black size=4 face=arial>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=day(rec.fields("data")) & "/" & month(rec.fields("data")) & "/" & year(rec.fields("data")) & ", às " & rec.fields("hora") & " - Local: " & rec.fields("descricao")%> </td></tr>

<% 
		rec.movenext
	loop %>
<tr><td align=left bgcolor=black><font color=black size=2 face=arial></td></tr>
<tr><td align=center><font color=black size=4 face=arial>É obrigatória a apresentação deste comprovante para a realização das provas.</td></tr>

<tr><table border=0 width=100%><td align=left bgcolor=black><font color=black size=2 face=arial><a style="color=white; font-face:arial;" href=javascript:window.close();>Fechar esta janela</a></td><td bgcolor=black ALIGN=RIGHT><a style="color=white; font-face:arial;" href=javascript:window.print();>Imprimir comprovante</a></td></tr></table>
</td></tr>


</table>
</BODY>
</HTML>
