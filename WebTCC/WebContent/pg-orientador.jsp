<%@page import="DAO.OrientadoresDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="modelo.Orientador, modelo.Aluno, java.util.ArrayList" %>
    <%
		modelo.Orientador orientador = (Orientador) session.getAttribute("Orientador");
	%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<title>Orientador - <%= orientador.getNome() %></title>
</head>
<body>
	
	
	
	<h2>Olá, <%= orientador.getNome() %> </h2>

	<a href="add-orientando.jsp">+ Adicionar orientando</a>
	
	<%
		ArrayList<Aluno> orientandos = new ArrayList<Aluno>();
		orientandos = OrientadoresDAO.buscarOrientandos(orientador);
		
		if(orientandos != null) {
			%>
			<h3>Alunos orientados por você:</h3>
			<%
			for(int i=0; i<orientandos.size(); i++) {
	%>
		<div style="border: 2px solid #181818; margin: 20px; padding: 5px; width: 60%;">
			<span>Nome: <%= orientandos.get(i).getNome() %></span><br />
			<span>Campus: <%= orientandos.get(i).getCampus() %></span><br />
			<span>Título TCC: <%= orientandos.get(i).getTituloTCC() == "null" ? orientandos.get(i).getTituloTCC() : "Não definido" %></span><br />
			<form action="comentarios.jsp" method="post">
				<input type="hidden" name="mat" value="<%= orientandos.get(i).getMatricula() %>"/>
				<input type="submit" value="Ver Observações" />
			</form>
		</div>
	<%
			}
		}
	%>
	
	
		
	<footer>
		Indie Atom Tecnologies&copy;
	</footer>
	
</body>
</html>