<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professional Certifications | CertifyStack</title>
    <link rel="stylesheet" href="css/certifications.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

        <div class="content-container">
            <div class="content-header">
                <h1>Professional <span class="gradient-text">Certifications</span></h1>
                <p class="subtitle">Explore certification paths to advance your career</p>
            </div>

            <div class="filter-container glass-card">
                <div class="search-section">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" id="searchInput" placeholder="Search certifications..." class="search-input">
                </div>
            </div>

            <div class="certifications-container">
                <c:forEach items="${certificationsByProvider}" var="providerEntry">
                    <div class="provider-section glass-card">
                        <div class="provider-header">
                            <h2 class="provider-title">
                                <span class="gradient-text">${providerEntry.key}</span>
                            </h2>
                        </div>
                        
                        <c:forEach items="${levels}" var="level">
                            <c:set var="hasCertsForLevel" value="false" />
                            <c:forEach items="${providerEntry.value}" var="cert">
                                <c:if test="${cert.level eq level}">
                                    <c:set var="hasCertsForLevel" value="true" />
                                </c:if>
                            </c:forEach>
                            
                            <c:if test="${hasCertsForLevel}">
                                <div class="level-section">
                                    <h3 class="level-title">${level} Level</h3>
                                    <div class="certifications-grid">
                                        <c:forEach items="${providerEntry.value}" var="cert">
                                            <c:if test="${cert.level eq level}">
                                                <div class="certification-card glass-card">
                                                    <div class="cert-header">
                                                        <h4 class="cert-title">${cert.name}</h4>
                                                    </div>
                                                    <div class="cert-content">
                                                        <p class="cert-description">${cert.description}</p>
                                                        <div class="cert-details">
                                                            <c:if test="${not empty cert.duration}">
                                                                <div class="detail-item">
                                                                    <i class="fas fa-clock"></i>
                                                                    <span>${cert.duration}</span>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${not empty cert.questions}">
                                                                <div class="detail-item">
                                                                    <i class="fas fa-question-circle"></i>
                                                                    <span>${cert.questions} Questions</span>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${not empty cert.cost}">
                                                                <div class="detail-item">
                                                                    <i class="fas fa-tag"></i>
                                                                    <span>$${cert.cost} USD</span>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${not empty cert.validity}">
                                                                <div class="detail-item">
                                                                    <i class="fas fa-calendar-check"></i>
                                                                    <span>${cert.validity} years validity</span>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="cert-footer">
                                                        <a href="${cert.link}" class="btn-learn-more" target="_blank">
                                                            <span>Learn More</span>
                                                            <i class="fas fa-arrow-right"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                const cards = document.querySelectorAll('.certification-card');
                const providerSections = document.querySelectorAll('.provider-section');
                let hasResults = false;
                
                cards.forEach(card => {
                    const text = card.textContent.toLowerCase();
                    const shouldShow = text.includes(searchTerm);
                    card.style.display = shouldShow ? 'flex' : 'none';
                    if (shouldShow) hasResults = true;
                });
                
                providerSections.forEach(section => {
                    const visibleCards = section.querySelectorAll('.certification-card[style="display: flex"]');
                    section.style.display = visibleCards.length > 0 ? 'block' : 'none';
                    
                    const levelSections = section.querySelectorAll('.level-section');
                    levelSections.forEach(levelSection => {
                        const hasVisibleCards = levelSection.querySelectorAll('.certification-card[style="display: flex"]').length > 0;
                        levelSection.style.display = hasVisibleCards ? 'block' : 'none';
                    });
                });

                const noResultsMsg = document.getElementById('noResultsMessage');
                if (!hasResults && searchTerm !== '') {
                    if (!noResultsMsg) {
                        const msg = document.createElement('div');
                        msg.id = 'noResultsMessage';
                        msg.className = 'no-results glass-card';
                        msg.innerHTML = `
                            <div class="no-results-content">
                                <i class="fas fa-search"></i>
                                <p>No certifications found matching your search.</p>
                            </div>
                        `;
                        document.querySelector('.certifications-container').appendChild(msg);
                    }
                } else if (noResultsMsg) {
                    noResultsMsg.remove();
                }
            });
        });
    </script>
</body>
</html>