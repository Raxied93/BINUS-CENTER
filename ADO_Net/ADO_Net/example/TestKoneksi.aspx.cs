using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Halaman_TestKoneksi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnTest_Click(object sender, EventArgs e)
    {
        //***** COMMAND READER
        Koneksi cn = new Koneksi();
        //List<string> hasil = cn.KelasKoneksi_SelectGlobal("select * from Login_user where Username_login = 'Test1'", "1");
        //foreach (string a in hasil)
        //{
        //    Response.Write("<script language=javascript>alert('hasil :" + a + " ');</script>");
        //}

        //Label1.Text = hasil[0].ToString();
        //Label2.Text = hasil[1].ToString();

        //***** EXEC SCALAR
        //string hasil = cn.Exec_scalar("select count(*) from Login_User");
        //Response.Write("<script language=javascript>alert('hasil :" + hasil + " ');</script>");

        //***** CRUD FUNCTION
        //string sql = "Update Login_User set UserName_Login = 'Herlambang' where id_login = " + Convert.ToInt32(TextBox1.Text) + "";
        string sql = "delete from Login_user where id_login = " + Convert.ToInt32(TextBox1.Text) + "";
        string hasil = cn.KelasKoneksi_CRUD(sql);
        if (hasil == "1")
        {
            Response.Write("<script language=javascript>alert('Sukses Update Data');</script>");
        }

        //***** GET DATASET
        //DataSet ds = new DataSet();
        //string sql = "Select * from Login_user";
        //ds = cn.getDataSet(sql);

        //ListViewDataLogin.DataSource = ds;
        //ListViewDataLogin.DataBind();

    }
}