<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
<html>
<head>
<title>Update.jsp</title>
</head>
<body>
	<a href="#">Users app</a>
	<ul>
		<li><a href="<s:url value="/users/" />" title="View users">View
				users</a></li>
		<li><a href="<s:url value="/users/new" />" title="New user">New
				user</a></li>
	</ul>
	<h1>Update user</h1>
	<s:url var="action" value="/users/saveupdate" />
	<sf:form method="post" action="${action}" modelAttribute="user">
		<sf:hidden path="id" />
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
		<sf:button>Update</sf:button>
	</sf:form>

	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
</body>
</html>
