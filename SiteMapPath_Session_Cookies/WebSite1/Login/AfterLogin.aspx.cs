using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_AfterLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Login"] != null) {
            LblGreet.Text = "Berhasil Login";
        }
        else {
            Response.Redirect("LoginPage.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("User_Login");
        Session.RemoveAll();
        Response.Redirect("LoginPage.aspx");
    }
}