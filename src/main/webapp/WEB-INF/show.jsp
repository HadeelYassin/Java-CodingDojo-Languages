<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10/01/2021
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/languages">Dashboard</a>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1><c:out value="${language.name}"/></h1>
<h1><c:out value="${language.creator}"/></h1>
<h1><c:out value="${language.currentVersion}"/></h1>
<p><a href="/languages/edit/${language.id}">edit</a></p>
<form action="/languages/${language.id}" method="post" >
    <input type="submit" name="_method" value="Delete">
</form>

</body>
</html>
