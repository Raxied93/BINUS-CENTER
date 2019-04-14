using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Halaman_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Member_ID"] == null) {
            Response.Redirect("~/Login.aspx");
        }
    }


    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }
    //list array untuk ID Member
    //list string ID Lowongan
    private List<int> ID_Mem
    {
        get
        {
            if (this.ViewState["ID_Mem"] == null)
            {
                this.ViewState["ID_Mem"] = new List<int>();
            }
            return (List<int>)this.ViewState["ID_Mem"];
        }
    }
    public string Hasil;
    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        //get listview item chk
        foreach (ListViewDataItem item in ListViewHakAkses.Items)
        {
            CheckBox chkSelect = (CheckBox)item.FindControl("ChkIDMem");
            if (chkSelect != null)
            {
                int ID = Convert.ToInt32(chkSelect.Attributes["value"]);
                if (chkSelect.Checked && !this.ID_Mem.Contains(ID))
                {
                    this.ID_Mem.Add(ID);
                }
                else if (!chkSelect.Checked && this.ID_Mem.Contains(ID))
                {
                    this.ID_Mem.Remove(ID);
                }
            }
        }
        //insert value 
        Koneksi cn = new Koneksi();
  
        foreach (int item in ID_Mem) {
             Hasil = cn.KelasKoneksi_InsertHakAkses(item, Convert.ToInt32(DropDownListHakAkses.SelectedValue));
            //Response.Write("<script language='javascript'>window.alert('Berhasil Insert Data');</script>");
        }
        if (Hasil == "OK")
        {
            ListViewHakAkses.DataBind();
            Response.Write("<script language='javascript'>window.alert('Berhasil Insert Data');</script>");
        }
        else
        {
            ListViewHakAkses.DataBind();
            Response.Write("<script language='javascript'>window.alert('Terdapat Error Insert Data : " + Hasil + "');</script>");
        }



    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Login.aspx");
    }



    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        //get listview item chk
        foreach (ListViewDataItem item in ListViewHakAkses.Items)
        {
            CheckBox chkSelect = (CheckBox)item.FindControl("ChkIDMem");
            if (chkSelect != null)
            {
                int ID = Convert.ToInt32(chkSelect.Attributes["value"]);
                if (chkSelect.Checked && !this.ID_Mem.Contains(ID))
                {
                    this.ID_Mem.Add(ID);
                }
                else if (!chkSelect.Checked && this.ID_Mem.Contains(ID))
                {
                    this.ID_Mem.Remove(ID);
                }
            }
        }
        //insert value 
        Koneksi cn = new Koneksi();

        foreach (int item in ID_Mem)
        {
            Hasil = cn.KelasKoneksi_CRUD("Update User_Akses set id_akses = "+ Convert.ToInt32(DropDownListHakAkses.SelectedValue) + " where Member_id = "+item+"");

        }
        if (Hasil == "1")
        {
            ListViewHakAkses.DataBind();
            Response.Write("<script language='javascript'>window.alert('Berhasil Update Data');</script>");
        }
        else
        {
            ListViewHakAkses.DataBind();
            Response.Write("<script language='javascript'>window.alert('Terdapat Error Update Data : " + Hasil + "');</script>");
        }
    }
}