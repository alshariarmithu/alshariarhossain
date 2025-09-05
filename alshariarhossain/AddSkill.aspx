<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSkill.aspx.cs" Inherits="alshariarhossain.AddSkill" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Skill - Portfolio Admin</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 100%;
            max-width: 600px;
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-title {
            font-size: 2rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
        }

        .form-subtitle {
            color: #64748b;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 0.5rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
        }

        .form-actions {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            margin-top: 2rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 50px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            font-size: 1rem;
        }

        .btn-primary {
            background: linear-gradient(45deg, #6366f1, #8b5cf6);
            color: white;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(45deg, #94a3b8, #64748b);
            color: white;
            box-shadow: 0 4px 15px rgba(100, 116, 139, 0.3);
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(100, 116, 139, 0.4);
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: #6366f1;
            text-decoration: none;
            font-weight: 500;
            margin-bottom: 1.5rem;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .form-container {
                padding: 1.5rem;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <a href="Dashboard.aspx" class="back-link">
                <i class="fas fa-arrow-left"></i>
                Back to Dashboard
            </a>
            
            <div class="form-header">
                <h1 class="form-title">Add New Skill</h1>
                <p class="form-subtitle">Add a new skill to showcase your expertise</p>
            </div>
            
            <div class="form-group">
                <label for="txtSkillName" class="form-label">Skill Name</label>
                <asp:TextBox ID="txtSkillName" runat="server" CssClass="form-control" placeholder="e.g., React.js, ASP.NET Core" required></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="ddlCategory" class="form-label">Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Frontend Development">Frontend Development</asp:ListItem>
                    <asp:ListItem Value="Backend Development">Backend Development</asp:ListItem>
                    <asp:ListItem Value="Database & Cloud">Database & Cloud</asp:ListItem>
                    <asp:ListItem Value="Development Tools">Development Tools</asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <div class="form-group">
                <label for="txtProficiency" class="form-label">Proficiency Level (0-100%)</label>
                <asp:TextBox ID="txtProficiency" runat="server" TextMode="Number" min="0" max="100" 
                    CssClass="form-control" placeholder="e.g., 85" required></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtIconClass" class="form-label">Icon Class (Font Awesome)</label>
                <asp:TextBox ID="txtIconClass" runat="server" CssClass="form-control" 
                    placeholder="fas fa-code (optional)"></asp:TextBox>
                <small style="color: #64748b; display: block; margin-top: 0.5rem;">
                    Example: fas fa-code, fas fa-server, fas fa-database, fas fa-tools
                </small>
            </div>
            
            <div class="form-actions">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save Skill" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            </div>
        </div>
    </form>
</body>
</html>