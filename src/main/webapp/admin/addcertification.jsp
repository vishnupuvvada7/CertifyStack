<%@page import="com.klef.jfsd.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Admin a = (Admin)session.getAttribute("admin");
if(a==null){
    response.sendRedirect("sessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Certification - CertifyStack</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/addcertification.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
    <jsp:include page="sidebar.jsp" />
    <main class="main-content">
        <div class="page-header">
            <div class="header-content">
                <h1>Add New Certification</h1>
                <p>Create a new certification for the platform</p>
            </div>
        </div>
        
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/insertcert" method="POST" class="certification-form">
                <div class="form-section">
                    <h2>Basic Information</h2>
                    <div class="form-group">
                        <label for="certName">
                            <span class="material-symbols-outlined">verified</span>
                            Certification Name
                        </label>
                        <input type="text" id="certName" name="certName" required placeholder="Enter certification name">
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="provider">
                                <span class="material-symbols-outlined">business</span>
                                Provider
                            </label>
                            <input type="text" id="provider" name="provider" required placeholder="Certification provider">
                        </div>
                        <div class="form-group">
                            <label for="level">
                                <span class="material-symbols-outlined">signal_cellular_alt</span>
                                Level
                            </label>
                            <select id="level" name="level" required>
                                <option value="">Select Level</option>
                                <option value="beginner">Beginner</option>
                                <option value="intermediate">Intermediate</option>
                                <option value="advanced">Advanced</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2>Exam Details</h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="duration">
                                <span class="material-symbols-outlined">timer</span>
                                Duration (Minutes)
                            </label>
                            <input type="number" id="duration" name="duration" required placeholder="Exam duration">
                        </div>
                        <div class="form-group">
                            <label for="questions">
                                <span class="material-symbols-outlined">quiz</span>
                                Questions
                            </label>
                            <input type="number" id="questions" name="questions" required placeholder="Number of questions">
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h2>Additional Information</h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="cost">
                                <span class="material-symbols-outlined">payments</span>
                                Cost ($)
                            </label>
                            <input type="number" id="cost" name="cost" step="0.01" required placeholder="Certification cost">
                        </div>
                        <div class="form-group">
                            <label for="validity">
                                <span class="material-symbols-outlined">event</span>
                                Validity (Years)
                            </label>
                            <input type="number" id="validity" name="validity" required placeholder="Validity period">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="link">
                            <span class="material-symbols-outlined">link</span>
                            Learn More Link
                        </label>
                        <input type="url" id="link" name="link" required placeholder="https://example.com/certification">
                    </div>
                    
                    <div class="form-group">
                        <label for="description">
                            <span class="material-symbols-outlined">description</span>
                            Description
                        </label>
                        <textarea id="description" name="description" rows="4" required placeholder="Detailed description of the certification"></textarea>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="reset" class="reset-btn">
                        <span class="material-symbols-outlined">refresh</span>
                        Reset
                    </button>
                    <button type="submit" class="submit-btn">
                        <span class="material-symbols-outlined">add_circle</span>
                        Add Certification
                    </button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>