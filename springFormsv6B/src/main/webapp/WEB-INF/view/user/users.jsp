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


	<h1>Users list</h1>
	<p>These are the users currently in the system.</p>

	<table class="table">
		<thead>
			<tr>
				<th>Login</th>
				<th>Description</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td>${user.login}</td>
					<td>${user.description}</td>
					<td><a href="<s:url value="/users/${user.id}" />"
						title="Detailed info"> see detail</a> || <a
						href="<c:url value="/users/update/${user.id}" />">update</a> || <a
						href="<c:url value="/users/delete/${user.id}" />">delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p>&copy; 2015 Eugenia Pérez</p>

</body>
</html>