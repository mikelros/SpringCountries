<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
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
<title>Spring forms :: User Task details</title>

</head>
<body>

	<a href="#">Users app</a>
	<ul>
			<li><a href="<s:url value="/users/${task.user.id}" />" 
				title="Back to user">Back to user</a></li>
		<li><a href="<s:url value="/users/" />" title="View users">View
				users</a></li>
		<li><a href="<s:url value="/users/new" />" title="New user">New
				user</a></li>
	</ul>

	<h1>User task detail</h1>
	<p>See this task info</p>

	<c:choose>
		<c:when test="${not empty task}">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
						<th>User</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${task.id}</td>
						<td>${task.name}</td>
						<td>${task.description}</td>
						<td>${task.user.login}</td>
					</tr>
				</tbody>
			</table>
		
			
		</c:when>
		<c:otherwise>
			<div>A task with the id specified has not been found. Please,
				try again</div>
		</c:otherwise>
	</c:choose>

	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>

</body>
</html>