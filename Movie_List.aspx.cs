using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Movie_Website
{
    public partial class Movie_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                BindRepeater();
            }

        }

        private void BindRepeater()
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-F91Q2BI\\SQLEXPRESS;Initial Catalog=Movies;Integrated Security=True");
            con.Open();
            string q = "select * from Movie  ORDER BY Id DESC";
            DataSet ds1 = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(q, con);
            da.Fill(ds1);

            rptData.DataSource = ds1;
            rptData.DataBind();
        }
        }
    
    }
