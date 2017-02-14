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
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><s:message code="navbar.title"></s:message></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<s:url value="/currencies/" />"
						title="View currencies"><s:message
								code="navbar.viewcurrencies"></s:message></a></li>
					<li><a href="<s:url value="/currencies/new" />"
						title="New currency"><s:message code="navbar.newcurrency"></s:message></a></li>
					<li><a href="<s:url value="/countries/" />"
						title="View countries"><s:message code="navbar.viewcountries"></s:message></a></li>
					<li><a href="<s:url value="/countries/new" />"
						title="New country"><s:message code="navbar.newcountry"></s:message></a></li>
					<li><a href="<s:url value="/countries/deleteAll" />"
						title="Delete All"><s:message code="navbar.deletecountries"></s:message></a></li>
				</ul>
				<div class="nav navbar-nav navbar-right">
					<c:url var="post_search" value="/countries/search" />
					<sf:form class="navbar-form" method="post"
						modelAttribute="searchCountry" action="${post_search}">
						<div class="input-group">
							<sf:input path="name" class="form-control" placeholder="Search" />
							<div class="input-group-btn">s
								<sf:button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</sf:button>
							</div>
						</div>
					</sf:form>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown" role="menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="true"><s:message code="navbar.language"></s:message>
							<span class="caret"></span> </a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="?locale=en"><img
									src="<c:url value="/resources/images/blank.gif" />"
									class="flag flag-gb"
									alt="<s:message code="english"></s:message>" /> <s:message
										code="english"></s:message></a></li>
							<li><a href="?locale=es"><img
									src="<c:url value="/resources/images/blank.gif" />"
									class="flag flag-es"
									alt="<s:message code="spanish"></s:message>" /> <s:message
										code="spanish"></s:message></a></li>
						</ul></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1>
				<s:message code="country.title"></s:message>
			</h1>
			<p>
				<s:message code="country.info"></s:message>
			</p>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th><s:message code="country.name"></s:message></th>
					<th><s:message code="country.abbreviated"></s:message></th>
					<th><s:message code="country.currency"></s:message></th>
					<th><s:message code="actions"></s:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${countries}" var="country">
					<tr>
						<td>${country.id}</td>
						<td>${country.name}</td>
						<td>${country.abbreviated}</td>
						<td>${country.currency.name}</td>
						<td><a class="btn btn-sm btn-primary"
							href="<s:url value="/countries/${country.id}" />"
							title="Detailed info"><s:message code="detail"></s:message></a> <a
							href="<c:url value="/countries/update/${country.id}" />"
							class="btn btn-sm btn-success"><s:message code="update"></s:message></a>
							<a href="<c:url value="/countries/delete/${country.id}" />"
							class="btn btn-sm btn-danger"><s:message code="delete"></s:message></a></td>
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
	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>