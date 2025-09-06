using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Movie_Website
{
    public class Bal
    {
        string im, nm, ln, sz;


        public string Im { get => im; set => im = value; }
        public string Nm { get => nm; set => nm = value; }
        public string Ln { get => ln; set => ln = value; }
        public string Sz { get => sz; set => sz = value; }

        public int Addd()
        {

            Dal obj = new Dal();

            return obj.Insert_Data(im, nm, ln, sz);
        }
        public DataSet Get_Data()
        {
            Dal obj = new Dal();
            DataSet ds = obj.Getdata_by_ID();
            return ds;
        }
    }








    public class userdata
    {

        string nm, age, gen, em, ct, pass, cpass;

        public string Nm { get => nm; set => nm = value; }
        public string Age { get => age; set => age = value; }
        public string Gen { get => gen; set => gen = value; }
        public string Em { get => em; set => em = value; }

        public string Ct { get => ct; set => ct = value; }

        public string Pass { get => pass; set => pass = value; }

        public string Cpass { get => cpass; set => cpass = value; }



        public int user()
        {
            Dal ud = new Dal();

            return ud.InsertData(nm, age, em, gen, ct, pass, cpass);

        }
        public DataSet userGet()
        {
            Dal ud = new Dal();
            DataSet ds = ud.GetData();
            return ds;
        }




    }



    public class opinion
    {

        string im, nm, ag, dt, ct;
        public string Im { get => im; set => im = value; }
        
        public string Nm { get => nm; set => nm = value; }
        public string Ag { get => ag; set => ag = value; }
        public string Dt { get => dt; set => dt = value; }
        public string Ct { get => ct; set => ct = value; }

        public int Add()
        {
            Dal dal = new Dal();
            return dal.insertdata(im, nm, ag, dt, ct);
        }

        public DataSet Get_data()
        {
            Dal dal = new Dal();
            DataSet ds = dal.Get_data();
            return ds;
        }


    }

    }










