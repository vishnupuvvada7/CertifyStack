<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | CertifyStack</title>
    <link type="text/css" rel="stylesheet" href="css/login.css">
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

        <h4 class="error-message"><c:out value="${fmessage}"></c:out></h4>
        
        <% 
            HttpSession s = request.getSession(false);
            if (s != null && "user".equals(s.getAttribute("user"))) { 
        %>
            <div class="toast" id="toast">
                <div class="toast-content">
                    <div class="check">✓</div>
                    <div class="message">Registered Successfully</div>
                </div>
            </div>
            <script>
                document.getElementById("toast").classList.add("show");
                setTimeout(() => {
                    document.getElementById("toast").classList.remove("show");
                }, 4000);
                <% session.removeAttribute("user"); %>
            </script>
        <% 
            } 
        %>

        <div class="login-container">
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
    
    
</body>
</html>