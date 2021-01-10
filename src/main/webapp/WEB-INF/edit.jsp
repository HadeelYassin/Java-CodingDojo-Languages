<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10/01/2021
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/languages/${language.id}" method="post" >
    <input type="submit" name="_method" value="Delete">
<a href="/languages">DashBoard</a>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1>Edit Language</h1>
<form:form action="/languages/${language.id}" method="post" modelAttribute="language">
    <input type="hidden" name="_method" value="put">
    <p>
        <form:label path="name"> Name</form:label>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <p>
        <form:label path="creator">Creator</form:label>
        <form:errors path="creator"/>
        <form:textarea path="creator"/>
    </p>
    <p>
        <form:label path="currentVersion">Version</form:label>
        <form:errors path="currentVersion"/>
        <form:input path="currentVersion"/>
    </p>
    <input type="submit" value="Submit"/>
</form:form>

</body>
</html>
