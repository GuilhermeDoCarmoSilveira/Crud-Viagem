<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles1.css">
<title>Ônibus</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp"></jsp:include>
	</div>

	<br>

	<div align="center" class="container">
		<form action="onibus" method="post">
		<p class="title">
			<b>Ônibus</b>
		</p>
			<table>
					<tr>
						<td colspan="3">
							<input class="id_input_data" type="text" id="placa"
							name = "placa" placeholder="Placa"
							value='<c:out value="${onibus.placa }"></c:out>'>
						</td>
						<td>
							<input type = "submit" id="botao" name = "botao" value="Buscar">
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<input class="input_data" type="text" id="marca"
							name = "marca" placeholder="Marca"
							value='<c:out value="${onibus.marca }"></c:out>'>
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<input class="input_data" type="number" min="0" id="ano" 
							name="ano" placeholder="Ano"
							value='<c:out value="${onibus.ano }"></c:out>'>
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<input class="input_data" type="text" id="descricao"
							name = "descricao" placeholder="Descrição"
							value='<c:out value="${onibus.descricao}"></c:out>'>
						</td>	
					</tr>
					
					<tr>
						<td>
							<input type="submit" id="botao" name="botao" value="Cadastrar">
						</td>
						
						<td>
							<input type="submit" id="botao" name="botao" value="Alterar">
						</td>
						
						<td>
							<input type="submit" id="botao" name="botao" value="Excluir">
						</td>
						
						<td>
							<input type="submit" id="botao" name="botao" value="Listar">
						</td>
					</tr>
			</table>
		</form>
	</div>
	
	<br />
	
	<div align="center">
		<c:if test="${not empty erro }">
			<h3><b><c:out value="${erro }" /></b></h3>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty saida }">
			<h3><b><c:out value="${saida }" /></b></h3>
		</c:if>
	</div>
	
	<br />
	
	<div align="center">
		<c:if test="${not empty busoes }">
			<table class="table_round">
				<thead>
					<tr>
						<th>Placa</th>
						<th>Marca</th>
						<th>Ano</th>
						<th>Descrição</th>
					</tr>	
				</thead>
				<tbody>
					<c:forEach var="b" items="${busoes}">
						<tr>
							<td><c:out value="${b.placa }" /></td>
							<td><c:out value="${b.marca }" /></td>
							<td><c:out value="${b.ano}" /></td>
							<td><c:out value="${b.descricao}" /></td>
						</tr>
					</c:forEach>
				</tbody>		
			</table>
		</c:if>
	</div> 
</body>
</html>