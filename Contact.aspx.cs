using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text.RegularExpressions;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {

            MailAddress messageFrom = new MailAddress(
                senderEmail.Text.ToLower().Trim()
                , senderEmail.Text);
            string messageSubject = "Words from " + firstName.Text + " " + lastName.Text;
            string messageBody = message.Text;
            MailMessage emailMessage = new MailMessage();
            string messageTo = "holbenr@dunwoody.edu";
            //string messageTo = "bensnotstallman@gmail.com";
            MailAddress address = new MailAddress(messageTo);
            emailMessage.To.Add(address);
            emailMessage.Subject = messageSubject;
            emailMessage.Body = messageBody;

            SmtpClient mailClient = new SmtpClient();
            mailClient.UseDefaultCredentials = true;
            mailClient.Send(emailMessage);

            contactUs.Visible = false;
            sentEmail.Visible = true;
            sentEmail.Text = "<p>The following message was sent successfully </p>";
          }



        
    }//end 
  
}
