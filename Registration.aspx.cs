using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace Movie_Website
{
    public partial class Registration : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Password match validation
            if (TextBox3.Text != TextBox7.Text)
            {
                Label1.Text = "Passwords  not matched.";
                Label1.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validate the form
            if (Page.IsValid)
            {
                string name = TextBox1.Text;
                string age = TextBox5.Text;
                string gender = DropDownList1.SelectedValue;
                string email = TextBox6.Text;
                string city = TextBox2.Text;
                string password = TextBox3.Text;  // Store password as plain text
                string confirmPassword = TextBox7.Text;

                // Assuming you have a DAL method to insert data

                try
                {
                    Dal dal = new Dal();
                    int result = dal.InsertData(name, age, gender, email, city, password, confirmPassword);

                    if (result > 0)
                    {
                        // Send confirmation email
                        SendConfirmationEmail(email);

                        // Clear the form
                        ClearForm();

                        // Display success message
                        Label1.Visible = true;
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "Registration successful!";

                        // Redirect to another page
                        Response.Redirect("~/Article.aspx");
                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Registration failed! Please try again.";
                    }
                }
                catch (Exception ex)
                {
                    Label1.Visible = true;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Error: " + ex.Message;
                }
            }
        }


        // Method to send confirmation email
        private void SendConfirmationEmail(string recipientEmail)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("pl486845@gmail.com");
                mailMessage.To.Add(recipientEmail);
                mailMessage.Subject = "Registration Successful!";
                mailMessage.Body = $"Dear User,\n\nThank you for registering in Movies World. Your registration was successful!\n\nBest regards,\nYour Team";

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    EnableSsl = true,
                    Credentials = new NetworkCredential("pl486845@gmail.com", "eloqkfplxekxitda")
                };

                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                Label1.Visible = true;
                Label1.Text = "An error occurred while sending the confirmation email: " + ex.Message;
            }
        }

        // Method to clear form
        private void ClearForm()
        {
            TextBox1.Text = "";
            TextBox5.Text = "";
            DropDownList1.SelectedIndex = 0;
            TextBox6.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox7.Text = "";
        }
    }
}
