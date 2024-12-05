<%@page import="com.klef.jfsd.model.Superadmin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Superadmin sa = (Superadmin)session.getAttribute("superadmin");
if(sa==null){
	response.sendRedirect("sessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Management</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/superadmin.css" >
    <style>
        .toast {
		    display: none;
		    position: fixed;
		    top: 100px;
		    right: 20px;
		    padding: 15px 20px;
		    background-color: #333;
		    color: #fff;
		    border-radius: 5px;
		    opacity: 0.9;
		    z-index: 1000;
		    transition: opacity 0.5s, transform 0.5s;
		    max-width: 300px;
		    font-size: 18px;
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}
		
		.toast.success {
		    background-color: #4caf50;
		}
		
		.toast.hide {
		    opacity: 0;
		    transform: translateX(100%);
		}
		
		.toast .close-btn {
		    position: absolute;
		    top: 5px;
		    right: 10px;
		    font-size: 16px;
		    color: #fff;
		    cursor: pointer;
		    background: none;
		    border: none;
		}
    </style>
</head>
<body>
    <div class="container">
    
		<div class="header">
            <h2>Admin Management</h2>
            
		    
            <div class="header-actions">
                <button class="btn btn-primary" onclick="openModal('adminModal')">
                    <i class="fas fa-plus"></i> New Admin
                </button>
                <a href="superadminlogout" class="btn-logout">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
		
		<!-- Conditionally render the toast only if a message is present -->
	    <% if (request.getAttribute("loginsuccess") != null) { %>
		    <div id="toast" class="toast success">
		        <span id="toastMessage"><%= request.getAttribute("loginsuccess") %></span>
		        <button class="close-btn" onclick="closeToast()">&times;</button>
		    </div>
		<% } %>

        <!-- Admin List Table -->
        <div class="card">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th class="text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${adminlist}" var="admin">
                        <tr>
                            <td>${admin.name}</td>
                            <td>${admin.username}</td>
                            <td>${admin.email}</td>
                            <td class="text-center">
                                <i class="fas fa-edit action-icon edit" 
                                   onclick="editAdmin('${admin.name}', '${admin.username}', '${admin.email}')"
                                   title="Edit"></i>
                                <i class="fas fa-trash-alt action-icon delete" 
                                   onclick="confirmDelete('${admin.username}')"
                                   title="Delete"></i>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Admin Modal -->
    <div id="adminModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="modalTitle">Add New Admin</h5>
                <span class="close" onclick="closeModal('adminModal')">&times;</span>
            </div>
            <div class="modal-body">
                <form id="adminForm" action="insertadmin" method="POST">
                    <input type="hidden" id="editMode" name="editMode" value="false">
                    
                    <div class="form-group">
                        <label class="form-label" for="name">Name:</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="username">Username:</label>
                        <input type="text" id="username" name="username" class="form-control" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="email">Email:</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="password">Password:</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="closeModal('adminModal')">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h5>Confirm Delete</h5>
                <span class="close" onclick="closeModal('deleteModal')">&times;</span>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this admin?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeModal('deleteModal')">Cancel</button>
                <form id="deleteForm" action="deleteadmin" method="POST">
                    <input type="hidden" id="deleteUsername" name="username">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        function openModal(modalId) {
            document.getElementById(modalId).classList.add('show');
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('show');
            if (modalId === 'adminModal') {
                resetForm();
            }
        }

        function editAdmin(name, username, email) {
            document.getElementById('modalTitle').textContent = 'Edit Admin';
            document.getElementById('editMode').value = 'true';
            document.getElementById('name').value = name;
            document.getElementById('username').value = username;
            document.getElementById('username').readOnly = true;  // Make the username field uneditable
            document.getElementById('email').value = email;
            document.getElementById('password').required = false;
            document.getElementById('adminForm').action = 'updateadmin';
            openModal('adminModal');
        }


        function confirmDelete(username) {
            document.getElementById('deleteUsername').value = username;
            openModal('deleteModal');
        }

        function resetForm() {
            document.getElementById('adminForm').reset();
            document.getElementById('modalTitle').textContent = 'Add New Admin';
            document.getElementById('editMode').value = 'false';
            document.getElementById('password').required = true;
            document.getElementById('adminForm').action = 'insertadmin';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                closeModal(event.target.id);
            }
        }
        
	     // Show toast if present
	        document.addEventListener("DOMContentLoaded", function() {
	            const toast = document.getElementById("toast");
	            if (toast) {
	                toast.style.display = "block";
	                setTimeout(() => {
	                    if (!toast.classList.contains('hide')) {
	                        closeToast();
	                    }
	                }, 3000); // Auto close after 3 seconds
	            }
	        });
	
	        function closeToast() {
	            const toast = document.getElementById("toast");
	            if (toast) {
	                toast.classList.add("hide");
	                toast.addEventListener("transitionend", () => toast.remove());
	            }
	        }

    </script>
</body>
</html>