<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration | CertifyStack</title>
    <link type="text/css" rel="stylesheet" href="css/registration.css">
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

        <div class="registration-container">
            <div class="form-header">
                <h2>Create Account</h2>
                <p class="subtitle">Fill in your details to get started</p>
            </div>

            <form method="post" action="insertuser">
                <div class="form-group">
                    <input type="text" name="name" required id="name">
                    <label for="name">Full Name</label>
                </div>

                <div class="form-group select-group">
                    <select name="gender" required id="gender">
                        <option value="" disabled selected></option>
                        <option value="MALE">Male</option>
                        <option value="FEMALE">Female</option>
                        <option value="OTHER">Other</option>
                        <option value="NA">Rather not say</option>
                    </select>
                    <label for="gender">Gender</label>
                </div>

                <div class="date-group">
                    <div class="form-group select-group">
                        <select name="month" required id="month">
                            <option value="" disabled selected></option>
                            <option value="1">January</option>
                            <option value="2">February</option>
                            <option value="3">March</option>
                            <option value="4">April</option>
                            <option value="5">May</option>
                            <option value="6">June</option>
                            <option value="7">July</option>
                            <option value="8">August</option>
                            <option value="9">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>
                        <label for="month">Month</label>
                    </div>

                    <div class="form-group">
                        <input type="number" name="day" required id="day" min="1" max="31">
                        <label for="day">Day</label>
                    </div>

                    <div class="form-group">
                        <input type="number" name="year" required id="year" min="1900" max="2024">
                        <label for="year">Year</label>
                    </div>
                </div>

                <div class="form-group">
                    <input type="text" name="username" required id="username">
                    <label for="username">Username</label>
                </div>

                <div class="form-group">
                    <input type="email" name="email" pattern="[a-zA-Z0-9._%+-]+@gmail\.com$" 
                           title="Please enter a valid Gmail address (e.g., username@gmail.com)" required id="email">
                    <label for="email">Gmail Address</label>
                </div>

                <div class="form-group">
                    <input type="password" name="password" required id="password">
                    <label for="password">Password</label>
                </div>

                <div class="form-group">
                    <input type="tel" name="contact" pattern="[6789][0-9]{9}" 
                           title="Please enter valid phone number" required id="contact">
                    <label for="contact">Contact Number</label>
                </div>

                <div class="form-footer">
                    <button type="submit" name="sign-up" class="register-btn">
                        <span>Create Account</span>
                    </button>

                    <p class="login-link">
                        Already have an account? 
                        <a href="login">Login</a>
                    </p>
                </div>
            </form>
        </div>
    </main>
</body>
</html>