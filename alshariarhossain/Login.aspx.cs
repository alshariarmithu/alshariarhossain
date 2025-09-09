using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

namespace alshariarhossain
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowAlert("Please enter both email and password.");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT Id, Email FROM Users WHERE Email=@Email AND Password=@Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        Session["UserId"] = reader["Id"].ToString();
                        Session["Email"] = reader["Email"].ToString();

                        HttpCookie loginCookie = new HttpCookie("UserLogin");
                        loginCookie["UserId"] = reader["Id"].ToString();
                        loginCookie["Email"] = reader["Email"].ToString();
                        loginCookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(loginCookie);

                        Response.Redirect("Dashboard.aspx");

                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        ShowAlert("Invalid email or password.");
                    }
                }
            }
        }

        private void ShowAlert(string message)
        {
            AlertPanel.Visible = true;
            AlertMessage.Text = message;
        }
    }
}