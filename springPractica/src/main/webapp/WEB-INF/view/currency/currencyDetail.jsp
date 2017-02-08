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
					<li><a href="<s:url value="/currencies/" />"
						title="<s:message code="navbar.viewcurrencies"></s:message>"><s:message
								code="navbar.viewcurrencies"></s:message></a></li>
					<li><a href="<s:url value="/currencies/new" />"
						title="<s:message code="navbar.newcurrency"></s:message>"><s:message
								code="navbar.newcurrency"></s:message></a></li>
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
							<th><s:message code="currency.name"></s:message></th>
							<th><s:message code="currency.abbreviation"></s:message></th>
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
							<th>ID</th>
							<th><s:message code="country.name"></s:message></th>
							<th><s:message code="country.abbreviated"></s:message></th>
							<th><s:message code="actions"></s:message></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${currency.countries}" var="country">
							<tr>
								<td>${country.id}</td>
								<td>${country.name}</td>
								<td>${country.abbreviated}</td>
								<td><a class="btn btn-sm btn-primary"
									href="<s:url value="/countries/${country.id}" />"
									title="Detailed info"><s:message code="detail"></s:message></a>
									<a href="<c:url value="/countries/update/${country.id}" />"
									class="btn btn-sm btn-success"><s:message code="update"></s:message></a>
									<a href="<c:url value="/countries/delete/${country.id}" />"
									class="btn btn-sm btn-danger"><s:message code="delete"></s:message></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<h4>Insert new country</h4>
				<s:message code="country.name" var="countryName"></s:message>
				<s:message code="country.abbreviated" var="countryAbb"></s:message>
				<c:url var="post_country" value="/countries/new" />
				<sf:form method="post" modelAttribute="country"
					action="${post_country}">
					<sf:hidden path="currency.id" />
					<div class="form-group">
						<label for="name"><s:message code="country.name"></s:message></label>
						<sf:input path="name" placeholder="${countryName}" />
					</div>
					<div class="form-group">
						<label for="abbreviated"><s:message code="country.abbreviated"></s:message></label>
						<sf:textarea path="abbreviated" type="abbreviated"
							placeholder="${countryAbb}" />
					</div>
					<sf:button><s:message code="create"></s:message></sf:button>
				</sf:form>
			</c:when>
			<c:otherwise>
				<div><s:message code="currency.error"></s:message></div>
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