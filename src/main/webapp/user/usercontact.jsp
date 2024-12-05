<%@page import="com.klef.jfsd.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
User u = (User)session.getAttribute("user");
if(u==null){
	response.sendRedirect("sessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link rel="stylesheet" href="css/user/usercontact.css" >
</head>
<body>
	<jsp:include page="usernavbar.jsp" />
	
    <div class="contact-container">
        <h2 class="form-title">Contact Form</h2>
        
        
        <form action="usercontactsubmit" method="POST" id="contactForm">
            <div class="form-group">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name" value="${user.name}" readonly>
            </div>
            
            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="${user.email}" readonly>
            </div>
            
            <div class="form-group">
                <label class="form-label">Message</label>
                <textarea class="form-control" name="message" required placeholder="Please type your message here..."></textarea>
            </div>
            
            <button type="submit" class="submit-btn">Send Message</button>
        </form>
    </div>

</body>
</html>