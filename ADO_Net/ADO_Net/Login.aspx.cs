using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
    
public partial class Halaman_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //function pndukung recaptcha
    public class MyObject
    {
        public string success { get; set; }
    }
    public bool Validate()
    {
        string Response = Request["g-recaptcha-response"];//Getting Response String Append to Post Method
        bool Valid = false;
        //Request to Google Server
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create
        (" https://www.google.com/recaptcha/api/siteverify?secret=6LfYd5QUAAAAABIjga_sFUYQ49s2q5x5AXypqenX&response=" + Response);
        try
        {
            //Google recaptcha Response
            using (WebResponse wResponse = req.GetResponse())
            {

                using (StreamReader readStream = new StreamReader(wResponse.GetResponseStream()))
                {
                    string jsonResponse = readStream.ReadToEnd();

                    JavaScriptSerializer js = new JavaScriptSerializer();
                    MyObject data = js.Deserialize<MyObject>(jsonResponse);// Deserialize Json

                    Valid = Convert.ToBoolean(data.success);
                }
            }

            return Valid;
        }
        catch (WebException ex)
        {
            throw ex;

        }
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        //ke tb userakses berdasarkan member id 
        //Panggil Kelas Konksi Login
        Koneksi cn = new Koneksi();
        bool hasil;
        hasil = cn.KelasKoneksi_Login(TxtUsername.Text, TxtPasswd.Text);
        if (Validate())
        {
            if (hasil)
            {
                Session["Member_ID"] = TxtUsername.Text;
                //ke tb userakses berdasarkan member id -- 1:menu master 2:menu pengguna
                string sql_akses = "select id_akses from User_akses where Member_id = " + Convert.ToInt32(TxtUsername.Text) + "";
                List<string> akses = cn.KelasKoneksi_SelectGlobal(sql_akses, "3");
                if (akses.Count == 0)
                {
                    Response.Write("<script language='javascript'>window.alert('Gagal Login! Hak Akses Anda tidak Di Temukan');window.location='../Login.aspx';</script>");

                }
                else
                {
                    if (akses[0].ToString() == "1")
                    {
                        Response.Write("<script language='javascript'>window.alert('Berhasil Login!');window.location='../Halaman/Master.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script language='javascript'>window.alert('Berhasil Login!');window.location='../Halaman/Form_Pengguna.aspx';</script>");
                    }
                }


            }
            else
            {
                Response.Write("<script language='javascript'>window.alert('Gagal Login!');window.location='../Login.aspx';</script>");
            }
        }else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Gagal menyimpan, Harap Centang Captcha !')", true);
        }
    }
}