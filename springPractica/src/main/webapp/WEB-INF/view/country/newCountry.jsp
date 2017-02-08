<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

			<h1>New country</h1>
			<p>See this country info</p>
		</div>

		<c:url var="post_country" value="/countries/newOut" />
		<s:message code="country.name" var="countryName"></s:message>
		<s:message code="country.abbreviated" var="countryAbb"></s:message>
		<sf:form method="post" modelAttribute="countryDTO" action="${post_country}">
			<div class="form-group">
				<label for="name"><s:message code="country.name"></s:message></label>
				<sf:input path="name" placeholder="${countryName}" />
			</div>
			<div class="form-group">
				<label for="abbreviated"><s:message code="country.abbreviated"></s:message></label>
				<sf:input path="abbreviated" type="abbreviated"
					placeholder="${countryAbb}" />
			</div>
			<div class="form-group">
				<label for="currencyId"><s:message code="country.currency"></s:message></label>
				<sf:select path="currencyId" >
				<sf:options items="${currencies}" itemLabel="name" itemValue="id"  />
			</sf:select>
			</div>
			
			<sf:button><s:message code="create"></s:message></sf:button>
		</sf:form>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>

</body>
</html>