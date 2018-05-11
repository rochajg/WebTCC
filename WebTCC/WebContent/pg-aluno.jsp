<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="modelo.Aluno"%>
<%@ page import="DAO.AlunosDAO"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<title></title>
</head>
<body>
	
	<%
		Aluno aluno = (Aluno) session.getAttribute("Aluno");
	%>
	
	<h2>Olá, <%= aluno.getNome() %> </h2>
	<span style="float: right;padding-right:  50px;font-size: 1.2em;"><a href="logout.jsp">Sair</a></span>
	
	<h3>Título TCC: <%= aluno.getTituloTCC() %> </h3>
	
	<form action="gerarTermoAutoria.jsp" method="post">
		<a >Download do Termo de Responsabilidade De Autoria</a>
	</form>
	
	<footer>
		Indie Atom Tecnologies&copy;
	</footer>
</body>
</html>