<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password | CertifyStack</title>
    <link type="text/css" rel="stylesheet" href="css/forgot.css">
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

        <div class="forgot-container">
            <div class="form-header">
                <h2>Forgot Password</h2>
                <p class="subtitle">Enter your email address to reset your password</p>
            </div>

            <form action="#" method="post">
                <div class="form-group">
                    <input type="email" name="email" required id="email">
                    <label for="email">Email Address</label>
                </div>

                <div class="form-footer">
                    <button type="submit" name="reset" class="reset-btn">
                        <span>Reset Password</span>
                    </button>

                    <p class="login-link">
                        Remember your password? 
                        <a href="login">Back to Login</a>
                    </p>
                </div>
            </form>
        </div>
    </main>
</body>
</html>