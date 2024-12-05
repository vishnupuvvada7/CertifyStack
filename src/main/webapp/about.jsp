<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - CertifyStack</title>
    <link rel="stylesheet" href="css/landing.css">
</head>
<body>
    <%@include file="navbar.jsp" %>
    
    <main class="main">
        <div class="background">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>

        <div class="container">
            <section class="about-section">
                <h1 class="section-title">About <span class="gradient-text">CertifyStack</span></h1>
                <div class="about-content glass-card">
                    <p class="about-description">
                        CertifyStack is a cutting-edge web application designed for managing professional certifications. 
                        Our platform helps users efficiently record certifications, track expiration dates, and handle 
                        renewals with ease. Through automated reminders and secure storage, we ensure your certifications 
                        are always up-to-date and easily accessible for verification.
                    </p>
                </div>
            </section>

            <section class="team-section">
                <h2 class="section-title">Our <span class="gradient-text">Team</span></h2>
                <div class="team-grid">
                    <div class="team-card glass-card">
                        <div class="team-info">
                            <h3 class="member-name">A. V. PRAVEEN KUMAR</h3>
                            <p class="member-role">Team Leader</p>
                            <div class="member-details">
                                <p>Student at KL University</p>
                                <p class="member-contact">7893445580</p>
                            </div>
                        </div>
                    </div>

                    <div class="team-card glass-card">
                        <div class="team-info">
                            <h3 class="member-name">P. VISHNU ASRITH</h3>
                            <p class="member-role">Team Member</p>
                            <div class="member-details">
                                <p>Student at KL University</p>
                                <p class="member-contact">6300036124</p>
                            </div>
                        </div>
                    </div>

                    <div class="team-card glass-card">
                        <div class="team-info">
                            <h3 class="member-name">M. S. S. SURENDRA</h3>
                            <p class="member-role">Team Member</p>
                            <div class="member-details">
                                <p>Student at KL University</p>
                                <p class="member-contact">917767162</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <%@include file="footer.jsp" %>
</body>
</html>