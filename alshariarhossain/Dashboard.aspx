<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="alshariarhossain.Dashboard" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio Admin Dashboard</title>
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
        }

        .dashboard-header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-content {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome-text {
            font-size: 1.5rem;
            font-weight: 600;
            color: #1e293b;
        }

        .user-email {
            color: #6366f1;
            font-weight: 500;
        }

        .logout-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            background: linear-gradient(45deg, #ef4444, #dc2626);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.3);
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(239, 68, 68, 0.4);
        }

        .main-container {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .section-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #f1f5f9;
        }

        .section-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: #1e293b;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .section-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(45deg, #6366f1, #8b5cf6);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
        }

        .add-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.25rem;
            background: linear-gradient(45deg, #10b981, #059669);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        }

        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(16, 185, 129, 0.4);
        }

        .item-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .item-card {
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            border: 1px solid #e2e8f0;
            border-radius: 15px;
            padding: 1.5rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .item-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #6366f1, #8b5cf6);
        }

        .item-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            border-color: #6366f1;
        }

        .item-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 0.75rem;
        }

        .item-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 0.25rem;
        }

        .item-meta {
            font-size: 0.875rem;
            color: #64748b;
        }

        .item-description {
            color: #475569;
            line-height: 1.6;
            margin-bottom: 1rem;
        }

        .item-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .tag {
            background: linear-gradient(45deg, #6366f1, #8b5cf6);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .skill-level {
            background: linear-gradient(90deg, #e5e7eb, #e5e7eb);
            height: 8px;
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 1rem;
        }

        .skill-progress {
            height: 100%;
            background: linear-gradient(90deg, #10b981, #059669);
            border-radius: 4px;
            transition: width 0.5s ease;
        }

        .item-actions {
            display: flex;
            gap: 0.75rem;
        }

        .action-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 25px;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .edit-btn {
            background: linear-gradient(45deg, #3b82f6, #2563eb);
            color: white;
            box-shadow: 0 2px 10px rgba(59, 130, 246, 0.3);
        }

        .edit-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
        }

        .delete-btn {
            background: linear-gradient(45deg, #ef4444, #dc2626);
            color: white;
            box-shadow: 0 2px 10px rgba(239, 68, 68, 0.3);
        }

        .delete-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.4);
        }

        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
            color: #64748b;
        }

        .empty-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #cbd5e1;
        }

        .empty-text {
            font-size: 1.125rem;
            margin-bottom: 0.5rem;
        }

        .empty-subtext {
            font-size: 0.875rem;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: #6366f1;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #64748b;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
            
            .header-content {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
            
            .main-container {
                padding: 0 1rem;
            }
            
            .item-actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-header">
            <div class="header-content">
                <div class="welcome-text">
                    Welcome back, <span class="user-email"><asp:Label ID="lblEmail" runat="server"></asp:Label></span>!
                </div>
                <a class="logout-btn" href="Logout.aspx">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </a>
            </div>
        </div>

        <div class="main-container">
            <!-- Statistics Overview -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-number"><asp:Label ID="lblSkillsCount" runat="server" Text="0"></asp:Label></div>
                    <div class="stat-label">Total Skills</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number"><asp:Label ID="lblProjectsCount" runat="server" Text="0"></asp:Label></div>
                    <div class="stat-label">Total Projects</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number"><asp:Label ID="lblLastUpdate" runat="server" Text="Never"></asp:Label></div>
                    <div class="stat-label">Last Updated</div>
                </div>
            </div>

            <div class="dashboard-grid">
                <!-- Skills Management Section -->
                <div class="section-card">
                    <div class="section-header">
                        <h2 class="section-title">
                            <div class="section-icon">
                                <i class="fas fa-cogs"></i>
                            </div>
                            Skills Management
                        </h2>
                        <a href="AddSkill.aspx" class="add-btn">
                            <i class="fas fa-plus"></i>
                            Add Skill
                        </a>
                    </div>
                    
                    <div class="item-list">
                        <asp:Repeater ID="rptSkills" runat="server" OnItemCommand="rptSkills_ItemCommand">
                            <ItemTemplate>
                                <div class="item-card">
                                    <div class="item-header">
                                        <div>
                                            <div class="item-title"><%# Eval("SkillName") %></div>
                                            <div class="item-meta">Category: <%# Eval("Category") %></div>
                                        </div>
                                    </div>
                                    
                                    <div class="skill-level">
                                        <div class="skill-progress" style="width: <%# Eval("ProficiencyLevel") %>%"></div>
                                    </div>
                                    
                                    <div class="item-meta" style="margin-bottom: 1rem;">
                                        Proficiency: <%# Eval("ProficiencyLevel") %>%
                                    </div>
                                    
                                    <div class="item-actions">
                                        <asp:LinkButton CssClass="action-btn edit-btn" runat="server" 
                                                      CommandName="Edit" CommandArgument='<%# Eval("SkillId") %>'>
                                            <i class="fas fa-edit"></i>
                                            Edit
                                        </asp:LinkButton>
                                        <asp:LinkButton CssClass="action-btn delete-btn" runat="server" 
                                                      CommandName="Delete" CommandArgument='<%# Eval("SkillId") %>'
                                                      OnClientClick="return confirm('Are you sure you want to delete this skill?');">
                                            <i class="fas fa-trash"></i>
                                            Delete
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                        <asp:Panel ID="pnlNoSkills" runat="server" Visible="false" CssClass="empty-state">
                            <div class="empty-icon">
                                <i class="fas fa-cogs"></i>
                            </div>
                            <div class="empty-text">No skills added yet</div>
                            <div class="empty-subtext">Start by adding your first skill to showcase your expertise</div>
                        </asp:Panel>
                    </div>
                </div>

                <!-- Projects Management Section -->
                <div class="section-card">
                    <div class="section-header">
                        <h2 class="section-title">
                            <div class="section-icon">
                                <i class="fas fa-project-diagram"></i>
                            </div>
                            Projects Management
                        </h2>
                        <a href="AddProject.aspx" class="add-btn">
                            <i class="fas fa-plus"></i>
                            Add Project
                        </a>
                    </div>
                    
                    <div class="item-list">
                        <asp:Repeater ID="rptProjects" runat="server" OnItemCommand="rptProjects_ItemCommand">
                            <ItemTemplate>
                                <div class="item-card">
                                    <div class="item-header">
                                        <div>
                                            <div class="item-title"><%# Eval("ProjectName") %></div>
                                            <div class="item-meta"><%# Eval("StartDate", "{0:MMM yyyy}") %> - <%# Eval("EndDate") != DBNull.Value ? Eval("EndDate", "{0:MMM yyyy}") : "Present" %></div>
                                        </div>
                                    </div>
                                    
                                    <div class="item-description">
                                        <%# Eval("Description").ToString().Length > 150 ? 
                                            Eval("Description").ToString().Substring(0, 150) + "..." : 
                                            Eval("Description") %>
                                    </div>
                                    
                                    <div class="item-tags">
                                        <asp:Literal ID="litTechnologies" runat="server" 
                                                   Text='<%# FormatTechnologies(Eval("Technologies").ToString()) %>'></asp:Literal>
                                    </div>
                                    
                                    <div class="item-actions">
                                        <asp:LinkButton CssClass="action-btn edit-btn" runat="server" 
                                                      CommandName="Edit" CommandArgument='<%# Eval("ProjectId") %>'>
                                            <i class="fas fa-edit"></i>
                                            Edit
                                        </asp:LinkButton>
                                        <asp:LinkButton CssClass="action-btn delete-btn" runat="server" 
                                                      CommandName="Delete" CommandArgument='<%# Eval("ProjectId") %>'
                                                      OnClientClick="return confirm('Are you sure you want to delete this project?');">
                                            <i class="fas fa-trash"></i>
                                            Delete
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                        <asp:Panel ID="pnlNoProjects" runat="server" Visible="false" CssClass="empty-state">
                            <div class="empty-icon">
                                <i class="fas fa-project-diagram"></i>
                            </div>
                            <div class="empty-text">No projects added yet</div>
                            <div class="empty-subtext">Start by adding your first project to showcase your work</div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>