<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean class="modelo.Orientadores" id="orientador" />

<%
	orientador.setNome(request.getParameter("nome"));
	orientador.setCurso(request.getParameter("curso"));
	orientador.setLogin(request.getParameter("login"));
	orientador.setSenha(request.getParameter("senha"));
	
	boolean cadastrou = DAO.OrientadoresDAO.cadastrar(orientador);
	
	if(cadastrou) {
		response.sendRedirect("index.jsp");
	} else {
		%>
		<script>
			alert("ERRO! Falha ao cadastrar.\n" +
				  "Por favor, verifique os dados e tente novamente.");
		</script>
		<%
		response.sendRedirect("cadastro-orientador.jsp");
	}
%>

</body>
</html>