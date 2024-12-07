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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="usernavbar.jsp" />
    
    <div class="dashboard-container">
        <div class="dashboard-header">
            <div class="header-content">
                <h1>Welcome Back, ${user.name}!</h1>
                <p>Here's what's happening with your certifications today</p>
            </div>
        </div>
        
        <div class="dashboard-stats">
            <div class="stat-card">
                <div class="card-content">
                    <div class="card-icon">
                        <i class="fas fa-certificate"></i>
                    </div>
                    <div class="stat-info">
                        <h3>Active Certifications</h3>
                        <p class="stat-number">${activeCertifications}</p>
                        
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/certifications" class="view-details">
                        View Details
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>

            <div class="stat-card">
                <div class="card-content">
                    <div class="card-icon warning">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="stat-info">
                        <h3>Expiring Soon</h3>
                        <p class="stat-number">${expiringCertifications}</p>
                        
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/renewals" class="view-details">
                        View Details
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>

            <div class="stat-card">
                <div class="card-content">
                    <div class="card-icon success">
                        <i class="fas fa-globe"></i>
                    </div>
                    <div class="stat-info">
                        <h3>Global Certifications</h3>
                        <p class="stat-number">${globalCertifications}</p>
                        
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/certifications" class="view-details">
                        View Details
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
        
        <div class="quick-actions">
            <div class="section-header">
                <h2>Quick Actions</h2>
                <p>Get started with these common tasks</p>
            </div>
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/addcertificate" class="action-btn primary">
                    <div class="btn-icon">
                        <i class="fas fa-plus"></i>
                    </div>
                    <div class="btn-content">
                        <h3>Add New Certification</h3>
                        <p>Upload your latest certification</p>
                    </div>
                </a>
                
                <a href="${pageContext.request.contextPath}/renewals" class="action-btn warning">
                    <div class="btn-icon">
                        <i class="fas fa-sync"></i>
                    </div>
                    <div class="btn-content">
                        <h3>Manage Renewals</h3>
                        <p>Track and renew certifications</p>
                    </div>
                </a>
                
                <a href="${pageContext.request.contextPath}/certifications" class="action-btn success">
                    <div class="btn-icon">
                        <i class="fas fa-list"></i>
                    </div>
                    <div class="btn-content">
                        <h3>View All Certifications</h3>
                        <p>Browse your certification portfolio</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</body>
</html>