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
    <title>Contact Management</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/viewcontacts.css">
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    
    <main class="main-content">
        <div class="contact-header">
            <div class="header-content">
                <h1>Contact Management</h1>
            </div>
            <div class="search-container">
                <div class="search-bar">
                    <span class="material-symbols-outlined">search</span>
                    <input type="text" id="searchInput" placeholder="Search contacts...">
                </div>
            </div>
        </div>

        <div class="table-wrapper">
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${contacts}" var="contact">
                            <tr>
                                <td>${contact.name}</td>
                                <td>${contact.email}</td>
                                <td>
                                    <button class="action-btn view-btn" 
                                            onclick="openViewModal('${contact.id}', '${contact.name}', '${contact.email}', '${contact.message}')">
                                        <span class="material-symbols-outlined">visibility</span>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- View Contact Modal -->
    <div id="viewModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Contact Details</h2>
                <span class="close-modal" onclick="closeViewModal()">&times;</span>
            </div>
            <div class="modal-body">
                <div class="contact-details">
                    <div class="detail-group">
                        <label>Name:</label>
                        <p id="modalName"></p>
                    </div>
                    <div class="detail-group">
                        <label>Email:</label>
                        <p id="modalEmail"></p>
                    </div>
                    <div class="detail-group">
                        <label>Message:</label>
                        <p id="modalMessage"></p>
                    </div>
                </div>
                <button class="reply-btn" onclick="openReplyModal()">
                    <span class="material-symbols-outlined">reply</span>
                    Reply
                </button>
            </div>
        </div>
    </div>

    <!-- Reply Modal -->
    <div id="replyModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Reply to Contact</h2>
                <span class="close-modal" onclick="closeReplyModal()">&times;</span>
            </div>
            <div class="modal-body">
                <form id="replyForm" action="${pageContext.request.contextPath}/admin/sendReply" method="POST">
                    <input type="hidden" id="contactId" name="contactId">
                    <div class="form-group">
                        <label for="replyTo">To:</label>
                        <input type="email" id="replyTo" name="replyTo" readonly>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject:</label>
                        <input type="text" id="subject" name="subject" required>
                    </div>
                    <div class="form-group">
                        <label for="replyMessage">Message:</label>
                        <textarea id="replyMessage" name="message" required></textarea>
                    </div>
                    <button type="submit" class="send-btn">
                        <span class="material-symbols-outlined">send</span>
                        Send Reply
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
        const viewModal = document.getElementById('viewModal');
        const replyModal = document.getElementById('replyModal');
        let currentContactId = null;

        function openViewModal(id, name, email, message) {
            currentContactId = id;
            document.getElementById('modalName').textContent = name;
            document.getElementById('modalEmail').textContent = email;
            document.getElementById('modalMessage').textContent = message;
            viewModal.style.display = 'block';
        }

        function closeViewModal() {
            viewModal.style.display = 'none';
        }

        function openReplyModal() {
            document.getElementById('contactId').value = currentContactId;
            document.getElementById('replyTo').value = document.getElementById('modalEmail').textContent;
            replyModal.style.display = 'block';
        }

        function closeReplyModal() {
            replyModal.style.display = 'none';
            document.getElementById('replyForm').reset();
        }

        window.onclick = function(event) {
            if (event.target === viewModal) {
                closeViewModal();
            }
            if (event.target === replyModal) {
                closeReplyModal();
            }
        }

        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const rows = document.querySelectorAll('tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });
    </script>
</body>
</html>