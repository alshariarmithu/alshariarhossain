<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="alshariarhossain.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Al Shariar Hossain</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #1e293b;
            --primary-dark: #334155;
            --secondary: #1e293b;
            --light: #f8fafc;
            --gray: #64748b;
            --gray-light: #e2e8f0;
            --danger: #ef4444;
            --success: #10b981;
            --border-radius: 12px;
            --shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: linear-gradient(135deg, #f0f4ff 0%, #f8fafc 100%);
            color: var(--secondary);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            line-height: 1.6;
        }

        .login-container {
            width: 100%;
            max-width: 520px;
            animation: fadeIn 0.5s ease-out;
        }

        .login-card {
            background: #ffffff;
            border-radius: var(--border-radius);
            padding: 3rem;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: linear-gradient(90deg, var(--primary), var(--primary-dark));
        }

        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .logo {
            width: 90px;
            height: 90px;
            margin: 0 auto 1rem;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid var(--gray-light);
        }

        .logo img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .login-header h1 {
            color: var(--secondary);
            font-size: 2rem;
            margin-bottom: 0.75rem;
            font-weight: 600;
            letter-spacing: -0.5px;
        }

        .login-header p {
            color: var(--gray);
            font-size: 1.05rem;
            max-width: 400px;
            margin: 0 auto;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 1.75rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.75rem;
            color: var(--secondary);
            font-weight: 500;
            font-size: 1rem;
        }

        .input-with-icon {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
            font-size: 1.1rem;
        }

        .form-control {
            width: 100%;
            padding: 16px 18px 16px 50px;
            border: 2px solid var(--gray-light);
            border-radius: var(--border-radius);
            font-size: 1.05rem;
            transition: var(--transition);
            background: #ffffff;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
        }

        .password-toggle {
            position: absolute;
            right: 18px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--gray);
            cursor: pointer;
            font-size: 1.1rem;
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            margin-top: 0.75rem;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(30, 41, 59, 0.25);
        }

            .btn-login:hover {
                background: var(--primary-dark);
                transform: translateY(-2px);
                box-shadow: 0 6px 18px rgba(30, 41, 59, 0.3);
            }

        .btn-login:active {
            transform: translateY(0);
        }

        .alert {
            padding: 16px 20px;
            border-radius: var(--border-radius);
            margin-bottom: 1.75rem;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            animation: slideIn 0.3s ease-out;
        }

        .alert i {
            margin-right: 12px;
            font-size: 1.2rem;
        }

        .alert-danger {
            background-color: #fef2f2;
            border: 2px solid #fecaca;
            color: var(--danger);
        }

        .alert-success {
            background-color: #f0fdf4;
            border: 2px solid #bbf7d0;
            color: var(--success);
        }

        .back-to-home {
            text-align: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid var(--gray-light);
        }

        .back-to-home a {
            color: var(--primary);
            text-decoration: none;
            font-size: 1rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            transition: var(--transition);
        }

        .back-to-home a i {
            margin-right: 10px;
            transition: var(--transition);
        }

        .back-to-home a:hover {
            color: var(--primary-dark);
        }

        .back-to-home a:hover i {
            transform: translateX(-4px);
        }

        .footer {
            text-align: center;
            margin-top: 2rem;
            color: var(--gray);
            font-size: 0.9rem;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @media (max-width: 576px) {
            .login-card {
                padding: 2.5rem 2rem;
            }
            
            .login-header h1 {
                font-size: 1.75rem;
            }
            
            .logo {
                width: 80px;
                height: 80px;
            }
            
            .logo i {
                font-size: 28px;
            }
            
            .form-control {
                padding: 14px 16px 14px 46px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-card">
                <div class="login-header">
                    <div class="logo">
                         <img src="images/profile.jpg" alt="Profile">
                    </div>
                    <h1>Admin Portal</h1>
                    <p>Sign in to access dashboard and manage portfolio</p>
                </div>

                <asp:Panel ID="AlertPanel" runat="server" Visible="false">
                    <div id="alertDiv" runat="server" class="alert">
                        <i class="fas fa-exclamation-circle"></i>
                        <asp:Label ID="AlertMessage" runat="server"></asp:Label>
                    </div>
                </asp:Panel>

                <div class="form-group">
                    <label for="txtUsername">Email Address</label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope input-icon"></i>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter email address" required TextMode="Email"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtPassword">Password</label>
                    <div class="input-with-icon">
                        <i class="fas fa-key input-icon"></i>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password" required></asp:TextBox>
                        <button type="button" class="password-toggle" id="passwordToggle">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <asp:Button ID="btnLogin" runat="server" CssClass="btn-login" Text="Sign In" OnClick="BtnLogin_Click" />

                <div class="back-to-home">
                    <a href="Home.aspx"><i class="fas fa-arrow-left"></i> Back to Portfolio</a>
                </div>
            </div>
            
            <div class="footer">
                &copy; <%= DateTime.Now.Year %> Al Shariar Hossain. All rights reserved.
            </div>
        </div>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const passwordToggle = document.getElementById('passwordToggle');
            const passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            
            if (passwordToggle && passwordField) {
                passwordToggle.addEventListener('click', function() {
                    const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordField.setAttribute('type', type);
                    
                    const eyeIcon = this.querySelector('i');
                    eyeIcon.classList.toggle('fa-eye');
                    eyeIcon.classList.toggle('fa-eye-slash');
                });
            }
            
            const loginBtn = document.getElementById('<%= btnLogin.ClientID %>');
            if (loginBtn) {
                loginBtn.addEventListener('mouseenter', function () {
                    this.style.transform = 'translateY(-2px)';
                });

                loginBtn.addEventListener('mouseleave', function () {
                    this.style.transform = 'translateY(0)';
                });
            }
        });
    </script>
</body>
</html>