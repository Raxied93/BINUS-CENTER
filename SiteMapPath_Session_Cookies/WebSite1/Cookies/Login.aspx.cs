using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cookies_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpCookie mycookie = new HttpCookie("User_Info");
        mycookie["Nama"] = txtNama.Text;
        mycookie["Email"] = TxtEmail.Text;
        //non presist cookie jika tidak ada deklarasi expire

        //presist
        mycookie.Expires = DateTime.Now.AddDays(1);

        Response.Cookies.Add(mycookie);

        Response.Redirect("AfterLogin.aspx");
    }
}