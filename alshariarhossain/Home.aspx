<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="alshariarhossain.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Portfolio of Al Shariar Hossain">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="Home" class="hero-section">
        <div class="hero-content">
            <div class="text-center">
                <img class="profile-image" src="/Images/profile.jpg" alt="Al Shariar Hossain">
                
                <h4 class="intro-text">Hello, I'm</h4>
                <h1 class="name-heading">Al Shariar Hossain</h1>
                <h2 class="subheading">CSE Undergrad @KUET</h2>
                
                <p class="description">
                    I'm passionate about Machine Learning, and currently diving into the
                    world of Web and Mobile App Development. I love learning new
                    technologies and building things that solve real-world problems.
                </p>
                
                <div class="button-container">
                    <a href="#" class="primary-button">
                        Download CV
                    </a>
                    <a href="#Contact" class="secondary-button">
                        Get In Touch
                    </a>
                </div>
                
                <div class="social-container">
                    <div class="social-grid">
                        <div class="social-card" onclick="window.open('https://github.com/alshariarmithu', '_blank')">
                            <div class="flex flex-col items-center">
                                <i class="social-icon fab fa-github"></i>
                                <span class="social-platform">GitHub</span>
                                <span class="social-handle">@alshariarmithu</span>
                            </div>
                        </div>
                        
                        <div class="social-card" onclick="window.open('https://www.linkedin.com/in/alshariar-hossain/', '_blank')">
                            <div class="flex flex-col items-center">
                                <i class="social-icon fab fa-linkedin"></i>
                                <span class="social-platform">LinkedIn</span>
                                <span class="social-handle">alshariar.hossain</span>
                            </div>
                        </div>
                        
                        <div class="social-card" onclick="window.location.href='mailto:alshariarhossain@gmail.com'">
                            <div class="flex flex-col items-center">
                                <i class="social-icon fas fa-envelope"></i>
                                <span class="social-platform">Email</span>
                                <span class="social-handle">alshariarhossain@gmail.com</span>
                            </div>
                        </div>
                        
                        <div class="social-card" onclick="window.open('https://facebook.com/alshariar.hossain.mithu', '_blank')">
                            <div class="flex flex-col items-center">
                                <i class="social-icon fab fa-facebook"></i>
                                <span class="social-platform">Facebook</span>
                                <span class="social-handle">alshariar.hossain.mithu</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        function scrollToSection(sectionId) {
            document.getElementById(sectionId).scrollIntoView({
                behavior: 'smooth'
            });
        }
    </script>

    <!-- About Section -->
    <section id="About" class="about-section">
    <div class="about-container">
        <!-- Heading -->
        <div class="about-heading">
            <h2>About Me</h2>
            <div class="heading-underline"></div>
        </div>

        <!-- Grid Layout -->
        <div class="about-grid">
            <!-- Left: Image -->
            <div class="about-image-container">
                <div class="about-image-wrapper">
                    <img src="/Images/img1.jpg" alt="Al Shariar Hossain" />
                </div>
            </div>

            <!-- Right: Text -->
            <div class="about-text">
                <h3>Al Shariar Hossain</h3>
                <p>
                    Computer Science and Engineering undergraduate at
                    <span>Khulna University of Engineering & Technology (KUET)</span>, 
                    currently in my 3rd year with a strong academic foundation.
                </p>

                <p>
                    Passionate about <span>Machine Learning and Artificial Intelligence</span>, 
                    exploring how algorithms can learn patterns and make intelligent decisions. 
                    I'm also developing expertise in web and mobile application development.
                </p>

                <p>
                    I believe in continuous learning and contributing meaningfully 
                    to the tech community through innovative projects and research 
                    that create positive societal impact.
                </p>
            </div>
        </div>
    </div>
</section>


    <!-- Education Section -->
    <section id="Education" class="section">
        <div class="container">
            <div class="section-header">
                <h2>Education Timeline</h2>
                <p>My academic journey and educational milestones</p>
            </div>
            
            <div class="timeline-container">
                <div class="timeline-line"></div>
                
                <div class="education-card">
                    <div class="timeline-dot current">
                        <div class="dot-inner"></div>
                    </div>
                    <div class="card-content">
                        <div class="status-badge current">Currently in 3rd Year</div>
                        <h3>Bachelor of Science in Computer Science & Engineering</h3>
                        <p class="university">Khulna University of Engineering & Technology (KUET)</p>
                        <div class="grade-info">
                            <div class="grade-label">
                                <svg class="award-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="8" r="7"/>
                                    <polyline points="8.21,13.89 7,23 12,20 17,23 15.79,13.88"/>
                                </svg>
                                <span>CGPA</span>
                            </div>
                            <span class="grade-value">3.84</span>
                        </div>
                    </div>
                    <div class="duration-badge">
                        <span>2022 - Present</span>
                    </div>
                </div>

                <div class="education-card">
                    <div class="timeline-dot">
                        <div class="dot-inner"></div>
                    </div>
                    <div class="card-content">
                        <h3>Higher Secondary Certificate (HSC)</h3>
                        <p class="university">Islamabad Collegiate School Khulna</p>
                        <div class="grade-info">
                            <div class="grade-label">
                                <svg class="award-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="8" r="7"/>
                                    <polyline points="8.21,13.89 7,23 12,20 17,23 15.79,13.88"/>
                                </svg>
                                <span>GPA</span>
                            </div>
                            <span class="grade-value">5.00</span>
                        </div>
                    </div>
                    <div class="duration-badge">
                        <span>2019 - 2021</span>
                    </div>
                </div>

                <div class="education-card">
                    <div class="timeline-dot">
                        <div class="dot-inner"></div>
                    </div>
                    <div class="card-content">
                        <h3>Secondary School Certificate (SSC)</h3>
                        <p class="university">Islamabad Collegiate School Khulna</p>
                        <div class="grade-info">
                            <div class="grade-label">
                                <svg class="award-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <circle cx="12" cy="8" r="7"/>
                                    <polyline points="8.21,13.89 7,23 12,20 17,23 15.79,13.88"/>
                                </svg>
                                <span>GPA</span>
                            </div>
                            <span class="grade-value">5.00</span>
                        </div>
                    </div>
                    <div class="duration-badge">
                        <span>2017 - 2019</span>
                    </div>
                </div>
            </div>
        </div>
    </section>


     <section id="Skills" class="skills-section">
            <div class="skills-container">
                <div class="section-header">
                    <h2 class="section-title">Professional Skills</h2>
                    <p class="section-subtitle">Technologies and tools I work with</p>
                </div>
                
                <div id="skillsGrid" runat="server" class="skills-grid">
                    <!-- Skills will be dynamically loaded here -->
                </div>
                
                <div class="skills-stats">
                    <div class="stat-item">
                        <div class="stat-number">5+</div>
                        <div class="stat-label">Years Experience</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">50+</div>
                        <div class="stat-label">Projects Completed</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">15+</div>
                        <div class="stat-label">Technologies</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">100%</div>
                        <div class="stat-label">Client Satisfaction</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Projects Section -->
        <section id="Projects" class="section bg-white">
            <div class="container">
                <h2>Projects</h2>
                <div id="projectsGrid" runat="server" class="projects-grid">
                    <!-- Projects will be dynamically loaded here -->
                </div>
            </div>
        </section>

    <!-- Contact Section -->
    <section id="Contact" class="contact-section">
        <div class="contact-container">
            <!-- Heading -->
            <div class="contact-heading">
                <h2>Get In Touch</h2>
                <div class="heading-underline"></div>
                <p>
                    Let's discuss your project or explore potential collaboration opportunities
                </p>
            </div>

            <div class="contact-content">
                <!-- Contact Information -->
                <div class="contact-info">
                    <div class="info-text">
                        <h3>Contact Information</h3>
                        <p>
                            I'm always interested in new opportunities and exciting projects. 
                            Whether you have a question or just want to say hello, feel free to reach out.
                        </p>
                    </div>

                    <div class="contact-details">
                        <div class="contact-item">
                            <div class="contact-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="contact-text">
                                <p class="contact-label">Email</p>
                                <a href="mailto:alshariarhossain@gmail.com" class="contact-value">
                                    alshariarhossain@gmail.com
                                </a>
                            </div>
                        </div>

                        <div class="contact-item">
                            <div class="contact-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="contact-text">
                                <p class="contact-label">Location</p>
                                <p class="contact-value">Khulna, Bangladesh</p>
                            </div>
                        </div>
                    </div>

                    <div class="social-section">
                        <h4>Connect With Me</h4>
                        <div class="social-links">
                            <a href="https://www.linkedin.com/in/alshariar-hossain/" target="_blank" rel="noopener noreferrer" class="social-link linkedin" aria-label="LinkedIn">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a href="https://github.com/alshariarmithu" target="_blank" rel="noopener noreferrer" class="social-link github" aria-label="GitHub">
                                <i class="fab fa-github"></i>
                            </a>
                            <a href="https://www.facebook.com/alshariar.hossain.mithu" target="_blank" rel="noopener noreferrer" class="social-link facebook" aria-label="Facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Contact Form -->
                <div class="contact-form-container">
                    <h3>Send a Message</h3>

                    <!-- Success Message -->
                    <div class="success-message" id="successMessage">
                        <div class="success-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h4>Message Sent Successfully!</h4>
                        <p>Thank you for reaching out. I'll get back to you soon.</p>
                    </div>

                    <!-- Contact Form -->
                    <form class="contact-form" id="contactForm">
                        <div class="error-message" id="errorMessage"></div>

                        <div class="form-group">
                            <label for="name">Full Name *</label>
                            <div class="input-container">
                                <i class="fas fa-user input-icon"></i>
                                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address *</label>
                            <div class="input-container">
                                <i class="fas fa-envelope input-icon"></i>
                                <input type="email" id="email" name="email" placeholder="Enter your email address" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="subject">Subject *</label>
                            <input type="text" id="subject" name="subject" placeholder="What's this about?" required>
                        </div>

                        <div class="form-group">
                            <label for="message">Message *</label>
                            <div class="textarea-container">
                                <i class="fas fa-comment-dots textarea-icon"></i>
                                <textarea id="message" name="message" rows="5" placeholder="Tell me about your project or inquiry..." required></textarea>
                            </div>
                        </div>

                        <button type="submit" class="submit-btn" id="submitBtn">
                            <i class="fas fa-paper-plane"></i>
                            <span>Send Message</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <script>
        document.getElementById('contactForm').addEventListener('submit', async function (e) {
            e.preventDefault();

            const form = e.target;
            const submitBtn = document.getElementById('submitBtn');
            const errorMessage = document.getElementById('errorMessage');
            const successMessage = document.getElementById('successMessage');
            const formContainer = document.querySelector('.contact-form');

            // Get form data
            const formData = {
                name: form.name.value.trim(),
                email: form.email.value.trim(),
                subject: form.subject.value.trim(),
                message: form.message.value.trim()
            };

            // Clear previous errors
            errorMessage.textContent = '';
            errorMessage.style.display = 'none';

            // Validation
            if (!formData.name) {
                showError('Please enter your name');
                return;
            }
            if (!formData.email) {
                showError('Please enter your email');
                return;
            }
            if (!formData.subject) {
                showError('Please enter a subject');
                return;
            }
            if (!formData.message) {
                showError('Please enter a message');
                return;
            }

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(formData.email)) {
                showError('Please enter a valid email address');
                return;
            }

            // Show loading state
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<div class="loading-spinner"></div>Sending...';

            try {
                const response = await fetch('https://formspree.io/f/xjkoplkl', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(formData)
                });

                if (response.ok) {
                    // Show success message
                    formContainer.style.display = 'none';
                    successMessage.style.display = 'block';
                    form.reset();

                    // Hide success message after 5 seconds
                    setTimeout(() => {
                        successMessage.style.display = 'none';
                        formContainer.style.display = 'block';
                    }, 5000);
                } else {
                    throw new Error('Failed to send message');
                }
            } catch (error) {
                showError('Failed to send message. Please check your internet connection and try again.');
            } finally {
                // Reset button state
                submitBtn.disabled = false;
                submitBtn.innerHTML = '<i class="fas fa-paper-plane"></i><span>Send Message</span>';
            }

            function showError(message) {
                errorMessage.textContent = message;
                errorMessage.style.display = 'block';
            }
        });
    </script>


    <script>
        // Additional functionality for smooth hover effects
        document.addEventListener('DOMContentLoaded', function () {
            // Add hover effects to buttons
            const buttons = document.querySelectorAll('button, a');
            buttons.forEach(button => {
                if (button.classList.contains('contact-button')) {
                    button.addEventListener('mouseenter', function () {
                        this.style.background = 'rgba(255,255,255,0.3)';
                    });
                    button.addEventListener('mouseleave', function () {
                        this.style.background = 'rgba(255,255,255,0.2)';
                    });
                }
            });

            // Add smooth hover effect to main CTA button
            const ctaButton = document.querySelector('.cta-button');
            if (ctaButton) {
                ctaButton.addEventListener('mouseenter', function () {
                    this.style.transform = 'scale(1.05)';
                });
                ctaButton.addEventListener('mouseleave', function () {
                    this.style.transform = 'scale(1)';
                });
            }
        });

        document.addEventListener('DOMContentLoaded', function () {
            const progressBars = document.querySelectorAll('.progress-bar');

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const width = entry.target.getAttribute('data-width');
                        entry.target.style.width = width;
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.1 });

            progressBars.forEach(bar => {
                observer.observe(bar);
            });
        });
    </script>

</asp:Content>