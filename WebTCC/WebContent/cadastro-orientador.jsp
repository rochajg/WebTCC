
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<title>Cadastro Orientador</title>
</head>
<body>
	<h2>Cadastrar Orientador</h2>

	<form action="cad-ori.jsp" method="POST">
		<label for="nome">Nome:</label><br />
		<input type="text" name="nome" required /><br />
		
		<label for="curso">Curso:</label><br />
		<input type="text" name="curso" required /><br />
		
		<label for="login">Login:</label><br />
		<input type="text" name="login" required /><br /> 
		
		<label for="senha">Senha:</label><br />
		<input type="password" name="senha" id="senha" /><br />
		
		<input type="submit" value="Cadastrar!"  />
		<a href="index.jsp"><input type="button" value="Cancelar" /></a>
	</form>

</body>
</html>