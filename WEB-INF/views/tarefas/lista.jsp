<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/jquery.js"></script>
</head>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="novaTarefa">Criar nova tarefa</a>
	<br /> <br />
	
	<table>
		<tr>
			<th>Id</th>
			<th>Descrição</th>
			<th>Finalizado?</th>
			<th>Data de finalização</th>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr>
				<td>${tarefa.id}</td>
				<td>${tarefa.descricao}</td>
				<c:if test="${tarefa.finalizado eq false}">
					<td id="tarefa_${tarefa.id}">
					<a href="#" onClick="finalizaAgora(${tarefa.id})"> Finaliza agora!</a></td>
				</c:if>
				<script type="text/javascript">
					function finalizaAgora(id)
					{
						$.post("finalizaTarefa", {'id' : id}, function()
								{
									$("#tarefa_" + id).html("Finalizado");
								});
					}
				</script>
				
				<a href="novaTarefa">Criar nova tarefa</a>
				<br /> <br />
				<c:if test="${tarefa.finalizado eq true}">
					<td>Finalizado</td>
				</c:if>
				<td>
				<fmt:formatDate
				value="${tarefa.dataFinalizacao.time}"
				pattern="dd/MM/yyyy"/>
				</td>
				<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
				<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
				<td><a href="#" onclick="finalizaAgora(${tarefa.id})">Finalizar agora</a></td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>