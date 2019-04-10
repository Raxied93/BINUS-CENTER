using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Halaman_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        //Panggil Kelas Konksi Login
        Koneksi cn = new Koneksi();
        bool hasil;
        hasil = cn.KelasKoneksi_Login(TxtUsername.Text, TxtPasswd.Text);
        if (hasil) {
            Session["Member_ID"] = TxtUsername.Text;
            Response.Write("<script language='javascript'>window.alert('Berhasil Login!');window.location='../Halaman/Master.aspx';</script>");
        } else {
            Response.Write("<script language='javascript'>window.alert('Gagal Login!');window.location='../Login.aspx';</script>");
        }
    }
}