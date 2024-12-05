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
    <title>View Certifications - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/viewcertifications.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <main class="main-content">
        <div class="page-header">
            <div class="header-content">
                <h1>Certifications</h1>
                <p>Manage and monitor available certifications</p>
            </div>
            <div class="header-actions">
                <div class="search-bar">
                    <span class="material-symbols-outlined">search</span>
                    <input type="text" id="searchInput" placeholder="Search certifications...">
                </div>
                <div class="filters">
                    <select id="providerFilter">
                        <option value="">All Providers</option>
                        <c:forEach items="${providers}" var="provider">
                            <option value="${provider}">${provider}</option>
                        </c:forEach>
                    </select>
                    <select id="levelFilter">
                        <option value="">All Levels</option>
                        <option value="beginner">Beginner</option>
                        <option value="intermediate">Intermediate</option>
                        <option value="advanced">Advanced</option>
                    </select>
                </div>
            </div>
        </div>
        
        <div class="certifications-table">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Provider</th>
                        <th>Level</th>
                        <th>Duration</th>
                        <th>Questions</th>
                        <th>Cost</th>
                        <th>Validity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${certifications}" var="cert">
                        <tr>
                            <td>
                                <div class="cert-name">
                                    <span class="material-symbols-outlined">verified</span>
                                    ${cert.name}
                                </div>
                            </td>
                            <td>
                                <div class="provider-name">
                                    <span class="material-symbols-outlined">business</span>
                                    ${cert.provider}
                                </div>
                            </td>
                            <td>
                                <span class="level-badge ${cert.level.toLowerCase()}">${cert.level}</span>
                            </td>
                            <td>${cert.duration} mins</td>
                            <td>${cert.questions}</td>
                            <td>$${cert.cost}</td>
                            <td>${cert.validity} years</td>
                            <td class="actions">
                                <button class="action-btn edit-btn" title="Edit">
                                    <span class="material-symbols-outlined">edit</span>
                                </button>
                                <a href="deletecertification/${cert.id}" class="action-btn delete-btn" title="Delete">
                                    <span class="material-symbols-outlined">delete</span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            filterTable();
        });

        // Filter functionality
        document.getElementById('providerFilter').addEventListener('change', filterTable);
        document.getElementById('levelFilter').addEventListener('change', filterTable);

        function filterTable() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            const providerFilter = document.getElementById('providerFilter').value.toLowerCase();
            const levelFilter = document.getElementById('levelFilter').value.toLowerCase();
            
            const rows = document.querySelectorAll('tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                const provider = row.querySelector('.provider-name').textContent.toLowerCase();
                const level = row.querySelector('.level-badge').textContent.toLowerCase();
                
                const matchesSearch = text.includes(searchTerm);
                const matchesProvider = !providerFilter || provider.includes(providerFilter);
                const matchesLevel = !levelFilter || level === levelFilter;
                
                row.style.display = matchesSearch && matchesProvider && matchesLevel ? '' : 'none';
            });
        }
    </script>
</body>
</html>