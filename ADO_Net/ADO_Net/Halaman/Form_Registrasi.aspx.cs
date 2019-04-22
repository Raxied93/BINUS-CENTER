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
    public string HasilEmail = string.Empty;
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
            string sqlselect = "select max(member_id) as member_id from Ms_member";
           
            List<string> memberid = cn.KelasKoneksi_SelectGlobal(sqlselect, "5");
            foreach (string item in memberid)
            {
                string isipesan = "<div style='background:linear-gradient(#c0c0c0, #f5f5f5);border-bottom:1px solid #d60000;padding:5px;font-family:verdana;'>Pemberitahuan IT Web System</div><div style='font-family:verdana;font-size:10pt;padding:4px;margin:5px auto;border-left:3px solid #0080c0;'><div style='margin:0 auto;background: #FFfFD5;width:50%;padding:5px;border-radius:4px;border-left:3px solid #0080c0;font-family:verdana;font-size:10pt;'> Selamat, Registrasi Anda Berhasil!<br/> Berikut Adalah Detail Akun Anda Untuk Login ; <br/> Username : " + Convert.ToInt32(item) + "<br/>Password : " + pass + "<br/> Jaga selalu Kerahasiaan Akun Anda. Kami Tidak Bertanggung Jawab atas Kelalaian yang di sebabkan Oleh Pengguna.  <br/><span style='color:blue;font-size:8pt;'></span></div><br/><br><center style='color: blue; '></center><br/><center>Atas perhatian dan kerjasamanya kami ucapkan terimakasih.</center><br/><br/><br/><strong style='color:blue;font-family:verdana;'>Regards,<br/><i style='font-size:8pt;color:#666;'>Web System | IT Departement</i></strong><br/><strong>IT Group</strong><br/><i>PT. YourCompanyName</i><br/><span style='font-size:9pt;color:#666;'>Jakarta - Indonesia<br/>Branch Address</span><br/>Phone Number<br/>Website : <a href=# target='_blank'>Your Web</a><br/></div>";
                HasilEmail = cn.email_otomatis(email, isipesan);
                //Response.Write("<script language='javascript'>window.alert('Sukses Menyimpan Data !');window.location='../Login.aspx';</script>");
            }
            if (HasilEmail == "OK")
            {
                Response.Write("<script language='javascript'>window.alert('Sukses Menyimpan Data, Cek Email Anda Segera !');window.location='../Login.aspx';</script>");
            }
            else {
                Response.Write("<script language='javascript'>window.alert('Gagal Menyimpan Data!');window.location='../Login.aspx';</script>");
            }
           
            //kirim email id login dan passwordnya 
            //redirect ke menu login
        }
        else {
            Response.Write("<script language=javascript>alert('gagal Insert Data, dengan Error : "+Hasil+"');</script>");
        }
    }
}