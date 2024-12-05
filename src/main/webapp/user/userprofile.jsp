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
    <title>Profile - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/userprofile.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="usernavbar.jsp" />
    <main class="main-content">
        <div class="profile-container">
            <div class="profile-header">
                <div class="header-content">
                    <div class="profile-info">
                        <div class="profile-avatar">
                            <c:choose>
                                <c:when test="${user.profilepic != null}">
                                    <form method="post" action="addprofilepic" enctype="multipart/form-data">
                                        <div class="avatar-placeholder">
                                            <label for="fileInput" style="cursor: pointer;">
                                                <img src="displayprofilepic?id=${user.id}" alt="Profile picture">
                                            </label>
                                        </div>
                                        <input type="file" id="fileInput" name="profile" accept="image/*" style="display: none;" onchange="this.form.submit()" />
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <form method="post" action="addprofilepic" enctype="multipart/form-data">
                                        <div class="avatar-placeholder">
                                            <label for="fileInput" style="cursor: pointer;">
                                                <span class="material-symbols-outlined">account_circle</span>
                                            </label>
                                        </div>
                                        <input type="file" id="fileInput" name="profile" accept="image/*" style="display: none;" onchange="this.form.submit()" />
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="user-details">
                            <h2 class="user-name">${user.name}</h2>
                            <p class="user-username">Username: ${user.username}</p>
                            <p class="user-email">Email: ${user.email}</p>
                        </div>
                    </div>
                    
                </div>
            </div>
            
            <%-- <h4 class="message success"><c:out value="${smessage}" /></h4>
            <h4 class="message error"><c:out value="${fmessage}" /></h4> --%>
            
            <div class="profile-content">
                <div class="profile-nav">
                    <button class="nav-btn active" data-tab="personal">
                        <span class="material-symbols-outlined">person</span>
                        Personal Info
                    </button>
                    <button class="nav-btn" data-tab="security">
                        <span class="material-symbols-outlined">lock</span>
                        Security
                    </button>
                </div>

                <div class="profile-sections">
                    <section class="profile-section active" id="personal">
                        <div class="section-header">
                            <h2>Personal Information</h2>
                            <p>Update your personal details and contact information</p>
                        </div>
                        <form class="profile-form" action="${pageContext.request.contextPath}/updateprofile" method="POST">
                            <input type="hidden" id="id" name="id" value="${user.id}">
                            <div class="form-group">
                                <label for="fullName">
                                    <span class="material-symbols-outlined">badge</span>
                                    Full Name
                                </label>
                                <input type="text" id="fullName" name="fullName" value="${user.name}" class="form-input">
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="gender">
                                        <span class="material-symbols-outlined">person</span>
                                        Gender
                                    </label>
                                    <select id="gender" name="gender" class="form-input" required>
                                        <option value="MALE" ${user.gender == 'MALE' ? 'selected' : ''}>Male</option>
                                        <option value="FEMALE" ${user.gender == 'FEMALE' ? 'selected' : ''}>Female</option>
                                        <option value="OTHER" ${user.gender == 'OTHER' ? 'selected' : ''}>Other</option>
                                        <option value="NA" ${user.gender == 'NA' ? 'selected' : ''}>Not Available</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="dob">
                                        <span class="material-symbols-outlined">calendar_today</span>
                                        Date of Birth
                                    </label>
                                    <input type="text" id="dob" name="dob" value="${user.dateofbirth}" readonly class="form-input">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="email">
                                        <span class="material-symbols-outlined">mail</span>
                                        Email
                                    </label>
                                    <input type="email" id="email" name="email" value="${user.email}" readonly class="form-input">
                                </div>
                                <div class="form-group">
                                    <label for="phone">
                                        <span class="material-symbols-outlined">phone</span>
                                        Phone
                                    </label>
                                    <input type="tel" id="phone" name="phone" value="${user.contact}" class="form-input">
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn-primary">
                                    <span class="material-symbols-outlined">save</span>
                                    Save Changes
                                </button>
                            </div>
                        </form>
                    </section>

                    <section class="profile-section" id="security">
                        <div class="section-header">
                            <h2>Security Settings</h2>
                            <p>Manage your password and security preferences</p>
                        </div>
                        <form class="profile-form" action="${pageContext.request.contextPath}/updatepassword" method="POST">
                            <div class="form-group">
                                <label for="currentPassword">
                                    <span class="material-symbols-outlined">key</span>
                                    Current Password
                                </label>
                                <input type="password" id="currentPassword" name="currentPassword" class="form-input">
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="newPassword">
                                        <span class="material-symbols-outlined">lock_reset</span>
                                        New Password
                                    </label>
                                    <input type="password" id="newPassword" name="newPassword" class="form-input">
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword">
                                        <span class="material-symbols-outlined">done_all</span>
                                        Confirm Password
                                    </label>
                                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-input">
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn-primary">
                                    <span class="material-symbols-outlined">security</span>
                                    Update Password
                                </button>
                            </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>

        <script>
            document.querySelectorAll('.nav-btn').forEach(button => {
                button.addEventListener('click', () => {
                    document.querySelectorAll('.nav-btn').forEach(btn => btn.classList.remove('active'));
                    document.querySelectorAll('.profile-section').forEach(section => section.classList.remove('active'));
                    
                    button.classList.add('active');
                    document.getElementById(button.dataset.tab).classList.add('active');
                });
            });
        </script>
    </main>
</body>
</html>