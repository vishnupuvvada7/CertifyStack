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
    <title>My Certifications - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/certifications.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="usernavbar.jsp" />
    <main class="main-content">
        <div class="content-container">
            <div class="page-header">
                <div class="header-content">
                    <h1>My Certifications</h1>
                    <p>Manage and view your certification portfolio</p>
                </div>
            </div>

            <div class="actions-bar">
                <div class="search-section">
                    <div class="search-wrapper">
                        <span class="material-symbols-outlined">search</span>
                        <input type="text" id="searchInput" placeholder="Search certifications..." class="search-input">
                    </div>
                </div>

                <div class="filter-section">
                    <form id="filterForm" action="/certifications/filter" method="get">
                        <select name="filter" class="filter-select" onchange="this.form.submit()">
                            <option value="ALL" ${'ALL'.equals(selectedFilter) ? 'selected' : ''}>All Status</option>
                            <option value="ACTIVE" ${'ACTIVE'.equals(selectedFilter) ? 'selected' : ''}>Active</option>
                            <option value="EXPIRED" ${'EXPIRED'.equals(selectedFilter) ? 'selected' : ''}>Expired</option>
                            <option value="EXPIRINGSOON" ${'EXPIRING'.equals(selectedFilter) ? 'selected' : ''}>Expiring Soon</option>
                            <option value="GLOBAL" ${'GLOBAL'.equals(selectedFilter) ? 'selected' : ''}>Global</option>
                            <option value="SUBMITTED" ${'SUBMITTED'.equals(selectedFilter) ? 'selected' : ''}>Submitted for Global Verification</option>
                        </select>
                    </form>
                    <a href="${pageContext.request.contextPath}/addcertificate" class="btn-primary">
                        <span class="material-symbols-outlined">add</span>
                        Add New
                    </a>
                </div>
            </div>

            <div class="content-body">
                <c:choose>
                    <c:when test="${certificates.isEmpty()}">
                        <div class="empty-state">
                            <span class="material-symbols-outlined">school</span>
                            <p>No Certifications Available</p>
                            <a href="${pageContext.request.contextPath}/addcertificate" class="btn-primary">
                                Add Your First Certification
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="certifications-grid" id="certsGrid">
                            <c:forEach items="${certificates}" var="cert">
                                <div class="cert-card" data-cert-name="${cert.name.toLowerCase()}" data-org="${cert.organization.toLowerCase()}">
                                    <div class="cert-header">
                                        <h3>${cert.name}</h3>
                                        <span class="status-badge ${cert.isglobal}">${cert.isglobal}</span>
                                    </div>
                                    <div class="cert-body">
                                        <p>
                                            <span class="material-symbols-outlined">business</span>
                                            ${cert.organization}
                                        </p>
                                        <p>
                                            <span class="material-symbols-outlined">event</span>
                                            Issued: ${cert.issuedate}
                                        </p>
                                        <p>
                                            <span class="material-symbols-outlined">event_busy</span>
                                            Expires: ${cert.expirydate}
                                        </p>
                                    </div>
                                    <div class="cert-footer">
                                        <a href="${pageContext.request.contextPath}/viewcertificate/${cert.id}" class="btn-secondary">
                                            <span class="material-symbols-outlined">visibility</span>
                                            View
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

    <script>
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const certCards = document.querySelectorAll('.cert-card');
            let hasVisibleCards = false;

            certCards.forEach(card => {
                const certName = card.getAttribute('data-cert-name');
                const orgName = card.getAttribute('data-org');
                const cardContent = card.textContent.toLowerCase();
                
                const isVisible = 
                    certName.includes(searchTerm) || 
                    orgName.includes(searchTerm) || 
                    cardContent.includes(searchTerm);
                
                card.style.display = isVisible ? '' : 'none';
                if (isVisible) hasVisibleCards = true;
            });

            const existingNoResults = document.querySelector('.no-results');
            if (!hasVisibleCards) {
                if (!existingNoResults) {
                    const noResults = document.createElement('div');
                    noResults.className = 'no-results';
                    noResults.innerHTML = `
                        <div class="empty-state">
                            <span class="material-symbols-outlined">search_off</span>
                            <p>No certifications found matching your search.</p>
                        </div>
                    `;
                    document.getElementById('certsGrid').appendChild(noResults);
                }
            } else if (existingNoResults) {
                existingNoResults.remove();
            }
        });
    </script>
</body>
</html>