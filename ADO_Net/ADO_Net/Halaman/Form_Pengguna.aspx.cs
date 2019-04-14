using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form_Pengguna : System.Web.UI.Page
{
    public string memid;
    public string Hasil = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Member_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        foreach (string key in Session.Contents)
        {
            memid = Session["Member_ID"].ToString();
        }
        TxtMemID.Text = memid;
    }
    //list string 
    private List<int> ID_bar
    {
        get
        {
            if (this.ViewState["ID_bar"] == null)
            {
                this.ViewState["ID_bar"] = new List<int>();
            }
            return (List<int>)this.ViewState["ID_bar"];
        }
    }
    protected void BtnSimpanKeranjang_Click(object sender, EventArgs e)
    {
        //get chk keranjang belanja
        //get listview item chk
        foreach (ListViewDataItem item in ListViewHakAkses.Items)
        {
            CheckBox chkSelect = (CheckBox)item.FindControl("chkbar");
            if (chkSelect != null)
            {
                int ID = Convert.ToInt32(chkSelect.Attributes["value"]);
                if (chkSelect.Checked && !this.ID_bar.Contains(ID))
                {
                    this.ID_bar.Add(ID);
                }
                else if (!chkSelect.Checked && this.ID_bar.Contains(ID))
                {
                    this.ID_bar.Remove(ID);
                }
            }
        }

        //insert ke KeranjangBelanja
        foreach (int item in ID_bar)
        {
            Koneksi cn = new Koneksi();
            //get nama barang
            string sqlnama = "select nama_barang from stock where id_barang = "+item+"";
            List<string> namaBarang = cn.KelasKoneksi_SelectGlobal(sqlnama, "4");
            string sqlupdt = "insert into KeranjangBelanja values ("+memid+","+item+",'"+namaBarang[0].ToString()+"', "+Convert.ToInt32(TxtJumlah.Text)+", GETDATE())";//insert ke KeranjangBelanja
            Hasil = cn.KelasKoneksi_CRUD(sqlupdt);
            if (Hasil == "1")
            {
                Response.Write("<script language='javascript'>window.alert('Berhasil Insert Data dengan ID :" + Convert.ToString(item) + "');window.location='../Halaman/Form_Pengguna.aspx';</script>");
            }
            else
            {
                Response.Write("<script language='javascript'>window.alert('Gagal Insert Data dengan ID : " + Convert.ToString(item) + "');window.location='../Halaman/Form_Pengguna.aspx';</script>");
            }

        }
    }

    protected void BtnBatalKeranjang_Click(object sender, EventArgs e)
    {
        //delete KeranjangBelanja berdasarkan memid
        Koneksi cn = new Koneksi();
        Hasil = cn.KelasKoneksi_CRUD("delete from keranjangbelanja where member_id = "+Convert.ToInt32(memid)+"");
        if (Hasil == "1")
        {
            Response.Write("<script language='javascript'>window.alert('Berhasil Delete Data dengan ID :" + Convert.ToString(memid) + "');window.location='../Halaman/Form_Pengguna.aspx';</script>");
        }
        else
        {
            Response.Write("<script language='javascript'>window.alert('Gagal Delete Data dengan ID : " + Convert.ToString(memid) + "');window.location='../Halaman/Form_Pengguna.aspx';</script>");
        }
    }

    protected void BtnCekKeranjang_Click(object sender, EventArgs e)
    {
        //multiview / div di show / hide berdasarkan memid
        Koneksi cn = new Koneksi();
        DataSet ds = new DataSet();
        ds = cn.getDataSet("select * from KeranjangBelanja where Member_ID = "+Convert.ToInt32(memid)+"");
        ListViewCekKeranjang.DataSource = ds;
        ListViewCekKeranjang.DataBind();
        ListViewCekKeranjang.Visible = true;
        BtnBatalKeranjang.Visible = true;
        //hide
        BtnSimpanKeranjang.Visible = false;
        ListViewHakAkses.Visible = false;
        TxtJumlah.Visible = false;
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }
}