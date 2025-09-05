using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace alshariarhossain
{
    public partial class EditSkill : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
        private int skillId;

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
                    skillId = Convert.ToInt32(Request.QueryString["id"]);
                    LoadSkillData(skillId);
                }
                else
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
        }

        private void LoadSkillData(int skillId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"SELECT SkillName, Category, ProficiencyLevel, IconClass 
                                   FROM Skills 
                                   WHERE SkillId = @SkillId AND UserId = @UserId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@SkillId", skillId);
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtSkillName.Text = reader["SkillName"].ToString();
                                ddlCategory.SelectedValue = reader["Category"].ToString();
                                txtProficiency.Text = reader["ProficiencyLevel"].ToString();
                                txtIconClass.Text = reader["IconClass"].ToString();
                            }
                            else
                            {
                                ShowMessage("Skill not found or unauthorized access.", "error");
                                Response.Redirect("Dashboard.aspx");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading skill: " + ex.Message, "error");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                skillId = Convert.ToInt32(Request.QueryString["id"]);
                UpdateSkill(skillId);
            }
        }

        private void UpdateSkill(int skillId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"UPDATE Skills 
                                   SET SkillName = @SkillName, 
                                       Category = @Category, 
                                       ProficiencyLevel = @ProficiencyLevel, 
                                       IconClass = @IconClass, 
                                       UpdatedAt = GETDATE()
                                   WHERE SkillId = @SkillId AND UserId = @UserId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@SkillId", skillId);
                        cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                        cmd.Parameters.AddWithValue("@SkillName", txtSkillName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@ProficiencyLevel", Convert.ToInt32(txtProficiency.Text));
                        cmd.Parameters.AddWithValue("@IconClass", string.IsNullOrEmpty(txtIconClass.Text) ? "fas fa-code" : txtIconClass.Text.Trim());

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowMessage("Skill updated successfully!", "success");
                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            ShowMessage("Error: Failed to update skill.", "error");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error updating skill: " + ex.Message, "error");
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