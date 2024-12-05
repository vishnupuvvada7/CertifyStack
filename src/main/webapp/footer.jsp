<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-brand">
                <a href="/" class="footer-logo">
                    <span class="gradient-text">CertifyStack</span>
                </a>
                <p class="footer-description">
                    Track, manage, and verify your professional certifications with ease.
                </p>
            </div>
            <div class="footer-links">
                <div class="footer-section">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="/about">About</a></li>
                        <li><a href="/contact">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>Legal</h3>
                    <ul>
                        <li><a href="/privacy">Privacy Policy</a></li>
                        <li><a href="/terms">Terms of Service</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 CertifyStack. All rights reserved.</p>
        </div>
    </div>
</footer>

<style>
.footer {
    background: rgba(15, 23, 42, 0.95);
    backdrop-filter: blur(10px);
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    padding: 4rem 0 2rem;
    margin-top: 4rem;
    position: relative;
    z-index: 1;
}

.footer-content {
    display: grid;
    grid-template-columns: 1.5fr 1fr;
    gap: 4rem;
    margin-bottom: 2rem;
}

.footer-brand {
    max-width: 300px;
}

.footer-logo {
    display: inline-block;
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 1rem;
    text-decoration: none;
}

.footer-description {
    color: #94a3b8;
    line-height: 1.6;
}

.footer-links {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 2rem;
}

.footer-section h3 {
    color: #fff;
    font-size: 1.125rem;
    margin-bottom: 1rem;
}

.footer-section ul {
    list-style: none;
}

.footer-section ul li {
    margin-bottom: 0.5rem;
}

.footer-section ul li a {
    color: #94a3b8;
    text-decoration: none;
    transition: color 0.3s ease;
}

.footer-section ul li a:hover {
    color: #3b82f6;
}

.footer-bottom {
    padding-top: 2rem;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    text-align: center;
    color: #94a3b8;
}

@media (max-width: 768px) {
    .footer-content {
        grid-template-columns: 1fr;
        gap: 2rem;
    }

    .footer-brand {
        max-width: 100%;
        text-align: center;
    }
}
</style>