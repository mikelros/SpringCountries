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
						title="<s:message code="currency.back"></s:message>"><s:message
								code="currency.back"></s:message></a></li>
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
			<h1>Update currency country</h1>

		</div>
		<s:message code="country.name" var="countryName" />
		<s:message code="country.abbreviated" var="countryAbb" />
		<s:url var="action" value="/countries/saveupdate" />
		<sf:form method="post" action="${action}" modelAttribute="country"
			class="form-horizontal">
			<sf:hidden path="id" />
			<div class="form-group">
				<label for="name" class="control-label col-sm-1"><s:message
						code="country.name"></s:message></label>
				<div class="col-sm-11">

					<sf:input class="form-control" path="name"
						placeholder="${countryName}" />
					<sf:errors path="name" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<label for="currencyId" class="control-label col-sm-1"><s:message
						code="country.currency"></s:message></label>
				<div class="col-sm-11">

					<sf:select path="currencyId" class="form-control">
						<sf:options items="${currencies}" itemLabel="name" itemValue="id" />
					</sf:select>
					<sf:errors path="currencyId" cssClass="text-danger" />

				</div>

			</div>
			<div class="form-group">
				<label for="abbreviated" class="control-label col-sm-1"><s:message
						code="country.abbreviated"></s:message></label>
				<div class="col-sm-11">

					<sf:textarea path="abbreviated" class="form-control"
						placeholder="${countryAbb}" />
					<sf:errors path="abbreviated" cssClass="text-danger" />
				</div>
			</div>
			<sf:button class="btn btn-default">
				<s:message code="update"></s:message>
			</sf:button>
		</sf:form>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>
</body>
</html>
