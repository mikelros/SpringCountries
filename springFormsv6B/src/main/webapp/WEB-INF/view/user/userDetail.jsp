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

	<h1>Users detail</h1>
	<p>See this user info</p>

	<c:choose>
		<c:when test="${not empty user}">
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
			
				<h3>Tasks</h3>
				<h4>Insert new task</h4>
				<c:url var="post_task"  value="/tasks/new" />
				<sf:form method="post" modelAttribute="task" action="${post_task}">
				<sf:hidden path="user.id" />
				<div class="form-group">
					<label for="name">Name</label>
					<sf:input path="name" placeholder="Name" />
				</div>
				<div class="form-group">
					<label for="description">Description</label>
					<sf:textarea path="description" type="description" placeholder="Description" />
				</div>
				<sf:button>Create</sf:button>
			</sf:form>
	<p>These are the tasks for this user.</p>
			<table class="table">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${user.tasks}" var="task">
				<tr>
					<td>${task.id}</td>
					<td>${task.name}</td>
					<td><a href="<s:url value="/tasks/${task.id}" />"
						title="Detailed info"> See detail</a> || <a
						href="<c:url value="/tasks/update/${task.id}" />">Update</a> || <a
						href="<c:url value="/tasks/delete/${task.id}" />">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			
		</c:when>
		<c:otherwise>
			<div>A user with the id specified has not been found. Please,
				try again</div>
		</c:otherwise>
	</c:choose>

	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>

</body>
</html>