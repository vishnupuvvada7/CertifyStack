<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password | CertifyStack</title>
    <link type="text/css" rel="stylesheet" href="css/forgot.css">
</head>
<body>
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
                <h2>Reset Password</h2>
            </div>

            <form action="update-password" method="post">
            <input type="hidden" name="token" value="${token}">
                <div class="form-group">
                    <input type="password" name="password" required id="password">
                    <label for="password">New Password</label>
                </div>
                <div class="form-group">
                    <input type="password" name="confirmpassword" required id="password">
                    <label for="password">Confirm Password</label>
                </div>

                <div class="form-footer">
                    <button type="submit" name="reset" class="reset-btn">
                        <span>Reset Password</span>
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>