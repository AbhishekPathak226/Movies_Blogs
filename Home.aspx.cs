using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using System.Reflection.Emit;
using System.Security.Cryptography;
using System.Text;

namespace Movie_Website
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Correct code:
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
            con.Open();
            string loginQuery = "SELECT COUNT(*) FROM userdetails WHERE Email=@Email AND Password=@Password";
            SqlCommand cmd = new SqlCommand(loginQuery, con);

            
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

            int count = (int)cmd.ExecuteScalar();
            con.Close();

            if (count > 0)
            {
                
                Response.Redirect("Article.aspx");
            }
            else
            {

                Response.Write("<script>alert('Wrong Email OR Password');</script>");
                Response.Write("<script>alert('if you forget password then re-register');</script>");
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
        }
}
















 
