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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certification Renewals - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/renewals.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="usernavbar.jsp" />
    <main class="main-content">
        <div class="content-container">
            <div class="page-header">
                <div class="header-content">
                    <h1>Certification Renewals</h1>
                    <p>Track and manage your certification renewal timeline</p>
                </div>
            </div>

            <div class="content-body">
                <c:choose>
                    <c:when test="${renewals.isEmpty()}">
                        <div class="empty-state">
                            <span class="material-symbols-outlined">update_disabled</span>
                            <p>No Renewals Available</p>
                            <a href="${pageContext.request.contextPath}/certifications" class="btn-primary">
                                <span class="material-symbols-outlined">format_list_bulleted</span>
                                View All Certifications
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="renewals-timeline">
                            <div class="timeline-items">
                                <c:forEach items="${renewals}" var="renewal">
                                    <div class="timeline-item">
                                        <div class="timeline-marker"></div>
                                        <div class="timeline-content">
                                            <div class="timeline-header">
                                                <h3>${renewal.name}</h3>
                                            </div>
                                            <div class="timeline-body">
                                                <p>
                                                    <span class="material-symbols-outlined">business</span>
                                                    ${renewal.organization}
                                                </p>
                                                <p>
                                                    <span class="material-symbols-outlined">event_busy</span>
                                                    Expires: ${renewal.expirydate}
                                                </p>
                                            </div>
                                            <div class="timeline-actions">
                                                <a href="${pageContext.request.contextPath}/renewalcertification/${renewal.id}" class="btn-primary">
                                                    <span class="material-symbols-outlined">autorenew</span>
                                                    Renew Now
                                                </a>
                                                <a href="${pageContext.request.contextPath}/displaycertpdf?id=${renewal.id}" target="_blank" class="btn-secondary">
                                                    <span class="material-symbols-outlined">visibility</span>
                                                    View Certificate
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>
</body>
</html>