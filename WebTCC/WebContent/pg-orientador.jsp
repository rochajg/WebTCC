<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="modelo.Orientador" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/estilo.css">
<title></title>
</head>
<body>
	
	<%
		modelo.Orientador orientador = (Orientador) session.getAttribute("Orientador");
	%>
	
	<h2>Olá, <%= orientador.getNome() %> </h2>
	
</body>
</html>