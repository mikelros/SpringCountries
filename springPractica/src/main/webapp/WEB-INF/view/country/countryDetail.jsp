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
<title>Spring forms :: Currency country details</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Currencies app</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a
						href="<s:url value="/currencies/${country.currency.id}" />"
						title="Back to user">Back to Currency</a></li>
					<li><a href="<s:url value="/currencies/" />"
						title="View currencies">View currencies</a></li>
					<li><a href="<s:url value="/currencies/new" />"
						title="New currency">New currency</a></li>
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
							<th>Name</th>
							<th>Abbreviated</th>
							<th>Currency</th>
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
				<div>A country with the id specified has not been found.
					Please, try again</div>
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