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

			<h1>New currency</h1>
			<p>See this currency info</p>
		</div>

		<c:url var="post_currency" value="/currencies/new" />
		<s:message code="currency.name" var="currencyName"></s:message>
		<s:message code="currency.abbreviation" var="currencyAbb"></s:message>
		<s:message code="currency.value" var="currencyValue"></s:message>
		<sf:form method="post" modelAttribute="currency" action="${post_currency}">
			<div class="form-group">
				<label for="name"><s:message code="currency.name"></s:message></label>
				<sf:input path="name" placeholder="${currencyName}" />
			</div>
			<div class="form-group">
				<label for="abbreviation"><s:message code="currency.abbreviation"></s:message></label>
				<sf:input path="abbreviation" type="abbreviation"
					placeholder="${currencyAbb}" />
			</div>
			<div class="form-group">
				<label for="value"><s:message code="currency.value"></s:message></label>
				<sf:textarea path="value" placeholder="${currencyValue}" />
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