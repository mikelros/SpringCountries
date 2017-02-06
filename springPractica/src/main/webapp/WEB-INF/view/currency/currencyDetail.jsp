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
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">

			<h1>Currencies detail</h1>
			<p>See this currency info</p>
		</div>

		<c:choose>
			<c:when test="${not empty currency}">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Abbreviation</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${currency.id}</td>
							<td>${currency.name}</td>
							<td>${currency.abbreviation}</td>
						</tr>
					</tbody>
				</table>

				<h3>Countries</h3>
				
				<p>These are the countries for this currency.</p>
				<table class="table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Abbreviated</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${currency.countries}" var="country">
							<tr>
								<td>${country.id}</td>
								<td>${country.name}</td>
								<td>${country.abbreviated}</td>
								<td><a href="<s:url value="/countries/${country.id}" />"
									title="Detailed info" class="btn btn-sm btn-primary"> See detail</a> <a
									href="<c:url value="/countries/update/${country.id}" />" class="btn btn-sm btn-success">Update</a> 
									<a href="<c:url value="/countries/delete/${country.id}" />" class="btn btn-sm btn-danger">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<h4>Insert new country</h4>
				<c:url var="post_country" value="/countries/new" />
				<sf:form method="post" modelAttribute="country" action="${post_country}">
					<sf:hidden path="currency.id" />
					<div class="form-group">
						<label for="name">Name</label>
						<sf:input path="name" placeholder="Name" />
					</div>
					<div class="form-group">
						<label for="abbreviated">Abbreviated</label>
						<sf:textarea path="abbreviated" type="abbreviated"
							placeholder="Abbreviated" />
					</div>
					<sf:button>Create</sf:button>
				</sf:form>
			</c:when>
			<c:otherwise>
				<div>A currency with the id specified has not been found. Please,
					try again</div>
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