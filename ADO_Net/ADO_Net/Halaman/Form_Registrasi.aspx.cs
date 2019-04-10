using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form_Registrasi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        //deklarasi variabel
        string nama = string.Empty;
        string email = string.Empty;
        string pass = string.Empty;
        string ttl = string.Empty;

        nama = TxtNama.Text;
        email = TxtEmail.Text;
        pass = TxtPswd.Text;
        ttl = TxtTTL.Text;
        //Pemanggilan fungsi 
        Koneksi cn = new Koneksi();
        string Hasil = cn.KelasKoneksi_Insert(nama, pass, email, ttl);
        if (Hasil == "1")
        {
            //Response.Write("<script language=javascript>alert('Sukses Insert Data');</script>");
            Response.Write("<script language='javascript'>window.alert('Sukses Menyimpan Data !');window.location='../Login.aspx';</script>");
            //kirim email id login dan passwordnya 
            //redirect ke menu login
        }
        else {
            Response.Write("<script language=javascript>alert('gagal Insert Data, dengan Error : "+Hasil+"');</script>");
        }
    }
}