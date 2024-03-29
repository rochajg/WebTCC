<%@ page import="DAO.AlunosDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<jsp:useBean class="modelo.Aluno" id="aluno"/>
<jsp:useBean class="modelo.Orientador" id="orientador"/>

<%@ page import="java.sql.ResultSet, java.sql.SQLException" %>

<%
	ResultSet login;

	try {
		aluno.setMatricula(Integer.parseInt(request.getParameter("login")));
		aluno.setSenha(request.getParameter("senha"));
		
		login = DAO.AlunosDAO.login(aluno);
		
		try {		
			if(login.next()) {
				aluno.setMatricula(login.getInt("matricula"));
				aluno.setNome(login.getString("nome"));
				aluno.setCurso(login.getString("curso"));
				aluno.setCampus(login.getString("campus"));
				aluno.setTurma(login.getString("turma"));
				aluno.setAnoSemestre(login.getString("ano_semestre"));	
				aluno.setTituloTCC(login.getString("titulo_tcc"));
				
				session.setAttribute("Aluno", aluno);
				response.sendRedirect("pg-aluno.jsp");
			} else {
				%>
				<script>
					alert("ERRO! Usu�rio ou senha incorretos.");
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
				orientador.setNome(login.getString("nome"));
				orientador.setCurso(login.getString("curso"));
				orientador.setId(login.getInt("id"));
				
				session.setAttribute("Orientador", orientador);
				response.sendRedirect("pg-orientador.jsp");
			} else {
				%>
				<script>
					alert("ERRO! Usu�rio ou senha incorretos.");
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