<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CertifyStack - Professional Certification Management</title>
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

        <section class="hero">
            <div class="container">
                <div class="hero-content">
                    <div class="hero-text">
                        <h1 class="hero-title">
                            Track, Manage<br>
                            and Verify your<br>
                            <span class="gradient-text">Certifications</span>
                        </h1>
                        <p class="hero-description">
                            Streamline your certification journey with our comprehensive tracking 
                            and management platform. Never miss a renewal deadline again.
                        </p>
                        <a href="login" class="cta-button">Get Started</a>
                        
                    </div>
                    <div class="hero-visual">
                        <div class="floating-cards">
                            <div class="card card-1">
                                <div class="card-content">
                                    <div class="card-icon"></div>
                                    <h3 align="center" >Certification Tracking </h3>
                                    
                                </div>
                            </div>
                            <div class="card card-2">
                                <div class="card-content">
                                    <div class="card-icon"></div>
                                    <h3 align="center" >Renewal Reminders</h3>
                                    
                                </div>
                            </div>
                            <div class="card card-3">
                                <div class="card-content">
                                    <div class="card-icon"></div>
                                    <h3 align="center" >Skill Verification</h3>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="features">
            <div class="container">
                <h2 class="section-title">Why Choose <span class="gradient-text">CertifyStack</span>?</h2>
                <div class="features-grid">
                    <div class="feature-card">
                        <div class="feature-icon">📊</div>
                        <h3>Track Progress</h3>
                        <p>Monitor your certification journey from start to finish with detailed analytics and insights.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">✓</div>
                        <h3>Easy Verification</h3>
                        <p>Instantly verify your certifications with potential employers through our secure platform.</p>
                    </div>
                    <div class="feature-card">
                        <div class="feature-icon">🔔</div>
                        <h3>Smart Notifications</h3>
                        <p>Get timely reminders for renewals and updates to stay ahead of deadlines.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <%@include file="footer.jsp" %>
</body>
</html>