using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Website
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindGridView();
            }
        }


        private void BindGridView()
        {
            string connString = "Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True";
            string query = "SELECT * FROM Movie";  // Select all movies from the database

            using (SqlConnection cn = new SqlConnection(connString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, cn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {
                try
                {

                    string folderPath = Server.MapPath("~/Images/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string filePath = Path.Combine(folderPath, Path.GetFileName(FileUpload1.FileName));
                    FileUpload1.SaveAs(filePath);


                    string query = "INSERT INTO Movie (Image, Name, Link, Size) VALUES (@Image, @Name, @Link, @Size)";

                    using (SqlConnection cn = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True"))
                    {
                        cn.Open();

                        using (SqlCommand cmd = new SqlCommand(query, cn))
                        {

                            cmd.Parameters.AddWithValue("@Image", "~/Images/" + Path.GetFileName(FileUpload1.FileName)); // Store the relative path
                            cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
                            cmd.Parameters.AddWithValue("@Link", TextBox2.Text);
                            cmd.Parameters.AddWithValue("@Size", TextBox3.Text);


                            cmd.ExecuteNonQuery();
                        }
                    }


                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {

                    Label1.Text = "Error uploading file: " + ex.Message;
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Visible = true;
                }
            }
            else
            {

                Label1.Text = "Please select a file to upload.";
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Visible = true;
            }
        }



       


            

                   

        }




    }
