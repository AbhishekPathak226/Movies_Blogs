using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Movie_Website
{
    public class Dal
    {



        public int Insert_Data(string im, string nm, string ln, string sz)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Get_Data", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("Image", im);
            cmd.Parameters.AddWithValue("@Name", nm);
            cmd.Parameters.AddWithValue("@Link", ln);
            cmd.Parameters.AddWithValue("@Size", sz);

            return cmd.ExecuteNonQuery();



        }

        public DataSet Getdata_by_ID()
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
            con.Open();
            SqlDataAdapter sd = new SqlDataAdapter("Set_Data", con);
            DataSet ds = new DataSet();
            sd.Fill(ds);

            return ds;

        }





        public int InsertData(string nm, string age, string gen, string em, string ct, string pass, string cpass)
        {


          SqlConnection con = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("user_get", con);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.AddWithValue("@Name", nm);
            cmd.Parameters.AddWithValue("@Age", age);

            cmd.Parameters.AddWithValue("@Gender", gen);
            cmd.Parameters.AddWithValue("@Email", em);
            cmd.Parameters.AddWithValue("@City", ct);
            cmd.Parameters.AddWithValue("@Password", pass);
            cmd.Parameters.AddWithValue("@ConfirmPassword", cpass);
            return cmd.ExecuteNonQuery();
        }
       

public DataSet GetData()
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("user_set", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            return ds;

        }








        public int insertdata(string im, string nm, string ag, string dt, string ct)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Art_Get", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Image", im);
            cmd.Parameters.AddWithValue("@Name", nm);
            cmd.Parameters.AddWithValue("@Age", ag);
            cmd.Parameters.AddWithValue("@Date", dt);
            cmd.Parameters.AddWithValue("@Content", ct);
            return cmd.ExecuteNonQuery();
        }

        public DataSet Get_data()
        {
            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Art_Set", conn);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            return ds;
        }

    }
}
