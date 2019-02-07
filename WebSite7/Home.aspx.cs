using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string s;
        
    protected void Button1_Click(object sender, EventArgs e)
    {
        s = TextBox1.Text;
        Response.Write("<script>alert('Value : "+s+"')</script>");
        string url = HttpContext.Current.Request.Url.AbsoluteUri;
        string user_agent = Request.UserAgent;
        string userhost = Request.UserHostAddress;
        Uri url_2 = Request.Url;

        Response.Write("<script>alert('Value : " + s + " -- url:"+url+" -- user_agent:"+user_agent+" -- userhost:"+userhost+"')</script>");
        Response.Write("URL Port: " + url_2.Port + "<br>");
        Response.Write("URL Protocol: " + Server.HtmlEncode(url_2.Scheme) + "<br>");
    }
}