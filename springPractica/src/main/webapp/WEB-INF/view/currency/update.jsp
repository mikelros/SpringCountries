<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
<html>
<head>
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
			<h1>Update currency</h1>
		</div>
		<s:url var="action" value="/currencies/saveupdate" />
		<s:message code="currency.name" var="currencyName"></s:message>
		<s:message code="currency.abbreviation" var="currencyAbb"></s:message>
		<s:message code="currency.value" var="currencyValue"></s:message>
		<sf:form method="post" action="${action}" modelAttribute="currency">
			<sf:hidden path="id" />
			<div class="form-group">
				<label for="name">${currencyName}</label>
				<sf:input path="name" placeholder="${currencyName}" />
			</div>
			<div class="form-group">
				<label for="abbreviation">${currencyAbb}</label>
				<sf:input path="abbreviation" type="abbreviation" placeholder="${currencyAbb}" />
			</div>
			<div class="form-group">
				<label for="value">${currencyValue}</label>
				<sf:textarea path="value" placeholder="${currencyValue}" />
			</div>
			<sf:button><s:message code="update"></s:message></sf:button>
		</sf:form>
	</div>

	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>
</body>
</html>
