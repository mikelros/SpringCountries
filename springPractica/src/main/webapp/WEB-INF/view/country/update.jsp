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
					<li><a
						href="<s:url value="/currencies/${country.currencyId}" />"
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
			<h1>Update currency country</h1>

		</div>
		<s:message code="country.name" var="countryName"/>
		<s:message code="country.abbreviated" var="countryAbb"/>
		<s:url var="action" value="/countries/saveupdate" />
		<sf:form method="post" action="${action}" modelAttribute="country">
			<sf:hidden path="id" />		
			<div class="form-group">
				<label for="name"><s:message code="country.name"></s:message></label>
				<sf:input path="name" placeholder="${countryName}" />
			</div>
			<div class="form-group">
				<label for="currencyId"><s:message code="country.currency"></s:message></label>
				<sf:select path="currencyId" >
				<sf:options items="${currencies}" itemLabel="name" itemValue="id"  />
			</sf:select>
			</div>
			<div class="form-group">
				<label for="abbreviated"><s:message code="country.abbreviated"></s:message></label>
				<sf:textarea path="abbreviated" placeholder="${countryAbb}" />
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
