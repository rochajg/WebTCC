<%@page import="DAO.OrientadoresDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro Orientador</title>
</head>
<body>

	<form action="cad-ori.jsp" method="POST">
		<label for="nome">Nome:</label>
		<input type="text" name="nome" required /><br />
		
		<label for="curso">Curso:</label>
		<input type="text" name="curso" required /><br />
		
		<label for="login">Login:</label>
		<input type="text" name="login" required /><br /> 
		
		<label for="senha">Senha:</label>
		<input type="password" name="senha" id="senha" /><br />
		
		<input type="submit" value="Cadastrar!" required />
	</form>

</body>
</html>