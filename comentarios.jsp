<%@ page import="DAO.OrientadoresDAO, DAO.AlunosDAO, modelo.Orientador, modelo.Aluno, java.sql.ResultSet, java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		Orientador orientador = (Orientador) session.getAttribute("Orientador");
    	ResultSet aluno = AlunosDAO.buscarAluno(new Aluno(Integer.parseInt(request.getParameter("mat"))));
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Orientando</title>
</head>
<body>

<%
	ResultSet comentarios = OrientadoresDAO.getObservacoes(orientador, new Aluno(Integer.parseInt(request.getParameter("mat"))));

	try {
		if(comentarios.next()) {
			do {
%>

			<div style="border: 1px solid #212121; margin: 0 auto; background: #FAFAFA;">
				<span>Comentário: <br /><%= comentarios.getString("observacao") %></span><br />
				<span>Data: <%= comentarios.getDate("data_obs") %></span>
			</div>

<%
			} while(comentarios.next());
		} else {
%>

			<div style="border: 1px solid #212121; margin: 0 auto; background: #FAFAFA;">
				Não há comentários
			</div>

<%
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>

</body>
</html>