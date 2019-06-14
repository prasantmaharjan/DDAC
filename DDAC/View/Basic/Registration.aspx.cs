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
    public partial class Registration : System.Web.UI.Page
    {
        GlobalConnection gc = new GlobalConnection(); 

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            string ufullname = txtname.Text;
            string uaddress = txtaddress.Text;
            string contactno = txtcontactno.Text;
            string uemail = txtemail.Text;
            string uname = txtuname.Text;
            string upass = txtpass.Text;

            try
            {
                string sql = "Insert into Users(ufullname,uaddress,contactno,uemail,uname,upass) values(@ufullname,@uaddress,@contactno,@uemail,@uname,@upass)";
                SqlCommand cmd = new SqlCommand(sql, gc.cn);
                cmd.Parameters.AddWithValue("@ufullname", ufullname);
                cmd.Parameters.AddWithValue("@uaddress", uaddress);
                cmd.Parameters.AddWithValue("@contactno", contactno);
                cmd.Parameters.AddWithValue("@uemail", uemail);
                cmd.Parameters.AddWithValue("@uname", uname);
                cmd.Parameters.AddWithValue("@upass", upass);

                int i = cmd.ExecuteNonQuery();
                if (i == 1)
                {
                    Response.Write("<script>alert('User Registration is Successfully!!!');</script>");
                    //Response.Redirect("~/View/Admin/Registration.aspx");
                }
                else {
                    Response.Write("<script>alert('User Registration isnot Successfully!!!');</script>");
                }

            }
            catch(Exception ex) {
                Response.Write("<script>alert('Error:\n"+ex+"');</script>");
            }
            
        }
   
    }
}