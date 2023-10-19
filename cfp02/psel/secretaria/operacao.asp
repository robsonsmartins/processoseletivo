<%
'	if session("LOGADO") <> "VERDADEIRO"  then
'		Response.Redirect("../Login_.html")
'	end if

	dim nome, endereco, cidade, telefone, rg, codexame
	dim nascimento, sexo, bairro, estado, cep, email, cpf
	dim codcand
	dim operacao
	dim inscricao
	dim candobj 
	dim sql
	dim candrec
	
	codcand = request.QueryString("codcand")
	nome = request.QueryString("nome")
	endereco = request.QueryString("endereco")
	cidade = request.QueryString("cidade")
	telefone = request.QueryString("telefone")
	rg = request.QueryString("rg")
	codexame = request.QueryString("exame")
	nascimento = request.QueryString("nascimento")
	sexo = request.QueryString("sexo")
	bairro = request.QueryString("bairro")
	estado = request.QueryString("estado")
	cep = request.QueryString("cep")
	email = request.QueryString("email")
	cpf = request.QueryString("cpf")
	operacao = request.QueryString("operacao")
	
	set objeto = createobject("ProcessoSeletivo.Acesso")
	set candobj = createobject("ProcessoSeletivo.Candidato")
	inscricao = candobj.GetInscricao
	
   if operacao = "INSERT" then
     sql = "insert into candidato (nome,endereco,bairro,cidade,estado,cep,telefone,email,sexo,nascimento,rg,cpf,data_cadastro,inscricao,cod_conf_exame) values ("
     sql = sql & "'" & nome & "','" & endereco & "','" & bairro & "','" & cidade & "','" & estado & "','" & cep & "','" & telefone & "','" & email & "','" & sexo
     sql = sql & "','" & nascimento & "','" & rg & "','" & cpf & "','" & date & "','" & inscricao & "','" & codexame & "')" 
   else
     sql = "update candidato set nome='"&nome&"',endereco='"&endereco&"',bairro='"&bairro&"',cidade='"&cidade&"',estado='"&estado&"',cep='"&cep&"',telefone='"&telefone
     sql = sql & "',email='"&email&"',sexo='"&sexo&"',nascimento='"&nascimento&"',rg='"&rg&"',cpf='"&cpf&"',cod_conf_exame='"&codexame&"' where cod_candidato="&codcand
   end if
   objeto.setSQL(sql)
   objeto.openSQL    
   if operacao = "INSERT" then
     objeto.setSQL("select cod_candidato from candidato where inscricao = '"&inscricao&"'")
     set candrec = objeto.openSQL
     codcand = candrec.Fields("cod_candidato")
   end if
   set objeto = nothing
   set candobj = nothing
   set candrec = nothing
   Response.Redirect("agendacandidato.asp?codcand="&codcand) 
%>