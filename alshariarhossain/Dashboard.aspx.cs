using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace alshariarhossain
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblEmail.Text = Session["Email"].ToString();

                if (!IsPostBack)
                {
                    LoadDashboardData();
                }
            }
        }

        private void LoadDashboardData()
        {
            LoadSkills();
            LoadProjects();
            LoadStatistics();
        }

        private void LoadSkills()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"SELECT SkillId, SkillName, Category, ProficiencyLevel, IconClass
                                   FROM Skills 
                                   WHERE UserId = @UserId 
                                   ORDER BY Category, SkillName";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptSkills.DataSource = dt;
                            rptSkills.DataBind();
                            pnlNoSkills.Visible = false;
                        }
                        else
                        {
                            rptSkills.DataSource = null;
                            rptSkills.DataBind();
                            pnlNoSkills.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading skills: " + ex.Message, "error");
            }
        }

        private void LoadProjects()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"SELECT ProjectId, ProjectName, Description, Technologies, 
                                           StartDate, EndDate, ProjectUrl, GithubUrl 
                                   FROM Projects 
                                   WHERE UserId = @UserId 
                                   ORDER BY StartDate DESC";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptProjects.DataSource = dt;
                            rptProjects.DataBind();
                            pnlNoProjects.Visible = false;
                        }
                        else
                        {
                            rptProjects.DataSource = null;
                            rptProjects.DataBind();
                            pnlNoProjects.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading projects: " + ex.Message, "error");
            }
        }

        private void LoadStatistics()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Get skills count
                    string skillsQuery = "SELECT COUNT(*) FROM Skills WHERE UserId = @UserId";
                    using (SqlCommand cmd = new SqlCommand(skillsQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                        lblSkillsCount.Text = cmd.ExecuteScalar().ToString();
                    }

                    // Get projects count
                    string projectsQuery = "SELECT COUNT(*) FROM Projects WHERE UserId = @UserId";
                    using (SqlCommand cmd = new SqlCommand(projectsQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                        lblProjectsCount.Text = cmd.ExecuteScalar().ToString();
                    }

                    // Get last update
                    string lastUpdateQuery = @"SELECT TOP 1 CASE 
                                              WHEN P.UpdatedAt > S.UpdatedAt THEN P.UpdatedAt 
                                              ELSE S.UpdatedAt END as LastUpdate
                                              FROM (SELECT ISNULL(MAX(UpdatedAt), '1900-01-01') as UpdatedAt FROM Projects WHERE UserId = @UserId) P
                                              CROSS JOIN (SELECT ISNULL(MAX(UpdatedAt), '1900-01-01') as UpdatedAt FROM Skills WHERE UserId = @UserId) S";
                    using (SqlCommand cmd = new SqlCommand(lastUpdateQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            DateTime lastUpdate = Convert.ToDateTime(result);
                            if (lastUpdate.Year > 1900)
                            {
                                lblLastUpdate.Text = lastUpdate.ToString("MMM dd, yyyy");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading statistics: " + ex.Message, "error");
            }
        }

        protected void rptSkills_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int skillId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                Response.Redirect($"EditSkill.aspx?id={skillId}");
            }
            else if (e.CommandName == "Delete")
            {
                DeleteSkill(skillId);
            }
        }

        protected void rptProjects_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int projectId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                Response.Redirect($"EditProject.aspx?id={projectId}");
            }
            else if (e.CommandName == "Delete")
            {
                DeleteProject(projectId);
            }
        }

        private void DeleteSkill(int skillId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "DELETE FROM Skills WHERE SkillId = @SkillId AND UserId = @UserId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@SkillId", skillId);
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowMessage("Skill deleted successfully!", "success");
                            LoadDashboardData(); // Refresh the data
                        }
                        else
                        {
                            ShowMessage("Error: Skill not found or unauthorized access.", "error");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error deleting skill: " + ex.Message, "error");
            }
        }

        private void DeleteProject(int projectId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "DELETE FROM Projects WHERE ProjectId = @ProjectId AND UserId = @UserId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ProjectId", projectId);
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowMessage("Project deleted successfully!", "success");
                            LoadDashboardData(); // Refresh the data
                        }
                        else
                        {
                            ShowMessage("Error: Project not found or unauthorized access.", "error");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error deleting project: " + ex.Message, "error");
            }
        }

        // Helper method to format technologies as tags
        protected string FormatTechnologies(string technologies)
        {
            if (string.IsNullOrEmpty(technologies))
                return "";

            string[] techArray = technologies.Split(',');
            string result = "";

            foreach (string tech in techArray)
            {
                if (!string.IsNullOrWhiteSpace(tech))
                {
                    result += $"<span class='tag'>{tech.Trim()}</span>";
                }
            }

            return result;
        }

        private void ShowMessage(string message, string type)
        {
            string script = $@"
                <script type='text/javascript'>
                    document.addEventListener('DOMContentLoaded', function() {{
                        var messageDiv = document.createElement('div');
                        messageDiv.style.cssText = `
                            position: fixed;
                            top: 20px;
                            right: 20px;
                            padding: 1rem 1.5rem;
                            border-radius: 10px;
                            color: white;
                            font-weight: 500;
                            z-index: 9999;
                            opacity: 0;
                            transition: all 0.3s ease;
                            background: {(type == "success" ? "linear-gradient(45deg, #10b981, #059669)" : "linear-gradient(45deg, #ef4444, #dc2626)")};
                            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
                        `;
                        messageDiv.textContent = '{message}';
                        document.body.appendChild(messageDiv);
                        
                        setTimeout(() => {{ messageDiv.style.opacity = '1'; }}, 100);
                        setTimeout(() => {{ 
                            messageDiv.style.opacity = '0';
                            setTimeout(() => {{ document.body.removeChild(messageDiv); }}, 300);
                        }}, 4000);
                    }});
                </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "ShowMessage", script, false);
        }
    }
}