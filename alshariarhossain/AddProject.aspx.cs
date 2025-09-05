using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace alshariarhossain
{
    public partial class AddProject : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"INSERT INTO Projects (UserId, ProjectName, Description, Technologies, 
                                   ProjectUrl, GithubUrl, ImageUrl, StartDate, EndDate, CreatedAt, UpdatedAt)
                                   VALUES (@UserId, @ProjectName, @Description, @Technologies, 
                                   @ProjectUrl, @GithubUrl, @ImageUrl, @StartDate, @EndDate, GETDATE(), GETDATE())";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
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
                            ShowMessage("Project added successfully!", "success");
                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            ShowMessage("Error: Failed to add project.", "error");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error adding project: " + ex.Message, "error");
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