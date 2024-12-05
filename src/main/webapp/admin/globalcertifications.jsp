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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Certifications - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/globalcertifications.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <main class="main-content">
        <div class="certifications-header">
            <div class="header-content">
                <h1>Global Certification Approvals</h1>
                <p>Review and approve global certification requests</p>
            </div>
        </div>

        <div class="certifications-grid">
            <c:forEach items="${certifications}" var="cert">
                <div class="cert-card">
                    <div class="cert-header">
                        <span class="material-symbols-outlined cert-icon">verified</span>
                        <h3>${cert.name}</h3>
                    </div>
                    <div class="cert-body">
                        <div class="user-info">
                            <span class="material-symbols-outlined">person</span>
                            <p>${cert.username}</p>
                        </div>
                        <div class="cert-meta">
                            <div class="meta-item">
                                <span class="material-symbols-outlined">business</span>
                                <span>${cert.organization}</span>
                            </div>
                            <div class="meta-item">
                                <span class="material-symbols-outlined">calendar_today</span>
                                <span>Issued: ${cert.issuedate}</span>
                            </div>
                            <div class="meta-item">
                                <span class="material-symbols-outlined">event</span>
                                <span>Expires: ${cert.expirydate}</span>
                            </div>
                        </div>
                    </div>
                    <div class="cert-actions">
                        <button class="view-btn" onclick="openViewModal(${cert.id}, '${cert.name}', '${cert.username}', '${cert.organization}', '${cert.validationid}', '${cert.issuedate}', '${cert.expirydate}', '${cert.cdoc}')">
                            <span class="material-symbols-outlined">visibility</span>
                            View Details
                        </button>
                        <a href="<c:url value="approveglobal?id=${cert.id}&isglobal=GLOBAL"></c:url>" class="approve-btn">
                            <span class="material-symbols-outlined">check_circle</span>
                            Approve
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div id="viewModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Certification Details</h2>
                    <button class="close-btn" onclick="closeViewModal()">
                        <span class="material-symbols-outlined">close</span>
                    </button>
                </div>
                <div class="cert-details">
                    <div class="cert-detail-item">
                        <span class="detail-label">Certificate Name:</span>
                        <span class="detail-value" id="modalCertName"></span>
                    </div>
                    <div class="cert-detail-item">
                        <span class="detail-label">Username:</span>
                        <span class="detail-value" id="modalUsername"></span>
                    </div>
                    <div class="cert-detail-item">
                        <span class="detail-label">Organization:</span>
                        <span class="detail-value" id="modalOrganization"></span>
                    </div>
                    <div class="cert-detail-item">
                        <span class="detail-label">Validation ID:</span>
                        <span class="detail-value" id="modalValidationId"></span>
                    </div>
                    <div class="cert-detail-item">
                        <span class="detail-label">Issue Date:</span>
                        <span class="detail-value" id="modalIssueDate"></span>
                    </div>
                    <div class="cert-detail-item">
                        <span class="detail-label">Expiry Date:</span>
                        <span class="detail-value" id="modalExpiryDate"></span>
                    </div>
                    <div class="cert-detail-item">
                        <span class="detail-label">Document:</span>
                        <span class="detail-value">
                            <a id="certificateLink" class="view-cert-btn" target="_blank">
                                <i class="fas fa-file-pdf"></i> View Certificate
                            </a>
                        </span>
                    </div>
                </div>
                <div class="modal-actions">
                    <button class="modal-btn close-modal-btn" onclick="closeViewModal()">Close</button>
                    <a id="approvelink" class="modal-btn approve-modal-btn">Approve</a>
                </div>
            </div>
        </div>

        <script>
            let currentCertId = null;

            function openViewModal(id, name, username, organization, validationid, issuedate, expirydate, cdoc) {
                document.getElementById('modalCertName').textContent = name;
                document.getElementById('modalUsername').textContent = username;
                document.getElementById('modalOrganization').textContent = organization;
                document.getElementById('modalValidationId').textContent = validationid;
                document.getElementById('modalIssueDate').textContent = issuedate;
                document.getElementById('modalExpiryDate').textContent = expirydate;
                
                const certificateLink = document.getElementById('certificateLink');
                certificateLink.href = '${pageContext.request.contextPath}/displaycertpdf?id='+id;
                
                const approvelink = document.getElementById('approvelink');
                approvelink.href = 'approveglobal?id='+id+'&isglobal=GLOBAL'; 
                
                document.getElementById('viewModal').style.display = 'flex';
            }

            function closeViewModal() {
                document.getElementById('viewModal').style.display = 'none';
                currentCertId = null;
            }

            window.onclick = function(event) {
                const modal = document.getElementById('viewModal');
                if (event.target === modal) {
                    closeViewModal();
                }
            }
        </script>
    </main>
</body>
</html>