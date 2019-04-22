using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
//for sending an email
using System.Net;
using System.Net.Mail;
//for itext 
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace TestCaptcha.Halaman

{
    public partial class Halaman_TestCaptcha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            div1.Visible = true;
            div2.Visible = false;
        }
        //untuk reCaptcha
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
                using (WebResponse wResponse = req.GetResponse()) // get URI value from web request
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
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Validate())
            {
                string nama = string.Empty;
                string username = string.Empty;
                string pswd = string.Empty;
                string email = string.Empty;

                nama = TxtNama.Text;
                username = TxtUsername.Text;
                pswd = TxtPswd.Text;
                email = TxtEmail.Text;

                //email notification 
                My_Class mc = new My_Class();
                string Hasil = mc.emailnotification(email, "Username : "+username+"<br /> Password : "+pswd+"");
                if (Hasil == "OK") {
                    div1.Visible = false;
                    div2.Visible = true;
                    LblNama.Text = nama;
                    LblUsername.Text = username;
                    LblPassword.Text = pswd;
                    LblEmail.Text = email;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Berhasil menyimpan !')", true);
                    Response.Write("<script language=javascript>alert('Username : " + username + " Password : " + pswd + "');</script>");
                } else {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Gagal menyimpan !')", true);
                    Response.Write("<script language=javascript>alert('Ada Error : "+Hasil+"');</script>");
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Gagal menyimpan, Harap Centang Captcha !')", true);
                //lblmsg.Text = "Not Valid Recaptcha";
                //lblmsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void BtnPrint_Click(object sender, EventArgs e)
        {
            //Step 1: Create a System.IO.FileStream object:
            FileStream fs = new FileStream("Chapter1_Example1.pdf", FileMode.Create, FileAccess.Write, FileShare.None);
            //Step 2: Create a iTextSharp.text.Document object:
            Document doc = new Document(PageSize.A4, 36, 72, 108, 180);

            //Step 3: Create a iTextSharp.text.pdf.PdfWriter object. It helps to write the Document to the Specified FileStream:
            PdfWriter writer = PdfWriter.GetInstance(doc, fs);
            //Step 4: Openning the Document:
            doc.Open();
            //Step 5: Adding a Paragraph by creating a iTextSharp.text.Paragraph object:
            //setting doc content 
            doc.AddTitle("Hello World example");
            doc.AddSubject("This is an Example 4 of Chapter 1 of Book 'iText in Action'");
            doc.AddKeywords("Metadata, iTextSharp 5.4.4, Chapter 1, Tutorial");
            doc.AddCreator("iTextSharp 5.4.4");
            doc.AddAuthor("Debopam Pal");
            doc.AddHeader("Nothing", "No Header");
            //Step 6: Closing the Document:
            doc.Close();
            
            

        }
    }
}