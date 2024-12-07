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

            <form method="post" action="insertuser" novalidate>
                <div class="form-group">
                    <input type="text" name="name" required id="name" class="input-field">
                    <label for="name">Full Name</label>
                    <span class="error-message">Please enter your full name</span>
                </div>

                <div class="form-group select-group">
                    <select name="gender" required id="gender" class="input-field">
                        <option value="" disabled selected></option>
                        <option value="MALE">Male</option>
                        <option value="FEMALE">Female</option>
                        <option value="OTHER">Other</option>
                        <option value="NA">Rather not say</option>
                    </select>
                    <label for="gender">Gender</label>
                    <span class="error-message">Please select your gender</span>
                </div>

                <div class="date-group">
                    <div class="form-group select-group">
                        <select name="month" required id="month" class="input-field">
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
                        <span class="error-message">Required</span>
                    </div>

                    <div class="form-group">
                        <input type="number" name="day" required id="day" min="1" max="31" class="input-field">
                        <label for="day">Day</label>
                        <span class="error-message">Invalid day</span>
                    </div>

                    <div class="form-group">
                        <input type="number" name="year" required id="year" min="1900" max="2024" class="input-field">
                        <label for="year">Year</label>
                        <span class="error-message">Invalid year</span>
                    </div>
                </div>

                <div class="form-group">
                    <input type="text" name="username" required id="username" class="input-field">
                    <label for="username">Username</label>
                    <span class="error-message">Please enter a username</span>
                </div>

                <div class="form-group">
                    <input type="email" name="email" pattern="[a-zA-Z0-9._%+-]+@gmail\.com$" 
                           required id="email" class="input-field">
                    <label for="email">Gmail Address</label>
                    <span class="error-message">Please enter a valid Gmail address</span>
                </div>

                <div class="form-group">
                    <input type="password" name="password" required id="password" class="input-field"
                           title="Password must meet all requirements below">
                    <label for="password">Password</label>
                    <span class="error-message">Please enter a valid password</span>
                </div>

                <ul class="password-checklist">
                    <li id="length" class="requirement">At least 8 characters</li>
                    <li id="uppercase" class="requirement">At least one uppercase letter</li>
                    <li id="lowercase" class="requirement">At least one lowercase letter</li>
                    <li id="number" class="requirement">At least one number</li>
                    <li id="specialChar" class="requirement">At least one special character</li>
                </ul>

                <div class="form-group">
                    <input type="tel" name="contact" pattern="[6-9][0-9]{9}" 
                           required id="contact" class="input-field">
                    <label for="contact">Contact Number</label>
                    <span class="error-message">Please enter a valid 10-digit phone number</span>
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
    
    <script>
        document.getElementById("password").addEventListener("input", function() {
            const password = this.value;
            const validations = {
                length: password.length >= 8,
                uppercase: /[A-Z]/.test(password),
                lowercase: /[a-z]/.test(password),
                number: /[0-9]/.test(password),
                specialChar: /[!@#$%^&*()_\-+=<>?{}[\]~.,:;'"|\\]/.test(password)
            };

            for (const [key, isValid] of Object.entries(validations)) {
                const element = document.getElementById(key);
                element.className = isValid ? 'requirement valid' : 'requirement invalid';
            }
        });

        // Add validation styling for all input fields
        document.querySelectorAll('.input-field').forEach(input => {
            input.addEventListener('focus', function() {
                this.classList.add('field-focus');
            });

            input.addEventListener('blur', function() {
                this.classList.remove('field-focus');
                if (!this.checkValidity()) {
                    this.classList.add('field-invalid');
                } else {
                    this.classList.remove('field-invalid');
                }
            });
        });
    </script>
</body>
</html>