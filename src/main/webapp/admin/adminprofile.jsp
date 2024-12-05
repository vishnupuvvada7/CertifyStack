<%@page import="com.klef.jfsd.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Profile - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/adminprofile.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <main class="main-content">
        <div class="profile-container">
            <div class="profile-header">
                <div class="header-content">
                    <h1>Profile Settings</h1>
                    <p>Manage your account information and preferences</p>
                </div>
            </div>
            
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
                        <form class="profile-form" action="${pageContext.request.contextPath}/updateadminprofile" method="POST">
                            <input type="hidden" id="id" name="username" value="${admin.username}">
                            <div class="form-group">
                                <label for="fullName">
                                    <span class="material-symbols-outlined">badge</span>
                                    Full Name
                                </label>
                                <input type="text" id="fullName" name="fullName" value="${admin.name}" class="form-input">
                            </div>
                            <div class="form-group">
                                <label for="username">
                                    <span class="material-symbols-outlined">alternate_email</span>
                                    Username
                                </label>
                                <input type="text" id="username" value="${admin.username}" class="form-input" readonly>
                            </div>
                            <div class="form-group">
                                <label for="email">
                                    <span class="material-symbols-outlined">mail</span>
                                    Email Address
                                </label>
                                <input type="email" id="email" name="email" value="${admin.email}" readonly class="form-input">
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
                        <form class="profile-form" action="${pageContext.request.contextPath}/updateadminpassword" method="POST">
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