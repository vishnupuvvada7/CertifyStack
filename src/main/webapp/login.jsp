<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | CertifyStack</title>
    <link type="text/css" rel="stylesheet" href="css/login.css">
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
    <main class="main">
        <div class="background">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>

        <% if (request.getAttribute("regsuccessmessage") != null) { %>
        <div id="toast" class="toast <%= request.getAttribute("toastType") %>">
            <span id="toastMessage"><%= request.getAttribute("regsuccessmessage") %></span>
            <button class="close-btn" onclick="closeToast()">&times;</button>
        </div>
    	<% } %>
        
          

        <div class="login-container">
        <h4 align="center" style="color:red" ><c:out value="${message}" ></c:out> </h4>
        <h4 align="center" style="color:green" ><c:out value="${forgotmessage}" ></c:out> </h4>
            <div class="form-header">
                <h2>Welcome Back</h2>
                <p class="subtitle">Please enter your details</p>
            </div>

            <form method="post" action="checklogin">
                <div class="form-group">
                    <input type="text" name="username" required id="username">
                    <label for="username">Username or Email</label>
                    <div class="bar"></div>
                </div>
                
                <div class="form-group">
                    <input type="password" name="password" required id="password">
                    <label for="password">Password</label>
                    <div class="bar"></div>
                </div>
                
                <div class="form-footer">
                    <div class="forgot">
                        <a href="forgot">Forgot password?</a>
                    </div>
                    
                    <button type="submit" name="login" class="login-btn">
                        <span>Login</span>
                    </button>
                    
                    <p class="signup-link">
                        New to CertifyStack? 
                        <a href="userreg">Create account</a>
                    </p>
                </div>
            </form>
        </div>
    </main>
    
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