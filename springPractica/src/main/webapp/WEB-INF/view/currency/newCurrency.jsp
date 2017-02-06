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

			<h1>New currency</h1>
			<p>See this currency info</p>
		</div>

		<c:url var="post_currency" value="/currencies/new" />
		<sf:form method="post" modelAttribute="currency" action="${post_currency}">
			<div class="form-group">
				<label for="name">Name</label>
				<sf:input path="name" placeholder="Name" />
			</div>
			<div class="form-group">
				<label for="abbreviation">Abbreviation</label>
				<sf:input path="abbreviation" type="abbreviation"
					placeholder="Abbreviation" />
			</div>
			<div class="form-group">
				<label for="value">Value</label>
				<sf:textarea path="value" placeholder="Value in euros" />
			</div>
			<sf:button>Create</sf:button>
		</sf:form>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>

</body>
</html>