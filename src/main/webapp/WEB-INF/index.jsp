<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 09/01/2021
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        th , td {
            border:1px solid black;
        }

    </style>
</head>
<body>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h1>All Languages</h1>
<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Creator</th>
        <th>Version</th>
        <th>action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${allLanguages}" var="language">
        <tr>
            <td><a href="/languages/${language.id}"><c:out value="${language.name}"/></a></td>
            <td><c:out value="${language.creator}"/></td>
            <td><c:out value="${language.currentVersion}"/></td>
            <td><form action="/languages/${language.id}" method="post" >
                <input type="submit" name="_method" value="Delete">
                </form>
                <a href="/languages/edit/${language.id}">edit</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@ page isErrorPage="true" %>
<form:form action="/languages" method="post" modelAttribute="language">
    <p>
        <form:label path="name">Name</form:label>
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
