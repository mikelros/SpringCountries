<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
<html>
<head>
<title>Update currency country</title>
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
			<h1>Update currency country</h1>

		</div>
		<s:url var="action" value="/countries/saveupdate" />
		<sf:form method="post" action="${action}" modelAttribute="country">
			<sf:hidden path="id" />
			<div class="form-group">
				<label for="name">Name</label>
				<sf:input path="name" placeholder="name" />
			</div>
			<div class="form-group">
				<label for="currency">Currency</label>
				<sf:select path="currencyId">
					<sf:options items="${currencies}" itemLabel="name" itemValue="id" />
				</sf:select>
			</div>
			<div class="form-group">
				<label for="abbreviated">Abbreviated</label>
				<sf:textarea path="abbreviated" placeholder="abbreviated" />
			</div>
			<sf:button>Update</sf:button>
		</sf:form>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>
</body>
</html>
