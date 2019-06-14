using DDAC.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDAC.View.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        GlobalConnection gc = new GlobalConnection();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Admin/Registration.aspx");
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string uname = txtusername.Text;
            string upass = txtpass.Text;

            string sql = "select * from Users";
            
            SqlCommand cmd = new SqlCommand(sql, gc.cn);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                if(sdr.GetString(5).Equals(uname) && sdr.GetString(6).Equals(upass))
                {
                    Response.Redirect("~/View/Customer/CustomerDashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('User Name or Password is not correct!!!')</script>");
                }            
            }
              
        }
    }
}