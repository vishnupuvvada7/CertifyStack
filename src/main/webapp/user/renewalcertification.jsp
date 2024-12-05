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
    <title>Renewal Certification - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/forms.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="usernavbar.jsp" />
    <main class="main-content">
        <div class="page-header">
            <div class="header-content">
                <h1>Renew Your Certification</h1>
                <p>Update and manage your existing certification</p>
            </div>
        </div>
        
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/renewalcertificate/${certification.id}" method="post" enctype="multipart/form-data" class="certification-form">
                <div class="form-section">
                <input type="hidden" id="id" name="id" value="${certification.id}" required>
                    <h2>Basic Information</h2>
                    <div class="form-group">
                        <label for="name">
                            <span class="material-symbols-outlined">verified</span>
                            Certification Name
                        </label>
                        <input type="text" id="name" name="name" value="${certification.name}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="issuingOrg">
                            <span class="material-symbols-outlined">business</span>
                            Issuing Organization
                        </label>
                        <input type="text" id="issuingOrg" name="issuingOrganization" value="${certification.organization}" required>
                    </div>
                </div>

                <div class="form-section">
                    <h2>Certification Details</h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="issueDate">
                                <span class="material-symbols-outlined">event</span>
                                New Issue Date
                            </label>
                            <input type="date" id="issueDate" name="issueDate" required>
                        </div>
                        <div class="form-group">
                            <label for="expiryDate">
                                <span class="material-symbols-outlined">event_upcoming</span>
                                New Expiry Date
                            </label>
                            <input type="date" id="expiryDate" name="expiryDate" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="certNumber">
                            <span class="material-symbols-outlined">tag</span>
                            New Certification Number
                        </label>
                        <input type="text" id="certNumber" name="certificationNumber" required>
                    </div>
                </div>

                <div class="form-section">
                    <h2>Verification Details</h2>
                    <div class="form-group">
                        <label for="certFile">
                            <span class="material-symbols-outlined">upload_file</span>
                            Upload New Certificate (PDF/Image)
                        </label>
                        <input type="file" id="certFile" name="certificateFile" accept=".pdf,.jpg,.jpeg,.png" required>
                    </div>
                    
                    <div class="form-group radio-group">
                        <label>
                            <span class="material-symbols-outlined">public</span>
                            Global Certification Verification
                        </label>
                        <div class="radio-options">
                            <label class="radio-label">
                                <input type="radio" name="isglobal" value="GLOBAL" checked required>
                                Yes, verify globally
                            </label>
                            <label class="radio-label">
                                <input type="radio" name="isglobal" value="NOTGLOBAL">
                                No, keep it standard
                            </label>
                        </div>
                        <p class="help-text">Note: Global verification status cannot be changed once selected</p>
                    </div>
                    
                    <div class="form-group">
                        <label for="notes">
                            <span class="material-symbols-outlined">notes</span>
                            Additional Notes
                        </label>
                        <textarea id="notes" name="notes" rows="4">${certification.cinfo}</textarea>
                    </div>
                </div>
                
                <div class="form-actions">
                    <a href="${pageContext.request.contextPath}/renewals" class="reset-btn">
                        <span class="material-symbols-outlined">close</span>
                        Cancel
                    </a>
                    <button type="submit" class="submit-btn">
                        <span class="material-symbols-outlined">save</span>
                        Apply Renewal
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>