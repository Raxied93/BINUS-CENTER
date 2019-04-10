using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
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
}