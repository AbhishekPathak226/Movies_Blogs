using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Website
{
    public partial class Article : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {

                if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("~/Images/");
                FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
                string p = "~/Images/" + FileUpload1.FileName;
                String q = "insert into Art values('" + p + "','" + TextBox1.Text + "','" + TextBox2.Text + "' ,'" + TextBox3.Text + "'  ,'" + TextBox4.Text + "')";


                SqlConnection con = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
                con.Open();
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();


                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                TextBox4.Text = string.Empty;
                FileUpload1.Attributes.Clear(); // Clear the uploaded file

                // Optionally, you can display a message or redirect the user
                Response.Write("<script>alert('Article submitted successfully!');</script>");
                }
                else
                {
                    // Optionally, you can handle cases where the form is invalid
                    Response.Write("<script>alert('Please fix the errors before submitting.');</script>");
                }

            }

        }
    }
} 