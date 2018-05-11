<%@page import="utilidade.Documento"%>
<%@page import="java.sql.SQLException"%>
<%@page import="modelo.Aluno"%>
<%@page import="DAO.AlunosDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Orientador"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gerando relatório</title>
</head>
<body>

<%
	Aluno alunoGera = AlunosDAO.preencherAluno(new Aluno(Integer.parseInt(request.getParameter("mat"))));

	Documento doc = new Documento(alunoGera, orientador);
	
	String caminho = "pdfs/faatcc_" + alunoGera.getMatricula() + ".pdf";
	
	response.sendRedirect(caminho);
%>

</body>
</html>