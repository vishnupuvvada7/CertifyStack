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
    <title>Renewals - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/renewals.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <main class="main-content">
        <div class="renewals-header">
            <div class="header-content">
                <h1>Certification Renewals</h1>
                <p>Manage certification renewal requests</p>
            </div>
        </div>

        <div class="renewals-table">
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Certification</th>
                            <!-- <th>Expiry Date</th> -->
                            <th>Renewal Date</th>
                            <!-- <th>Status</th> -->
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${renewals}" var="renewal">
                            <tr>
                                <td>
                                    <div class="user-info">
                                        <span class="material-symbols-outlined">person</span>
                                        ${renewal.username}
                                    </div>
                                </td>
                                <td>
                                    <div class="cert-info">
                                        <span class="material-symbols-outlined">verified</span>
                                        ${renewal.name}
                                    </div>
                                </td>
                                <td>${renewal.expirydate}</td>

                                <td class="actions">
                                    <button class="view-btn" title="View Details">
                                        <span class="material-symbols-outlined">visibility</span>
                                    </button>
                                    <button class="approve-btn" title="Approve Renewal">
                                        <span class="material-symbols-outlined">check_circle</span>
                                    </button>
                                    <a class="reject-btn" href="deletecertificate" title="Reject Renewal">
                                        <span class="material-symbols-outlined">cancel</span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <script>
        document.querySelectorAll('.filter-btn').forEach(button => {
            button.addEventListener('click', () => {
                document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
                button.classList.add('active');
            });
        });
    </script>
</body>
</html>