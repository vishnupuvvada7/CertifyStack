<%@page import="com.klef.jfsd.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Admin a = (Admin)session.getAttribute("admin");
if(a==null){
	response.sendRedirect("sessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admins.css" >
</head>
<body>
	<jsp:include page="sidebar.jsp" />
    <main class="main-content">
        <div class="header">
            <h1>Co-Admins</h1>
            <p>Here're your Co-Admins</p>
        </div>

        <!-- Admin List Table -->
        <div class="card">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${adminlist}" var="admin">
                        <tr>
                            <td>${admin.name}</td>
                            <td>${admin.username}</td>
                            <td>${admin.email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>