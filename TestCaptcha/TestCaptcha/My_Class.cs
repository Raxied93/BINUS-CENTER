using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//for sending an email
using System.Net;
using System.Net.Mail;

namespace TestCaptcha
{
    public class My_Class
    {
        public string Hasil;
        public string emailnotification(string receiver, string emailbody) {
            //gather email from form textbox
            string remail = receiver;

            MailAddress from = new MailAddress("tandasanyu.movie1@gmail.com");
            MailAddress to = new MailAddress(remail);
            MailMessage message = new MailMessage(from, to);

            message.Subject = "Testing Email Notification";

            message.Body = emailbody;
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.UseDefaultCredentials = false;
            client.EnableSsl = true;
            client.Credentials = new NetworkCredential("tandasanyu.movie1@gmail.com", "herlambang17");

            try
            {
                client.Send(message);
                Hasil = "OK";
            }
            catch (Exception ex)
            {
                Hasil = ex.Message;
            }
            finally
            {

            }
            return Hasil;
        }

    }
    public class StudentClass
    {
        public int No { get; set; }
        public string Name { get; set; }
        public string Degree { get; set; }
    }
}