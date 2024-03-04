<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/styles1.css">
<title>Viagem</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp"></jsp:include>
	</div>

	<br>

	<div align="center" class="container">
		<form action="viagem" method="post">
		<p class="title">
			<b>Viagem</b>
		</p>
			<table>
					<tr>
						<td colspan="1">
							<input class="id_input_data_viagem" type="number" id="codigo"
							name = "codigo" placeholder="Codigo"
							value='<c:out value="${v.codigo }"></c:out>'>
						</td>
						<td colspan="1">
							<input type = "submit" id="botao" name = "botao" value="Buscar">
						</td>
						<td>
							<input type="submit" id="botao" name="botao" value="Desc. Onibus">
						</td>
						
						<td>
							<input type="submit" id="botao" name="botao" value="Desc. Viagem">
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<select class="input_data" id="motorista" name = "motorista">
								<option value="0">Escolha um motorista</option>
								<c:forEach var="m" items="${motoristas }">
									<option value="${m.codigo }">
										<c:out value="${m }"/>
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<select class="input_data" id="onibus" name = "onibus">
								<option value="0">Escolha um ônibus</option>
								<c:forEach var="o" items="${busoes }">
									<option value="${o.placa }">
										<c:out value="${o }"/>
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<input class="input_data" type="number" min="0" step="1" id="hora_saida"
							name = "hora_saida" placeholder="Saída"
							value='<c:out value="${viagem.hora_saida }"></c:out>'>
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<input class="input_data" type="number" min="0" step="1" id="hora_chegada"
							name = "hora_chegada" placeholder="Chegada"
							value='<c:out value="${viagem.hora_chegada }"></c:out>'>
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<input class="input_data" type="text" id="partida"
							name = "partida" placeholder="Partida"
							value='<c:out value="${onibus.partida}"></c:out>'>
						</td>
					</tr>
					
					<tr>						
						<td colspan="4">
							<input class="input_data" type="text" id="destino"
							name = "destino" placeholder="Destino"
							value='<c:out value="${onibus.destino}"></c:out>'>
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
							<input type="submit" id="botao" name="botao" value="Excluir viagem">
						</td>
						
						<td colspan="">
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
		<c:if test="${not empty viagens }">
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