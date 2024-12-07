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
    <style>
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            inset: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            backdrop-filter: blur(4px);
        }

        .modal-content {
            position: relative;
            background-color: white;
            margin: 5% auto;
            padding: 2rem;
            width: 90%;
            max-width: 600px;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .modal-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #000066;
        }

        .close-modal {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #64748b;
        }

        .modal-body {
            margin-bottom: 1.5rem;
        }

        .detail-row {
            display: flex;
            margin-bottom: 1rem;
            padding: 0.75rem;
            background-color: #f8fafc;
            border-radius: 8px;
        }

        .detail-label {
            width: 140px;
            font-weight: 600;
            color: #475569;
        }

        .detail-value {
            flex: 1;
            color: #1e293b;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            padding-top: 1rem;
            border-top: 1px solid #e2e8f0;
        }

        .modal-btn {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .modal-approve-btn {
            background: #4f46e5;
    color: white;
    text-decoration: none;
        }

        .modal-approve-btn:hover {
            background: #4338ca;
        }

        .modal-close-btn {
            background-color: #e2e8f0;
            color: #475569;
            border: none;
        }

        .modal-close-btn:hover {
            background-color: #cbd5e0;
        }
    </style>
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
                            <th>Renewal Date</th>
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
                                    <button class="view-btn" onclick="openModal('${renewal.id}', '${renewal.username}', '${renewal.name}','${renewal.organization}','${renewal.validationid}', '${renewal.expirydate}')" title="View Details">
                                        <span class="material-symbols-outlined">visibility</span>
                                    </button>
                                    <a class="approve-btn" href="approverenewal?id=${renewal.id}" title="Approve Renewal">
                                        <span class="material-symbols-outlined">check_circle</span>
                                    </a>
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

    <!-- Modal -->
    <div id="renewalModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Renewal Details</h2>
                <button class="close-modal" onclick="closeModal()">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="detail-row">
                    <div class="detail-label">User</div>
                    <div class="detail-value" id="modalUsername"></div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Certification</div>
                    <div class="detail-value" id="modalCertName"></div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Organization</div>
                    <div class="detail-value" id="modalOrganization"></div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Validation Id</div>
                    <div class="detail-value" id="modalValidationId"></div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Renewal Date</div>
                    <div class="detail-value" id="modalExpiryDate"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="modal-btn modal-close-btn" onclick="closeModal()">Close</button>
                <button class="modal-btn modal-approve-btn" id="modalApproveBtn">Approve Renewal</button>
            </div>
        </div>
    </div>

    <script>
        // Modal functionality
        const modal = document.getElementById('renewalModal');
        
        function openModal(id, username, certName,organization,validationId, expiryDate) {
            modal.style.display = 'block';
            document.getElementById('modalUsername').textContent = username;
            document.getElementById('modalCertName').textContent = certName;
            document.getElementById('modalOrganization').textContent = organization;
            document.getElementById('modalValidationId').textContent = validationId;
            document.getElementById('modalExpiryDate').textContent = expiryDate;
            document.getElementById('modalApproveBtn').onclick = function() {
                window.location.href = `approverenewal?id=${id}`;
            };
        }

        function closeModal() {
            modal.style.display = 'none';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            if (event.target === modal) {
                closeModal();
            }
        }

        // Filter buttons functionality
        document.querySelectorAll('.filter-btn').forEach(button => {
            button.addEventListener('click', () => {
                document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
                button.classList.add('active');
            });
        });
    </script>
</body>
</html>
