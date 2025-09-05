using System;

namespace alshariarhossain
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblEmail.Text = Session["Email"].ToString();
            }
        }
    }
}
