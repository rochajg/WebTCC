<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<title>Cadastro Aluno</title>
</head>
<body>
	<h2>Cadastrar Aluno</h2>
	
	<form action="cad-aluno.jsp" method="post">
	
		<label for="matricula">Matricula: </label><br />
		<input type="text" name="matricula" required /><br />
		
		<label for="nome">Nome: </label><br />
		<input type="text" name="nome" required /><br />
		
		<label for="curso">Curso: </label><br />
		<input type="text" name="curso" required/><br />
		
		<label for="campus">Campus: </label><br />
		<input type="text" name="campus" required/><br />
		
		<label for="turma">Turma: </label><br />
		<input type="text" name="turma" required/><br />
		
		<label for="anoSemestre">Ano.Semestre: </label><br />
		<input type="text" name="anoSemestre" placeholder="2018.1" required/><br />
		
		<label for="tituloTCC">Titulo do TCC: </label><br />
		<input type="text" name="tituloTCC" /><br />
		
		<label for="senha">Senha: </label><br />
		<input type="password" name="senha" required /><br />
		
		<input type="submit" value="Cadastrar!" />
	
	</form>
	
</body>
</html>