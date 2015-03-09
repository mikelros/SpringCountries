<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<title>Deleted.jsp</title>
</head>
<body>
	<a href="#">Users app</a>
	<ul>
		<li><a href="<s:url value="/users/" />" title="View users">View
				users</a></li>
		<li><a href="<s:url value="/users/new" />" title="New user">New
				user</a></li>
	</ul>
	<h1>Ok, ${userId} user was deleted</h1>


	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
</body>
</html>
