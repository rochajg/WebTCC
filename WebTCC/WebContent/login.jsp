<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<h2>Login</h2>
	
	<form action="logar.jsp" method="post">
		<label for="login">Login: </label>
		<input type="text" name="login" placeholder="n� matricula ou login orientador" required/><br />
		
		<label for="senha">Senha: </label>
		<input type="password" name="senha" placeholder="********" required/><br />
		
		<input type="submit" value="Entrar" />
	</form>
</body>
</html>