<%@page import="DAO.AlunosDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<jsp:useBean class="modelo.Alunos" id="aluno"/>
<jsp:useBean class="modelo.Orientadores" id="orientador"/>

<%@ page import="java.sql.ResultSet, java.sql.SQLException" %>

<%
	ResultSet login;

	try {
		aluno.setMatricula(Integer.parseInt(request.getParameter("login")));
		aluno.setSenha(request.getParameter("senha"));
		
		login = DAO.AlunosDAO.login(aluno);
		
		try {		
			if(login.next()) {
				session.setAttribute("Aluno", aluno);
				response.sendRedirect("index.jsp");
			} else {
				%>
				<script>
					alert("ERRO! Usuário ou senha incorretos.");
					window.location = "login.jsp"
				</script>
				<%
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	} catch(NumberFormatException nfe) {
		orientador.setLogin(request.getParameter("login"));
		orientador.setSenha(request.getParameter("senha"));
		
		login = DAO.OrientadoresDAO.login(orientador);
		
		try {		
			if(login.next()) {
				session.setAttribute("Orientador", orientador);
				response.sendRedirect("index.jsp");
			} else {
				%>
				<script>
					alert("ERRO! Usuário ou senha incorretos.");
					window.location = "login.jsp"
				</script>
				<%
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	
%>

</body>
</html>