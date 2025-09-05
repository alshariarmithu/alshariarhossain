using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace alshariarhossain
{
    public partial class EditProject : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
        private int projectId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    projectId = Convert.ToInt32(Request.QueryString["id"]);
                    LoadProjectData(projectId);
                }
                else
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
        }

        private void LoadProjectData(int projectId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"SELECT ProjectName, Description, Technologies, ProjectUrl, 
                                   GithubUrl, ImageUrl, StartDate, EndDate 
                                   FROM Projects 
                                   WHERE ProjectId = @ProjectId AND UserId = @UserId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ProjectId", projectId);
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtProjectName.Text = reader["ProjectName"].ToString();
                                txtDescription.Text = reader["Description"].ToString();
                                txtTechnologies.Text = reader["Technologies"].ToString();
                                txtProjectUrl.Text = reader["ProjectUrl"].ToString();
                                txtGithubUrl.Text = reader["GithubUrl"].ToString();
                                txtImageUrl.Text = reader["ImageUrl"].ToString();

                                if (reader["StartDate"] != DBNull.Value)
                                    txtStartDate.Text = Convert.ToDateTime(reader["StartDate"]).ToString("yyyy-MM-dd");

                                if (reader["EndDate"] != DBNull.Value)
                                    txtEndDate.Text = Convert.ToDateTime(reader["EndDate"]).ToString("yyyy-MM-dd");
                            }
                            else
                            {
                                ShowMessage("Project not found or unauthorized access.", "error");
                                Response.Redirect("Dashboard.aspx");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading project: " + ex.Message, "error");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                projectId = Convert.ToInt32(Request.QueryString["id"]);
                UpdateProject(projectId);
            }
        }

        private void UpdateProject(int projectId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"UPDATE Projects 
                                   SET ProjectName = @ProjectName, 
                                       Description = @Description, 
                                       Technologies = @Technologies, 
                                       ProjectUrl = @ProjectUrl, 
                                       GithubUrl = @GithubUrl, 
                                       ImageUrl = @ImageUrl, 
                                       StartDate = @StartDate, 
                                       EndDate = @EndDate, 
                                       UpdatedAt = GETDATE()
                                   WHERE ProjectId = @ProjectId AND UserId = @UserId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ProjectId", projectId);
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                        cmd.Parameters.AddWithValue("@ProjectName", txtProjectName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@Technologies", txtTechnologies.Text.Trim());
                        cmd.Parameters.AddWithValue("@ProjectUrl", string.IsNullOrEmpty(txtProjectUrl.Text) ? DBNull.Value : (object)txtProjectUrl.Text.Trim());
                        cmd.Parameters.AddWithValue("@GithubUrl", string.IsNullOrEmpty(txtGithubUrl.Text) ? DBNull.Value : (object)txtGithubUrl.Text.Trim());
                        cmd.Parameters.AddWithValue("@ImageUrl", string.IsNullOrEmpty(txtImageUrl.Text) ? DBNull.Value : (object)txtImageUrl.Text.Trim());

                        // Handle dates
                        if (!string.IsNullOrEmpty(txtStartDate.Text))
                            cmd.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(txtStartDate.Text));
                        else
                            cmd.Parameters.AddWithValue("@StartDate", DBNull.Value);

                        if (!string.IsNullOrEmpty(txtEndDate.Text))
                            cmd.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(txtEndDate.Text));
                        else
                            cmd.Parameters.AddWithValue("@EndDate", DBNull.Value);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowMessage("Project updated successfully!", "success");
                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            ShowMessage("Error: Failed to update project.", "error");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error updating project: " + ex.Message, "error");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        private void ShowMessage(string message, string type)
        {
            string script = $@"
                <script type='text/javascript'>
                    alert('{message}');
                </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "ShowMessage", script, false);
        }
    }
}