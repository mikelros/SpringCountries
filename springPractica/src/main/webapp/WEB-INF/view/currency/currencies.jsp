<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring forms :: Currencies</title>
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
					<li><a href="<s:url value="/currencies/" />"
						title="View currencies">View currencies</a></li>
					<li><a href="<s:url value="/currencies/new" />"
						title="New currency">New currency</a></li>
						<li><a href="<s:url value="/countries/new" />"
						title="New country">New country</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1>Currencies list</h1>
			<p>These are the currencies currently in the system.</p>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Abbreviation</th>
					<th>Value</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${currencies}" var="currency">
					<tr>
						<td>${currency.name}</td>
						<td>${currency.abbreviation}</td>
						<td>${currency.value}</td>
						<td><a class="btn btn-sm btn-primary" href="<s:url value="/currencies/${currency.id}" />"
							title="Detailed info"> see detail</a> <a
							href="<c:url value="/currencies/update/${currency.id}" />" class="btn btn-sm btn-success">update</a> <a
							href="<c:url value="/currencies/delete/${currency.id}" />" class="btn btn-sm btn-danger">delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>
</body>
</html>