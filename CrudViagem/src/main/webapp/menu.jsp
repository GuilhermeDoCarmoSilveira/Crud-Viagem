<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles1.css">
<title></title>
</head>
<body>
	<nav id="menu">
		<ul>
			<li><a href="index.jsp">Home</a>
			<li><a href="${pageContext.request.contextPath}/motorista">Motorista</a>
			<li><a href="${pageContext.request.contextPath}/onibus">Ônibus</a>
			<li><a href="${pageContext.request.contextPath}/viagem">Viagem</a>
		</ul>
	</nav>
</body>
</html>