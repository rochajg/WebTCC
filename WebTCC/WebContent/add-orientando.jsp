<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<title>Adicionar Orientando</title>
</head>
<body>
	<form action="add-ori.jsp" method="post">
		<label for="matricula">Matricula: </label><br />
		<input type="text" name="matricula" required /><br />
		
		<input type="submit" value="Adicionar" />
		<a href="pg-orientador.jsp"><input type="button" value="Cancelar" /></a>
		
	</form>
	
	<footer>
		Indie Atom Tecnologies&copy;
	</footer>

</body>
</html>