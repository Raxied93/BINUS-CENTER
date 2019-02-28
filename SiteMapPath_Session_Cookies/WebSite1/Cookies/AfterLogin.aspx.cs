using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cookies_AfterLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie mycookie = Request.Cookies["User_Info"];
        if (mycookie != null) {
            LblNama.Text = mycookie["Nama"];
            LblEmail.Text = mycookie["Email"];
        }
    }
}