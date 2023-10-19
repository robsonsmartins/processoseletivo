<%
'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if
%>

<html>


<!-- #include file="header.asp" -->
<%
  dim acesso
  dim cand
  dim nota
  dim qtdp
  dim confprova
  dim exame
  dim prova
  dim provaman
  dim codcand
  dim codprova
  exame = cint(Request.QueryString("exame"))
  set provaman = createObject("ProcessoSeletivo.ProvaManager")  
  set acesso = createObject("ProcessoSeletivo.Acesso")
  acesso.setSQL("select cod_candidato from candidato where cod_conf_exame = "&exame)
  set cand = acesso.openSQL
  acesso.setSQL("select cod_conf_prova from exame_prova where cod_conf_exame = "&exame)
  set confprova = acesso.openSQL
  acesso.setSQL("delete from nota_exame where cod_conf_exame = "&exame)
  acesso.openSQL
  do while not cand.eof
    codcand = cand.Fields("cod_candidato")
    confprova.MoveFirst
    nota = 0
    qtdp = 0
    do while not confprova.eof
      codprova = confprova.Fields("cod_conf_prova")
      acesso.setSQL("select 0 as nada from prova where cod_conf_prova = "&codprova&" and cod_candidato = "&codcand)
      set prova = acesso.openSQL
      if prova.eof then
        provaman.CriarProva cint(codcand),cint(codprova)
        acesso.setSQL("insert into nota_prova (cod_candidato, cod_conf_prova, nota, hora_inicio) values ("&codcand&", "&codprova&", 0, '"&time&"')")
        acesso.openSQL
        provaman.CorrigirProva cint(codcand),cint(codprova)
      end if
      acesso.setSQL("update nota_prova set hora_fim = '"&cstr(now)&"' where cod_conf_prova = "&codprova&" and cod_candidato = "& codcand&" and hora_fim is null")
      acesso.openSQL
      qtdp = qtdp + 1
      acesso.setSQL("select nota from nota_prova where cod_candidato = "&codcand&" and cod_conf_prova = "&codprova)
      set prova = acesso.openSQL
      if not prova.eof then
        nota = nota + prova.Fields("nota")
      end if
      confprova.MoveNext
    loop 
    acesso.setSQL("insert into nota_exame (cod_candidato,cod_conf_exame,nota_final) values ("&codcand&","&exame&",'"&cstr(nota/qtdp)&"')")
    acesso.openSQL
    cand.MoveNext
  loop
  set cand = nothing
  set prova = nothing
  set confprova = nothing
  set provaman = nothing
  
%>
<font size=arial size=3 color=#273f6f>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Exame Finalizado com sucesso!

<!-- #include file="../footer.asp" -->
</body>

</html>
