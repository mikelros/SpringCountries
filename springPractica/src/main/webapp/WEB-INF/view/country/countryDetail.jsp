<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:message code="title"></s:message></title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><s:message code="navbar.title"></s:message></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a
						href="<s:url value="/currencies/${country.currency.id}" />"
						title="<s:message code="currency.back"></s:message>"><s:message code="currency.back"></s:message></a></li>
					<li><a href="<s:url value="/currencies/" />"
						title="<s:message code="navbar.viewcurrencies"></s:message>"><s:message code="navbar.viewcurrencies"></s:message></a></li>
					<li><a href="<s:url value="/currencies/new" />"
						title="<s:message code="navbar.newcurrency"></s:message>"><s:message code="navbar.newcurrency"></s:message></a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1>Currency country detail</h1>
			<p>See this country info</p>
		</div>

		<c:choose>
			<c:when test="${not empty country}">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th><s:message code="country.name"></s:message></th>
							<th><s:message code="country.abbreviated"></s:message></th>
							<th><s:message code="country.currency"></s:message></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${country.id}</td>
							<td>${country.name}</td>
							<td>${country.abbreviated}</td>
							<td>${country.currency.name}</td>
						</tr>
					</tbody>
				</table>


			</c:when>
			<c:otherwise>
				<div><s:message code="country.error"></s:message></div>
			</c:otherwise>
		</c:choose>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>

</body>
</html>