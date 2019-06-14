using DDAC.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDAC.View.Admin
{
    public partial class CompanyInfo : System.Web.UI.Page
    {
        GlobalConnection gc = new GlobalConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                companyinfo();
            }
        }

        protected void btnaddcompanyinfo_Click(object sender, EventArgs e)
        {
            try
            {
                string companyname = txtcname.Text;
                string companyemail = txtcemail.Text;
                string companycontactno = txtcompanycontactno.Text;
                
                string sql = "Insert into companyinfo(companyname, companyemail, companycontactno) values (@cname, @cemail, @ccontactno)";
                SqlCommand cmd = new SqlCommand(sql, gc.cn);
                cmd.Parameters.AddWithValue("@cname", companyname);
                cmd.Parameters.AddWithValue("@cemail", companyemail);
                cmd.Parameters.AddWithValue("@ccontactno", companycontactno);

                int i = cmd.ExecuteNonQuery();
                if (i == 1)
                {
                    Response.Write("<script>alert('Company Information is Add Successfully!!!')</script>");
                    companyinfo();
                }
                
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert('Error: \n '"+ex+"'')</script>");

                throw ex;
            }

        }


        protected void companyinfo()
        {
            string sql = "select * from companyinfo";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            gvcompanyinfo.DataSource = ds;
            gvcompanyinfo.DataBind();
        }

        protected void gvcompanyinfo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvcompanyinfo.EditIndex = e.NewEditIndex;
            companyinfo();
        }

        protected void gvcompanyinfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvcompanyinfo.EditIndex = -1;
            companyinfo();
        }

        protected void gvcompanyinfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox cid = (TextBox) gvcompanyinfo.Rows[e.RowIndex].FindControl("txtcompanyid");
            TextBox companyname = (TextBox) gvcompanyinfo.Rows[e.RowIndex].FindControl("txtcompanyname");
            TextBox companyemail = (TextBox)gvcompanyinfo.Rows[e.RowIndex].FindControl("txtcemail");
            TextBox companycontactno = (TextBox)gvcompanyinfo.Rows[e.RowIndex].FindControl("txtcontactno");

            int comid = Convert.ToInt32(cid.Text);
            string cname = companyname.Text;
            string cemail = companyemail.Text;
            string cno = companycontactno.Text;

            string sql = "update companyinfo set companyname=@cname, companyemail=@cemail, companycontactno=@cno where cinfoid=@comid ";
            SqlCommand cmd = new SqlCommand(sql, gc.cn);
            cmd.Parameters.AddWithValue("@cname", cname);
            cmd.Parameters.AddWithValue("@cemail", cemail);
            cmd.Parameters.AddWithValue("@cno", cno);
            cmd.Parameters.AddWithValue("@comid", comid);

            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                Response.Write("<script>alert('Company Information is Update Successfully!!!')</script>");
                gvcompanyinfo.EditIndex = -1;
                companyinfo();
            }
           
        }

        protected void gvcompanyinfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvcompanyinfo.Rows[e.RowIndex];
            Label lblcid =(Label) row.FindControl("lblcid");

            int comid = Convert.ToInt32(lblcid.Text);
            string sql = "Delete from companyinfo where cinfoid=@comid";
            SqlCommand cmd = new SqlCommand(sql, gc.cn);
            cmd.Parameters.AddWithValue("@comid", comid);
            int i = cmd.ExecuteNonQuery();

            if (i == 1)
            {
                Response.Write("<script>alert('Company Information is Delete Successfully!!!')</script>");
                companyinfo();
            }
        }

    }

}