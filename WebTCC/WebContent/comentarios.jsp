<%@ page import="DAO.OrientadoresDAO, DAO.AlunosDAO, modelo.Orientador, modelo.Aluno, java.sql.ResultSet, java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		Orientador orientador = (Orientador) session.getAttribute("Orientador");
    	String nomeAluno = "";
    	
    	if(orientador == null)
    		response.sendRedirect("index.jsp");
    	
    	ResultSet aluno = AlunosDAO.buscarAluno(new Aluno(Integer.parseInt(request.getParameter("mat"))));
    	try{
    		if(aluno.next())
    			nomeAluno = aluno.getString("nome");
    	} catch(SQLException e) {
    		
    	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<title>Orientando</title>
</head>
<body>

	<h2>Comentários para <%= nomeAluno %></h2>

<%
	ResultSet comentarios = OrientadoresDAO.getObservacoes(orientador, new Aluno(Integer.parseInt(request.getParameter("mat"))));

	try {
		if(comentarios.next()) {
			do {
%>
		<div style="margin: 0 auto; width: 100%;">
			<div style="border: 1px solid #212121; margin: 0 auto; padding: 10px; width: 60%; background: #FAFAFA;">
				<span>Comentário: <br /><%= comentarios.getString("observacao") %></span><br />
				<span>Data: <%= comentarios.getDate("data_obs") %></span>
			</div>

<%
			} while(comentarios.next());
			
%>
			
			<form action="add-coment.jsp" method="post" id="new-coment">
				<textarea name="observacao" rows="4" cols="32" placeholder="Adicione aqui um novo comentário" form="new-coment"></textarea><br />
				<input type="submit" value="Adicionar observação" />
			</form>
		
<%
			
		} else {
%>
			<div style="border: 1px solid #212121; margin: 0 auto; padding: 10px; width: 60%; background: #FAFAFA;">
				Ainda não há comentários
			</div>

			<form action="add-coment.jsp" method="post" id="new-coment">
				<textarea name="observacao" rows="4" cols="32" placeholder="Adicione aqui um novo comentário" form="new-coment"></textarea><br />
				<input type="submit" value="Adicionar observação" />
			</form>
			
		</div>

<%
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>

</body>
</html>