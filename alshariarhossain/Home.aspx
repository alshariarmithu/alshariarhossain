<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="alshariarhossain.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Portfolio of Al Shariar Hossain">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Home Section -->
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
    <section id="About" class="section">
        <div class="container">
            <h2>About Me</h2>
            <p>
                I am a passionate software developer with expertise in modern web technologies. 
                I love creating innovative solutions and building applications that make a difference.
            </p>
        </div>
    </section>

    <!-- Education Section -->
    <section id="Education" class="section bg-white">
        <div class="container">
            <h2>Education</h2>
            <div class="education-card">
                <h3>Bachelor of Science</h3>
                <p>Computer Science & Engineering</p>
                <p class="university">University Name • Year</p>
            </div>
        </div>
    </section>

    <!-- Skills Section -->
    <section id="Skills" class="section">
        <div class="container">
            <h2>Skills</h2>
            <div class="skills-grid">
                <div class="skill-card">
                    <h3>Frontend</h3>
                    <p>React, Next.js, TypeScript, HTML, CSS</p>
                </div>
                <div class="skill-card">
                    <h3>Backend</h3>
                    <p>ASP.NET, C#, Node.js, SQL Server</p>
                </div>
                <div class="skill-card">
                    <h3>Tools</h3>
                    <p>Git, Visual Studio, VS Code</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Projects Section -->
    <section id="Projects" class="section bg-white">
        <div class="container">
            <h2>Projects</h2>
            <div class="projects-grid">
                <div class="project-card">
                    <h3>Portfolio Website</h3>
                    <p>A responsive portfolio website built with ASP.NET and modern web technologies.</p>
                    <div class="tech-tags">
                        <span>ASP.NET</span>
                        <span>CSS</span>
                        <span>JavaScript</span>
                    </div>
                </div>
                <div class="project-card">
                    <h3>Web Application</h3>
                    <p>A full-stack web application with modern features and responsive design.</p>
                    <div class="tech-tags">
                        <span>C#</span>
                        <span>SQL Server</span>
                        <span>Bootstrap</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="Contact" class="contact-section">
        <div class="container">
            <h2>Get In Touch</h2>
            <p>
                I'm always interested in hearing about new opportunities and projects.
            </p>
            <div class="contact-buttons">
                <a href="mailto:your.email@example.com" class="contact-button">
                    Email Me
                </a>
                <a href="https://linkedin.com/in/yourprofile" class="contact-button">
                    LinkedIn
                </a>
            </div>
        </div>
    </section>

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
    </script>

</asp:Content>