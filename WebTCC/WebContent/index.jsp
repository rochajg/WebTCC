<%@page import="modelo.Orientador"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
	<h1>Página de teste como home</h1>
	
	<%
		if(session.getAttribute("Aluno") != null) {
			modelo.Aluno aluno = (modelo.Aluno) session.getAttribute("Aluno");
			%>
				<h2>Olá, <%= aluno.getNome() %></h2>
				<a href="logout.jsp">Sair</a>
			<%
		} else if(session.getAttribute("Orientador") != null) {
			modelo.Orientador orientador = (Orientador) session.getAttribute("Orientador");
			%>
				<h2>Olá, <%= orientador.getNome() %></h2>
				<a href="logout.jsp">Sair</a>
			<%
		} else {
			%>
				<h2>
					<a href="login.jsp">Fazer login</a>
				</h2>
			<%
		}
	%>
	
	<a href="cadastro-aluno.jsp">Cadastrar novo Aluno!</a>
	<a href="cadastro-orientador.jsp">Cadastrar Orientador!</a>
</body>
</html>