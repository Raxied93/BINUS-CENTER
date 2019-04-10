using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Halaman_Master_InputStock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Member_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }


        ListViewMasterStock.DataSource = null;
        ListViewMasterStock.DataBind();

        //***** GET DATASET
        //Koneksi cn = new Koneksi();
        //DataSet ds = new DataSet();
        //string sql = "Select * from Stock";
        //ds = cn.getDataSet(sql);

        //ListViewMasterStock.DataSource = ds;
        //ListViewMasterStock.DataBind();
    }
    public string Hasil = string.Empty;
    public string memid = string.Empty;

    //list string ID Lowongan
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
    protected void Simpan_Click(object sender, EventArgs e)
    {
        Koneksi cn = new Koneksi();
        //Response.Write("<script language='javascript'>window.alert('Harap Pilih File untuk di Upload');</script>");
        //get session mem id
        foreach (string key in Session.Contents)
        {
            memid = Session["Member_ID"].ToString();
        }
        if (FileUploadGambar.HasFile) //cek file upload null / tidak
        {
            string extension = Path.GetExtension(FileUploadGambar.PostedFile.FileName);
            Label2.Visible = true;
            //Label2.Text = "File Sukses TerUpload dengan Nama: " + "Foto_" + nama + "" + extension + " dengan User : " + Session["User"] + " ";
            //imgPath
            string ran = Guid.NewGuid().ToString("n").Substring(0, 8);//get random num
            string nama = "File" + memid;
            string imgPath = "../img/"+ ran + "_"+ nama + extension;
            //Upload File 
            FileUploadGambar.SaveAs(Server.MapPath(imgPath));

            byte[] theImage = new byte[FileUploadGambar.PostedFile.ContentLength];
            HttpPostedFile Image = FileUploadGambar.PostedFile;
            Image.InputStream.Read(theImage, 0, (int)FileUploadGambar.PostedFile.ContentLength);

            int length = theImage.Length;
            string fileName = FileUploadGambar.FileName.ToString();
            string type = FileUploadGambar.PostedFile.ContentType;

            int size = FileUploadGambar.PostedFile.ContentLength;
            if (FileUploadGambar.PostedFile != null && FileUploadGambar.PostedFile.FileName != "")
            {
                string Hasil;
                Hasil = cn.KelasKoneksi_InsertStock(Convert.ToInt32(memid), TxtNamaBarang.Text, TxtTgl.Text, TxtKet.Text, DropDownListStatusBarang.SelectedValue, Convert.ToInt32(TxtJumlah.Text), imgPath);
                if (Hasil == "OK")
                {
                    Response.Write("<script language='javascript'>window.alert('Berhasil Menyimpan Data!');window.location='../Halaman/Master.aspx';</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>window.alert('Gagal Menyimpan Data dengan Error : " + Hasil + "');window.location='../Halaman/Master.aspx';</script>");
                }

            }
        }
        else
        {
            Response.Write("<script language='javascript'>window.alert('Harap Pilih File untuk di Upload');</script>");
        }
        //Hasil = cn.KelasKoneksi_InsertStock();
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        //***** GET DATASET
        Koneksi cn = new Koneksi();
        DataSet ds = new DataSet();
        string date1 = TxtAwal.Text;
        DateTime formattedtime1 = DateTime.ParseExact(date1, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        string date2 = TxtAkhir.Text;
        DateTime formattedtime2 = DateTime.ParseExact(date2, "dd/MM/yyyy", CultureInfo.InvariantCulture);

        string sql = "Select * from Stock where TglDatang >= '" + date1 + "' and TglDatang <= '" + date2 + "' ";
        ds = cn.getDataSet(sql);

        ListViewMasterStock.DataSource = ds;
        ListViewMasterStock.DataBind();
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {

        //get listview item chk
        foreach (ListViewDataItem item in ListViewMasterStock.Items)
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
        foreach (int item in ID_bar)
        {
            Koneksi cn = new Koneksi();
            string sqlupdt = "update stock set status_barang = "+Convert.ToInt32(DropDownListUpdateStatus.SelectedValue) +" where id_barang = "+item+"";
            Hasil = cn.KelasKoneksi_CRUD(sqlupdt);
            if (Hasil=="1") {
                Response.Write("<script language='javascript'>window.alert('Berhasil Update Data dengan ID :"+Convert.ToString(item)+ "');window.location='../Halaman/Master.aspx';</script>");
            }
            else {
                Response.Write("<script language='javascript'>window.alert('Gagal Update Data dengan ID : " + Convert.ToString(item) + "');window.location='../Halaman/Master.aspx';</script>");
            }
            
        }

    }
}