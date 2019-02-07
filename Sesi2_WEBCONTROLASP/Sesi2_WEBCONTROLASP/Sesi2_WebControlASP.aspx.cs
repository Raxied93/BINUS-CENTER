using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//for uploadfile
using System.IO;

public partial class Sesi2_WebControlASP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ImageForm.ImageUrl ="~/img/TheFlash.jpg";
        ImageButtonForm.ImageUrl = "~/img/Data Database.png";

        //hyperlink
        HyperLink1.Text = "Click Here";
        HyperLink1.NavigateUrl = "http://www.google.com";
        //mutiview default value
        MultiViewMaster.ActiveViewIndex = 0;

        ImageButton1.ImageUrl = "http://localhost:50812/img/Data Database.png";

    }
    //Function clear
    public void ClearObject() {
        TxtAngka1Form.Text = "";
        TxtAngka2Form.Text = "";
        TxtPasswordForm.Text = "";
        CheckBoxForm.Checked = false;
        CheckBoxListForm.ClearSelection();
        RadioButtonForm.Checked = false;
        RadioButtonListForm.ClearSelection();
        DropDownListForm.SelectedIndex = 0;
        ListBoxForm.ClearSelection();
    }


    //deklarasi variabel public
    int Bilangan1, Bilangan2, BilanganFinal;
    protected void ImageButtonForm_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<script>window.location.href='imagebutton.aspx';</script>");
    }

    protected void BtnSubmitForm_Click(object sender, EventArgs e)
    {

        //if (TxtAngka1Form.Text == String.Empty || TxtAngka2Form.Text == String.Empty)
        //{
        //    Response.Write("<script>alert('Textbox Tidak Boleh kosong')</script>");
        //}
        //else if (TxtPasswordForm.Text == string.Empty) {
        //    Response.Write("<script>alert('Textbox Password Tidak Boleh kosong')</script>");
        //}
        //else {

        //}
        //deklarasi variabel lokal
        Bilangan1 = Convert.ToInt32(TxtAngka1Form.Text);
        Bilangan2 = Convert.ToInt32(TxtAngka2Form.Text);

        BilanganFinal = Bilangan1 + Bilangan2;
        LblHasil.Text = Convert.ToString(BilanganFinal);

        //Response.Write("<script>alert('Get item ')</script>");



        //tampilkan di view1
        LblHasilOperasi.Text = LblHasil.Text; //untuk hasil penjumlahan
        LblHasilPswd.Text = TxtPasswordForm.Text; //untuk hasil password

        //** GET CHECK BOX VALUE
        //LblHasilChk.Text 
        string chk_stts = CheckBoxForm.Checked.ToString();
        if (CheckBoxForm.Checked) {
            LblHasilChk.Text = HiddenFieldCheckBoxForm.Value.ToString();
        }
        //**GET CHK LIST VALUE 
        string items = string.Empty;
        foreach (ListItem i in CheckBoxListForm.Items)
        {
            if (i.Selected == true)
            {
                items += i.Value + ",";
                LblHasilChkList.Text = items;
            }
        }

        //**GET RB VALUE
        if (RadioButtonForm.Checked)
        {
            LblHasilRadio.Text = HiddenFieldRadioButtonForm.Value.ToString(); 
        }

        //***GET RB LIST VALUE
        string itemsr = string.Empty;
        foreach (ListItem i in RadioButtonListForm.Items)
        {
            if (i.Selected == true)
            {
                itemsr = i.Value ;
                LblHasilRadioList.Text = itemsr;
            }
        }

        //***GET LIST BOX VALUE
        string iteml = string.Empty;
        foreach (ListItem i in ListBoxForm.Items)
        {
            if (i.Selected == true)
            {
                //iteml = i.Value;
                iteml+= i.Value + ",";
                LblHasilListButton.Text = iteml;
            }
        }


        //***GET DD VALUE
        LblHasilDropD.Text = DropDownListForm.Text;

        //***GET FILE UPLOAD 
        if (FileUploadForm.HasFile)
        {
            string filereceived = FileUploadForm.PostedFile.FileName;
            string filename = Path.GetFileName(filereceived);
            string absolutePath= "C:/Users/Herlambang/Pictures/BABExx/"+filename;
            LblHasilFileUp.Text = absolutePath;
        }
        //LblHasilFileUp.Text = "";
        MultiViewMaster.ActiveViewIndex = 1;

        //call method clear

    }

    protected void BtnBack_Click(object sender, EventArgs e)
    {
        MultiViewMaster.ActiveViewIndex = 0;
        ClearObject();
    }
}