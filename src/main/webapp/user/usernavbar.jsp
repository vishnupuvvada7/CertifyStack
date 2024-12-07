<%@page import="com.klef.jfsd.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
User u = (User)session.getAttribute("user");
if(u==null){
	response.sendRedirect("sessionexpiry");
	return;
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/usernav.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<nav class="navbar">
    <div class="navbar-brand">
        <a href="${pageContext.request.contextPath}/userhome" class="logo">CertifyStack</a>
    </div>
    
    <div class="navbar-menu">
        <a href="${pageContext.request.contextPath}/userhome" class="nav-item">
            <i class="fas fa-home"></i> Home
        </a>
        <a href="${pageContext.request.contextPath}/certifications" class="nav-item">
            <i class="fas fa-certificate"></i> My Certifications
        </a>
        <a href="${pageContext.request.contextPath}/addcertificate" class="nav-item">
            <i class="fas fa-plus-circle"></i> Add Certification
        </a>
        <a href="${pageContext.request.contextPath}/renewals" class="nav-item">
            <i class="fas fa-sync"></i> Renewals
        </a> 

        <div class="nav-item profile-dropdown">
            <button class="profile-btn">
                <i class="fas fa-user"></i> ${user.name}
            </button>
             <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/userprofile">Profile Settings</a>
                <a href="${pageContext.request.contextPath}/usercontact">Contact Us</a>
                <a href="${pageContext.request.contextPath}/userhelp">Help & Support</a>
                <a href="${pageContext.request.contextPath}/userlogout" class="logout-btn">Logout</a>
            </div> 
            
        </div>
    </div>
</nav>
</body>
</html>