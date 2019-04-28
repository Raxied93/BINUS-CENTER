using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;

using iTextSharp.text.pdf;

using iTextSharp.text.html;

using System.IO;
using System.Text.RegularExpressions;
using iTextSharp.text.html.simpleparser;

public partial class Halaman_Report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string memid =Request.QueryString["memid"];
        //multiview / div di show / hide berdasarkan memid
        Koneksi cn = new Koneksi();
        DataSet ds = new DataSet();
        ds = cn.getDataSet("select * from KeranjangBelanja where Member_ID = " + Convert.ToInt32(memid) + "");
        ListViewCekKeranjang.DataSource = ds;
        ListViewCekKeranjang.DataBind();
        ListViewCekKeranjang.Visible = true;
    }

    protected void BtnCetak_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=TestReport.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);


        StringWriter sw = new StringWriter();


        HtmlTextWriter w = new HtmlTextWriter(sw);
        print.RenderControl(w);


        string htmWrite = sw.GetStringBuilder().ToString();
        htmWrite = Regex.Replace(htmWrite, "</?(a|A).*?>", "");
        htmWrite = htmWrite.Replace("\r\n", "");
        StringReader reader = new StringReader(htmWrite);

        Document doc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        //string pdfFilePath = Server.MapPath(".") + "/img";

        HTMLWorker htmlparser = new HTMLWorker(doc);
        PdfWriter.GetInstance(doc, Response.OutputStream);

        doc.Open();
        try
        {
            htmlparser.Parse(reader);
            doc.Close();
            Response.Write(doc);
            Response.End();
        }
        catch (Exception ex)
        { }
        finally
        {
            doc.Close();
        }
    }

    protected void BtnKembali_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Halaman/Form_Pengguna.aspx");
    }
}