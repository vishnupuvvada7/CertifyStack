<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - CertifyStack</title>
    <link rel="stylesheet" href="css/landing.css">
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

        .toast.error {
            background-color: #f44336;
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
    <%@include file="navbar.jsp" %>
    
    <!-- Conditionally render the toast only if a message is present -->
    <% if (request.getAttribute("message") != null) { %>
        <div id="toast" class="toast <%= request.getAttribute("toastType") %>">
            <span id="toastMessage"><%= request.getAttribute("message") %></span>
            <button class="close-btn" onclick="closeToast()">&times;</button>
        </div>
    <% } %>

    <main class="main">
        <div class="background">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>

        <div class="container">
            <section class="contact-section">
                <h1 class="section-title">Contact <span class="gradient-text">Us</span></h1>
                
                <div class="contact-container glass-card">
                    <form class="contact-form" id="contactForm" action="contactsubmit" method="POST">
                        <div class="form-group">
                            <input type="text" id="fullName" name="fullName" required>
                            <label for="fullName">Full Name</label>
                        </div>

                        <div class="form-group">
                            <input type="email" id="email" name="email" required>
                            <label for="email">Email Address</label>
                        </div>

                        <div class="form-group">
                            <textarea id="message" name="message" required></textarea>
                            <label for="message">Your Message</label>
                        </div>

                        <button type="submit" class="submit-btn">Send Message</button>
                    </form>
                </div>
            </section>
        </div>
    </main>

    <%@include file="footer.jsp" %>

    <script>
        // Show toast if present
        document.addEventListener("DOMContentLoaded", function() {
            const toast = document.getElementById("toast");
            if (toast) {
                toast.style.display = "block";
                setTimeout(() => {
                    if (!toast.classList.contains('hide')) {
                        toast.classList.add("hide");
                        toast.addEventListener("transitionend", () => toast.remove());
                    }
                }, 3000);
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
