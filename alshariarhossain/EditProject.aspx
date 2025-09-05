<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProject.aspx.cs" Inherits="alshariarhossain.EditProject" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Project - Portfolio Admin</title>
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
            max-width: 800px;
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

        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }

        .form-row {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .form-col {
            flex: 1;
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

        .help-text {
            color: #64748b;
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: block;
        }

        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .form-container {
                padding: 1.5rem;
            }
            
            .form-row {
                flex-direction: column;
                gap: 1.5rem;
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
                <h1 class="form-title">Edit Project</h1>
                <p class="form-subtitle">Update your project information</p>
            </div>
            
            <div class="form-group">
                <label for="txtProjectName" class="form-label">Project Name</label>
                <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control" 
                    placeholder="e.g., Portfolio Website, E-commerce Platform" required></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtDescription" class="form-label">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control" 
                    placeholder="Describe your project, its features, and purpose..." required></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtTechnologies" class="form-label">Technologies Used</label>
                <asp:TextBox ID="txtTechnologies" runat="server" CssClass="form-control" 
                    placeholder="e.g., ASP.NET, CSS, JavaScript, SQL Server (comma separated)" required></asp:TextBox>
                <span class="help-text">Separate technologies with commas</span>
            </div>
            
            <div class="form-row">
                <div class="form-col">
                    <div class="form-group">
                        <label for="txtStartDate" class="form-label">Start Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-col">
                    <div class="form-group">
                        <label for="txtEndDate" class="form-label">End Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <span class="help-text">Leave empty if project is ongoing</span>
                    </div>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-col">
                    <div class="form-group">
                        <label for="txtProjectUrl" class="form-label">Project URL</label>
                        <asp:TextBox ID="txtProjectUrl" runat="server" TextMode="Url" CssClass="form-control" 
                            placeholder="https://yourproject.com"></asp:TextBox>
                    </div>
                </div>
                <div class="form-col">
                    <div class="form-group">
                        <label for="txtGithubUrl" class="form-label">GitHub URL</label>
                        <asp:TextBox ID="txtGithubUrl" runat="server" TextMode="Url" CssClass="form-control" 
                            placeholder="https://github.com/yourusername/project"></asp:TextBox>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="txtImageUrl" class="form-label">Image URL</label>
                <asp:TextBox ID="txtImageUrl" runat="server" TextMode="Url" CssClass="form-control" 
                    placeholder="https://example.com/project-image.jpg"></asp:TextBox>
                <span class="help-text">URL to a project screenshot or thumbnail</span>
            </div>
            
            <div class="form-actions">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Update Project" CssClass="btn btn-primary" OnClick="btnSave_Click" />
            </div>
        </div>
    </form>
</body>
</html>