<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<jsp:useBean class="modelo.Aluno" id="aluno" />

<%
	aluno.setMatricula(Integer.parseInt(request.getParameter("matricula").toString()));
	modelo.Orientador ori = (modelo.Orientador) session.getAttribute("Orientador");
	
	boolean cadastrou = DAO.OrientadoresDAO.addOrientando(ori, aluno.getMatricula());
	
	if(cadastrou) {
		response.sendRedirect("pg-orientador.jsp");
	} else {
		%>
		<script>
			alert("ERRO! Falha ao adicionar.\n" +
				  "Orientando já cadastrado.");
			window.location = "pg-orientador.jsp";
		</script>
		<%
	}
%>
	
	
</body>
</html>