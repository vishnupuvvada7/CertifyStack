<%@page import="com.klef.jfsd.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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
    <title>Add Certification - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/forms.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="usernavbar.jsp" />
    <main class="main-content">
        <div class="page-header">
            <div class="header-content">
                <h1>Add Your Certification</h1>
                <p>Upload and manage your professional certifications</p>
            </div>
        </div>
        
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/savecertificate" method="POST" enctype="multipart/form-data" class="certification-form">
                <div class="form-section">
                    <h2>Basic Information</h2>
                    <div class="form-group">
                        <label for="name">
                            <span class="material-symbols-outlined">verified</span>
                            Certification Name
                        </label>
                        <input type="text" id="name" name="name" required placeholder="Enter certification name">
                    </div>
                    
                    <div class="form-group">
                        <label for="issuingOrg">
                            <span class="material-symbols-outlined">business</span>
                            Issuing Organization
                        </label>
                        <input type="text" id="issuingOrg" name="issuingOrganization" required placeholder="Enter issuing organization">
                    </div>
                </div>

                <div class="form-section">
                    <h2>Certification Details</h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="issueDate">
                                <span class="material-symbols-outlined">event</span>
                                Issue Date
                            </label>
                            <input type="date" id="issueDate" name="issueDate" required>
                        </div>
                        <div class="form-group">
                            <label for="expiryDate">
                                <span class="material-symbols-outlined">event_upcoming</span>
                                Expiry Date
                            </label>
                            <input type="date" id="expiryDate" name="expiryDate">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="certNumber">
                            <span class="material-symbols-outlined">tag</span>
                            Certification Number
                        </label>
                        <input type="text" id="certNumber" name="certificationNumber" placeholder="Enter certification number">
                    </div>
                </div>

                <div class="form-section">
                    <h2>Verification Details</h2>
                    <div class="form-group">
                        <label for="certFile">
                            <span class="material-symbols-outlined">upload_file</span>
                            Upload Certificate (PDF/Image)
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
                                <input type="radio" name="isglobal" value="SUBMITTED" required>
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
                        <textarea id="notes" name="notes" rows="4" placeholder="Add any additional information about your certification"></textarea>
                    </div>
                </div>
                
                <div class="form-actions">
                    <a href="${pageContext.request.contextPath}/certifications" class="reset-btn">
                        <span class="material-symbols-outlined">close</span>
                        Cancel
                    </a>
                    <button type="submit" class="submit-btn">
                        <span class="material-symbols-outlined">save</span>
                        Save Certification
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>