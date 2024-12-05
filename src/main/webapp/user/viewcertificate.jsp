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
    <title>View Certification - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/view-certification.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="usernavbar.jsp" />
    <main class="main-content">
        <div class="content-container">
       
            <div class="actions-bar">
                <a href="${pageContext.request.contextPath}/certifications" class="btn-secondary">
                    <span class="material-symbols-outlined">arrow_back</span>
                    Back to List
                </a>
            </div>

            <div class="cert-details-container">
                <div class="cert-header">
                    <h2>${certification.name}</h2>
                    <span class="status-badge ${certification.status}">${certification.status}</span>
                </div>

                <div class="cert-details-grid">
                    <div class="detail-section">
                        <h3>Certificate Information</h3>
                        <div class="detail-grid">
                            <div class="detail-item">
                                <span class="material-symbols-outlined">business</span>
                                <div class="detail-content">
                                    <label>Issuing Organization</label>
                                    <p>${certification.organization}</p>
                                </div>
                            </div>
                            <div class="detail-item">
                                <span class="material-symbols-outlined">event</span>
                                <div class="detail-content">
                                    <label>Issue Date</label>
                                    <p>${certification.issuedate}</p>
                                </div>
                            </div>
                            <div class="detail-item">
                                <span class="material-symbols-outlined">event_busy</span>
                                <div class="detail-content">
                                    <label>Expiry Date</label>
                                    <p>${certification.expirydate}</p>
                                </div>
                            </div>
                            <div class="detail-item">
                                <span class="material-symbols-outlined">tag</span>
                                <div class="detail-content">
                                    <label>Certificate Number</label>
                                    <p>${certification.validationid}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="detail-section">
                        <h3>Additional Notes</h3>
                        <div class="notes-content">
                            <p>${certification.cinfo}</p>
                        </div>
                    </div>

                    <div class="detail-section">
                        
                        <div class="certificate-preview">
                            <c:if test="${certification.cdoc != null}">
                                <a href="${pageContext.request.contextPath}/displaycertpdf?id=${certification.id}" class="btn-primary" target="_blank">
                                    <span class="material-symbols-outlined">visibility</span>
                                    View Certificate
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>