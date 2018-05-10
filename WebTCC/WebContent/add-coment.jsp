<%@page import="DAO.OrientadoresDAO"%>
<%@page import="modelo.Orientador"%>
<%@page import="modelo.Aluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserindo comentário...</title>
</head>
<body>
	
<%
	String observacao = request.getParameter("observacao");
	Aluno aluno = new Aluno(Integer.parseInt(request.getParameter("mat").toString()));
	Orientador ori = (Orientador) session.getAttribute("Orientador");
	
	OrientadoresDAO.adicionarObservacao(observacao, ori, aluno);
	
	%>
	<script>
		alert("Comentário adicionado com sucesso!");
		window.location = "pg-orientador.jsp";
	</script>
	<%

%>
	
</body>
</html>