using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
//must add
using System.Web.Configuration;

/// <summary>
/// Summary description for Koneksi
/// </summary>
public class Koneksi
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataReader reader;
    public string status = string.Empty;
    public string strconn = WebConfigurationManager.ConnectionStrings["KoneksiAdoNet"].ConnectionString; //menyimpan conn string dari web config
    public string KelasKoneksi_Open()
    {

        conn = new SqlConnection(strconn);
        conn.Open();
        if (conn.State == System.Data.ConnectionState.Open)
        {
            status = "Connection Open";
        }
        else
        {
            status = "Connection Close";
        }
        return status;
    }
    //kelas Read Data
    //fungsi select global dengan arraylist
    public List<String> GlobalAr = new List<String>();
    public List<String> KelasKoneksi_SelectGlobal(string SqlCmd, string sub)
    {
        String strconn = WebConfigurationManager.ConnectionStrings["KoneksiAdoNet"].ConnectionString;
        conn = new SqlConnection(strconn);
        string sql = SqlCmd;
        cmd = new SqlCommand(sql, conn);
        SqlDataReader reader; //Menggunakan data reader untuk select dan mengambil value nya 

        GlobalAr.Clear();
        try
        {
            conn.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (sub == "1")
                {
                    GlobalAr.Add(reader["id_login"].ToString()); //0
                    GlobalAr.Add(reader["username_login"].ToString()); //0
                    GlobalAr.Add(reader["password_login"].ToString()); //0
                }
                else if (sub == "2")
                { //Ms_Member
                    GlobalAr.Add(reader["id_login"].ToString()); //0
                    GlobalAr.Add(reader["username_login"].ToString()); //0
                    GlobalAr.Add(reader["password_login"].ToString()); //0
                } else if (sub == "3") {// untuk user akses
                    GlobalAr.Add(reader["id_akses"].ToString()); //0
                } else if (sub == "4") {
                    GlobalAr.Add(reader["nama_barang"].ToString()); //0
                } else if (sub == "5") {
                    GlobalAr.Add(reader["member_id"].ToString()); //0
                }

            }
        }
        catch (SqlException ex)
        {
            status = "Terjadi error Ketika Select: " + ex.Message;
            GlobalAr.Clear();
            GlobalAr.Add(status);
            // return ArrayLogin;

        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }

        return GlobalAr;
    }
    //method execute scalar
    public string Exec_scalar(string SqlCmd) {
        status = string.Empty;

        String strconn = WebConfigurationManager.ConnectionStrings["KoneksiAdoNet"].ConnectionString;
        conn = new SqlConnection(strconn);
        string sql = SqlCmd;
        cmd = new SqlCommand(sql, conn);
        
        try {
            conn.Open();
            status = Convert.ToString(cmd.ExecuteScalar());
            return status;
        } catch (Exception ex) {
            status = "Terdapat error : " + ex.Message + "";
        }finally {
            conn.Close();
        }

        return status;
    }
    //fungsi untuk update
    public string KelasKoneksi_CRUD(string SqlCmd)
    {
        String strconn = WebConfigurationManager.ConnectionStrings["KoneksiAdoNet"].ConnectionString;
        conn = new SqlConnection(strconn);
        string sql = SqlCmd;
        cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            //cmd.ExecuteScalar();
            cmd.ExecuteNonQuery();
            status = "1";
        }
        catch (SqlException sqlEx)
        {
            status = "Terjadi error Ketika Insert: " + sqlEx.Message;
        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }
        return status;
    }
    public string KelasKoneksi_Insert(string Nm, string pswd, string email, string tgl) {
        String strconn = WebConfigurationManager.ConnectionStrings["KoneksiAdoNet"].ConnectionString;
        conn = new SqlConnection(strconn);
        string sql = "insert into Ms_member values ('"+pswd+"', '"+Nm+"', '"+email+"', '"+tgl+ "',  1, 'Aktif')";
        cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            //cmd.ExecuteScalar();
            cmd.ExecuteNonQuery();
            status = "1";
        }
        catch (SqlException sqlEx)
        {
            status = "Terjadi error Ketika Insert: " + sqlEx.Message;
        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }

        return status;
    }
    //*************************************fungsi untuk login***************************************************************************************
    public bool KelasKoneksi_Login(string id, string pswd) {
        String strconn = WebConfigurationManager.ConnectionStrings["KoneksiAdoNet"].ConnectionString;
        conn = new SqlConnection(strconn);
        string sql = "Select Member_ID, Password_Member from Ms_Member where Member_ID = "+id+ " and Password_Member = '"+pswd+"'";
        cmd = new SqlCommand(sql, conn);
        //Menggunakan data reader untuk select dan mengambil value nya 
        try
        {
            conn.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                return true;
            }
            else
            {
                return false;
            }

        }
        catch (SqlException ex)
        {

            return false;

        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }



        
    }
    //Kelas Koneksi untuk insert Hak Akses
    public string KelasKoneksi_InsertHakAkses(int MemberID, int IdAkses) {
        conn = new SqlConnection(strconn);
        string sql = "insert into User_Akses values ("+MemberID+", "+IdAkses+")";
        cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            status = "OK";
        }
        catch (Exception ex)
        {
            status = ex.Message;
        }
        finally {
            cmd.Dispose();
            conn.Close();
        }
        return status;
    }
    //insert stock
    public string KelasKoneksi_InsertStock(int MemberID, string NamaBarang, string TglDatang, string Keterangan, string statub, int jml, string path)
    {
        conn = new SqlConnection(strconn);
        string sql = "insert into Stock values ("+MemberID+", '"+NamaBarang+"', '"+TglDatang+"', '"+Keterangan+"', '"+statub+"', "+jml+", '"+path+"')";
        cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            status = "OK";
        }
        catch (Exception ex)
        {
            status = ex.Message;
        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }
        return status;
    }
    //method return with data table 
    public DataSet getDataSet(string sql)
    {
        DataSet ds = new DataSet();
        String strconn = WebConfigurationManager.ConnectionStrings["KoneksiAdoNet"].ConnectionString;
        conn = new SqlConnection(strconn);
        SqlDataAdapter da = new SqlDataAdapter(sql, conn);
        try {
            conn.Open();
            da.Fill(ds);
        } catch (Exception ex) {
            ds = null;
        }
        finally {
            conn.Close();
            conn.Dispose();
            da.Dispose();
        }
        
        return ds;
    }
    //fungsi email 
    public string email_otomatis(string e, string pesan)
    {
        string hasil = "";
        //string subject = "Testing Email Notification"; ;
        //string body = pesan;

        //****WORKING CODE**************************************************************
        //SmtpClient client = new SmtpClient("smtp.gmail.com");
        //client.Port = 587;
        //client.DeliveryMethod = SmtpDeliveryMethod.Network;
        //client.UseDefaultCredentials = false;
        //try
        //{
        //    System.Net.NetworkCredential credentials =new System.Net.NetworkCredential("tandasanyu@gmail.com", "herlambang17");
        //    client.EnableSsl = true;
        //    client.Credentials = credentials;
        //    hasil = "OK";
        //}
        //catch (Exception ex)
        //{
        //    hasil = ex.Message;
        //}
        ////Creates a new message
        //try
        //{
        //    var mail = new MailMessage("tandasanyu@gmail.com", e);
        //    mail.Subject = subject;
        //    mail.IsBodyHtml = true;
        //    mail.Body = body;
        //    client.Send(mail);
        //}
        ////Failing to deliver the message or to authentication will throw an exception
        //catch (Exception ex)
        //{
        //    hasil = "Terdapat error Ketika Mengirim Email : " + ex.Message;
        //}
        //******
        //gather email from form textbox
        //string remail = e;//email staff

        //MailAddress from = new MailAddress("tandasanyu@gmail.com");
        //MailAddress to = new MailAddress(remail);
        //MailMessage message = new MailMessage(from, to);

        //message.Subject = "Yo! I'm an email!";

        //string note = "Hello ! ";
        //note += "I am an email sent from an ASP.NET Web Page! ";
        //note += "See you later! ";

        //message.Body = pesan;
        //message.BodyEncoding = System.Text.Encoding.UTF8;
        //message.IsBodyHtml = true;

        //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        //client.UseDefaultCredentials = false;
        //client.EnableSsl = true;
        //client.Credentials = new NetworkCredential("tandasanyu@gmail.com", "herlambang17");

        //try
        //{
        //    client.Send(message);
        //}
        //catch
        //{
        //    //error message?
        //}
        //finally
        //{

        //}
        //****
        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
        smtpClient.UseDefaultCredentials = false;
        smtpClient.EnableSsl = true;
        smtpClient.Credentials = new System.Net.NetworkCredential("tandasanyu@gmail.com", "herlambang17");
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

        MailMessage mailMessage = new MailMessage("Tandasanyu@gmail.com", e);
        mailMessage.Subject = "Test Email Notification";
        mailMessage.Body = pesan;
        mailMessage.IsBodyHtml = true;
        try
        {
            smtpClient.Send(mailMessage);
            hasil = "OK";
        }
        catch (Exception ex)
        {
            hasil = ex.ToString();
        }
        return hasil;
    }
}