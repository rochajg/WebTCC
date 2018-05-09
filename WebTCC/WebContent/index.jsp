<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<title>Login</title>
</head>
<body>
	<h2>Login</h2>
	
	<form action="logar.jsp" method="post">
		<label for="login">Login ou Matricula: </label><br />
		<input type="text" name="login" required/><br />
		
		<label for="senha">Senha: </label><br />
		<input type="password" name="senha" placeholder="********" required/><br />
		
		<input type="submit" value="Entrar" /><br />
		
		<a href="cadastro-aluno.jsp"><p>Cadastrar novo Aluno</a>
		<a href="cadastro-orientador.jsp"><p>Cadastrar Orientador</a>
	</form>
	<footer>
		Indie Atom Tecnologies&copy;
	</footer>
</body>
</html>