<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
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

	<h1>User created</h1>

	<div class="alert alert-success" role="alert">The following user
		has been created successfully</div>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Login</th>
				<th>Description</th>
				<th>Password</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${user.id}</td>
				<td>${user.login}</td>
				<td>${user.description}</td>
				<td>${user.password}</td>
			</tr>
		</tbody>
	</table>

	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>

</body>
</html>