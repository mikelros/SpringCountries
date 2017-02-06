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

			<h1>New country</h1>
			<p>See this country info</p>
		</div>

		<c:url var="post_country" value="/countries/newOut" />
		<sf:form method="post" modelAttribute="countryDTO" action="${post_country}">
			<div class="form-group">
				<label for="name">Name</label>
				<sf:input path="name" placeholder="Name" />
			</div>
			<div class="form-group">
				<label for="abbreviated">Abbreviated</label>
				<sf:input path="abbreviated" type="abbreviated"
					placeholder="Abbreviated" />
			</div>
			<div class="form-group">
				<label for="currencyId">Currency</label>
				<sf:select path="currencyId" >
				<sf:options items="${currencies}" itemLabel="name" itemValue="id"  />
			</sf:select>
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