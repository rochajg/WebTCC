<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro Aluno</title>
</head>
<body>

<jsp:useBean class="modelo.Aluno" id="aluno" />

<%
	aluno.setMatricula(Integer.parseInt(request.getParameter("matricula").toString()));
	aluno.setNome(request.getParameter("nome"));
	aluno.setCurso(request.getParameter("curso"));
	aluno.setCampus(request.getParameter("campus"));
	aluno.setTurma(request.getParameter("turma"));
	aluno.setAnoSemestre(request.getParameter("anoSemestre"));
	aluno.setTituloTCC(request.getParameter("tituloTCC"));
	aluno.setSenha(request.getParameter("senha"));
	
	boolean cadastrou = DAO.AlunosDAO.cadastrar(aluno);
	
	if(cadastrou) {
		response.sendRedirect("index.jsp");
	} else {
		%>
		<script>
			alert("ERRO! Falha ao cadastrar.\n" +
				  "Por favor, verifique os dados e tente novamente.");
			window.location = "cadastro-aluno.jsp";
		</script>
		<%
	}
%>

</body>
</html>