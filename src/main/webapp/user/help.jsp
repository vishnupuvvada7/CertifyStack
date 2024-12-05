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
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/help.css">
</head>
<body>
    <jsp:include page="usernavbar.jsp" />
    
    <div class="help-container">
        <div class="help-header">
            <h1>Help & Support</h1>
            <p>Find answers to common questions and learn how to use CertifyStack effectively</p>
        </div>

        <div class="help-content">
            <div class="help-section">
                <h2><i class="fas fa-star"></i> Getting Started</h2>
                <div class="help-card">
                    <h3>How to Add a New Certification</h3>
                    <ol>
                        <li>Click on "Add Certification" in the navigation menu</li>
                        <li>Fill in the required certification details</li>
                        <li>Upload your certificate file (PDF or image)</li>
                        <li>Click "Save Certification" to store your entry</li>
                    </ol>
                </div>
                <div class="help-card">
                    <h3>Managing Your Dashboard</h3>
                    <p>Your dashboard shows an overview of your certifications, including:</p>
                    <ul>
                        <li>Active certifications count</li>
                        <li>Certifications expiring soon</li>
                        <li>Recently added certifications</li>
                    </ul>
                </div>
            </div>

            <div class="help-section">
                <h2><i class="fas fa-sync"></i> Renewal Process</h2>
                <div class="help-card">
                    <h3>Tracking Renewals</h3>
                    <p>CertifyStack automatically tracks your certification expiry dates and will:</p>
                    <ul>
                        <li>Send notifications 90 days before expiry</li>
                        <li>Mark certifications as "Expiring Soon" 60 days before expiry</li>
                        <li>Highlight expired certifications in red</li>
                    </ul>
                </div>
            </div>

            <div class="help-section">
                <h2><i class="fas fa-question-circle"></i> FAQ</h2>
                <div class="faq-container">
                    <details class="faq-item">
                        <summary>How do I update my certification details?</summary>
                        <p>Navigate to your certifications list, find the certification you want to update, and click the "Edit" button. Make your changes and save.</p>
                    </details>
                    <details class="faq-item">
                        <summary>How do I delete my certification?</summary>
                        <p>Navigate to your certifications list, find the certification you want to delete, and click the "Edit" button. Go to the End of the page. There is a Danger Zone to delete. Make sure that once you delete the certificate there is no going back. Please be certain.</p>
                    </details>
                    <details class="faq-item">
                        <summary>Can I download my certification files?</summary>
                        <p>Yes, you can download any certification files you've uploaded by viewing the certification details and clicking the download button.</p>
                    </details>
                    <details class="faq-item">
                        <summary>How do I set up email notifications?</summary>
                        <p>Go to your profile settings and update your notification preferences under the "Notifications" tab.</p>
                    </details>
                </div>
            </div>

            <div class="help-section">
                <h2><i class="fas fa-envelope"></i> Contact Support</h2>
                <div class="contact-card">
                    <p>Need additional help? Our support team is here for you.</p>
                    <div class="contact-options">
                        <a href="mailto:support@certifystack.com" class="contact-btn">
                            <i class="fas fa-envelope"></i> Email Support
                        </a>
                        <a href="tel:9999999999" class="contact-btn">
                            <i class="fas fa-comments"></i> Live Chat
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>