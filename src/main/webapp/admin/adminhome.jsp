<%@page import="com.klef.jfsd.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Admin a = (Admin)session.getAttribute("admin");
if(a==null){
    response.sendRedirect("sessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/dashboard.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <main class="main-content">
        <div class="dashboard-header">
            <h1>Welcome Back, Admin!</h1>
            <p>Here's what's happening with your certifications today</p>
        </div>
        <div class="dashboard-stats">
            <div class="stat-card users">
                <div class="card-content">
                    <div class="card-icon">
                        <span class="material-symbols-outlined">group</span>
                    </div>
                    <div class="stat-info">
                        <h3>Total Users</h3>
                        <p class="stat-number">${totalUsers}</p>
                        
                    </div>	
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/viewusers" class="view-details">
                        View Details
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                </div>
            </div>

            <div class="stat-card certifications">
                <div class="card-content">
                    <div class="card-icon">
                        <span class="material-symbols-outlined">verified</span>
                    </div>
                    <div class="stat-info">
                        <h3>Active Certifications</h3>
                        <p class="stat-number">${activeCertifications}</p>
                        
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/certs" class="view-details">
                        View Details
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                </div>
            </div>

            <div class="stat-card approvals">
                <div class="card-content">
                    <div class="card-icon">
                        <span class="material-symbols-outlined">pending</span>
                    </div>
                    <div class="stat-info">
                        <h3>Pending Approvals</h3>
                        <p class="stat-number">${pendingApprovals}</p>
                        
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/verifyglobalcerts" class="view-details">
                        View Details
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                </div>
            </div>

            <div class="stat-card renewals">
                <div class="card-content">
                    <div class="card-icon">
                        <span class="material-symbols-outlined">update</span>
                    </div>
                    <div class="stat-info">
                        <h3>Pending Renewals</h3>
                        <p class="stat-number">${pendingRenewals}</p>
                        
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/approverenewals" class="view-details">
                        View Details
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                </div>
            </div>
            <div class="stat-card users">
                <div class="card-content">
                    <div class="card-icon">
                        <span class="material-symbols-outlined">group</span>
                    </div>
                    <div class="stat-info">
                        <h3>Total Co-Admins</h3>
                        <p class="stat-number">${totalAdmins}</p>
                        
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/admins" class="view-details">
                        View Details
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                </div>
            </div>
        </div>
    </main>
</body>
</html>