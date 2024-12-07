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
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Side Navbar</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/sidebar.css">
</head>
<body>
  <aside class="sidebar">
    <div class="sidebar-inner">
      <div class="sidebar-header">
          <a href="${pageContext.request.contextPath}/adminhome" class="logo">CertifyStack</a>
      </div>
      <div class="sidebar-content">
        <ul class="sidebar-links">
            <h4>
                <span>Main Menu</span>
                <div class="menu-separator"></div>
            </h4>
            <li>
                <a href="${pageContext.request.contextPath}/adminhome">
                    <span class="material-symbols-outlined">dashboard</span>
                    Dashboard
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admins">
                    <span class="material-symbols-outlined">account_circle</span>
                    Co-Admins
                </a>
            </li>

            <h4>
                <span>Management</span>
                <div class="menu-separator"></div>
            </h4>
            <li>
                <a href="${pageContext.request.contextPath}/viewusers">
                    <span class="material-symbols-outlined">group</span>
                    Users
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/viewcontacts">
                    <span class="material-symbols-outlined">contact_page</span>
                    Contacts
                </a>
            </li>

            <h4>
                <span>Approvals</span>
                <div class="menu-separator"></div>
            </h4>
            <li>
                <a href="${pageContext.request.contextPath}/verifyglobalcerts">
                    <span class="material-symbols-outlined">globe</span>
                    Global Certifications
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/approverenewals">
                    <span class="material-symbols-outlined">sync</span>
                    Renewals
                </a>
            </li>

            <h4>
                <span>Certifications</span>
                <div class="menu-separator"></div>
            </h4>
            <li>
                <a href="${pageContext.request.contextPath}/addcert">
                    <span class="material-symbols-outlined">add_circle</span>
                    Add Certification
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/certs">
                    <span class="material-symbols-outlined">view_list</span>
                    View Certifications
                </a>
            </li>

            <h4>
                <span>Account</span>
                <div class="menu-separator"></div>
            </h4>
            <li>
                <a href="${pageContext.request.contextPath}/adminprofile">
                    <span class="material-symbols-outlined">account_circle</span>
                    Profile
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/adminlogout">
                    <span class="material-symbols-outlined">logout</span>
                    Logout
                </a>
            </li>
        </ul>
      </div>
    </div>
  </aside>
</body>
</html>
