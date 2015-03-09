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
<title>Spring forms :: Users</title>

</head>
<body>

	<a href="#">Users app</a>
	<ul>
		<li><a href="<s:url value="/users/" />" title="View users">View
				users</a></li>
		<li><a href="<s:url value="/users/new" />" title="New user">New
				user</a></li>
	</ul>
	<h1>New user</h1>
	<p>See this user info</p>

	<c:url var="post_user"  value="/users/new" />
	<sf:form method="post" modelAttribute="user" action="${post_user}">
		<div class="form-group">
			<label for="login">Login</label>
			<sf:input path="login" placeholder="Login" />
		</div>
		<div class="form-group">
			<label for="password">Password</label>
			<sf:input path="password" type="password" placeholder="Password" />
		</div>
		<div class="form-group">
			<label for="description">Description</label>
			<sf:textarea path="description" placeholder="Description" />
		</div>
		<sf:button>Create</sf:button>
	</sf:form>

	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>

</body>
</html>