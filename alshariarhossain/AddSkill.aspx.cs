using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace alshariarhossain
{
    public partial class AddSkill : System.Web.UI.Page
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
                    string query = @"INSERT INTO Skills (UserId, SkillName, Category, ProficiencyLevel, IconClass, CreatedAt, UpdatedAt)
                                   VALUES (@UserId, @SkillName, @Category, @ProficiencyLevel, @IconClass, GETDATE(), GETDATE())";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                        cmd.Parameters.AddWithValue("@SkillName", txtSkillName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@ProficiencyLevel", Convert.ToInt32(txtProficiency.Text));
                        cmd.Parameters.AddWithValue("@IconClass", string.IsNullOrEmpty(txtIconClass.Text) ? "fas fa-code" : txtIconClass.Text.Trim());

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowMessage("Skill added successfully!", "success");
                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            ShowMessage("Error: Failed to add skill.", "error");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error adding skill: " + ex.Message, "error");
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