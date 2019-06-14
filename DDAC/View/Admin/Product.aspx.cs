using DDAC.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDAC.View.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        GlobalConnection gc = new GlobalConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldropdownlist();
                productinfotbl();
            }
        }

        protected void btnaddproduct_Click(object sender, EventArgs e)
        {
            try
            {
                string pname = txtpname.Text;
                string pprice = txtrate.Text;
                int comid = Convert.ToInt32(ddlcompanyinfo.SelectedValue);

                //add image path and in system folder
                string str = btnfileup.FileName;
                btnfileup.PostedFile.SaveAs(Server.MapPath("~/ProductImages/" + str));
                string pimgpath = "~/ProductImages/" + str.ToString() ;
                string pdesc = tapdesc.Value;


                string sql = "Insert into infoofproduct(cinfoid, productname, productprice, productimgpath, productdesc) values (@comid, @pname, @proprice, @pimgpath, @pdesc)";
                SqlCommand cmd = new SqlCommand(sql, gc.cn);
                cmd.Parameters.AddWithValue("@comid", comid);
                cmd.Parameters.AddWithValue("@pname", pname);
                cmd.Parameters.AddWithValue("@proprice", pprice);
                cmd.Parameters.AddWithValue("@pimgpath", pimgpath);
                cmd.Parameters.AddWithValue("@pdesc", pdesc);

                int i = cmd.ExecuteNonQuery();
                if (i == 1)
                {
                    Response.Write("<script>alert('Product Information is Add Successfully!!!')</script>");
                    productinfotbl();
                }
            }
            catch (Exception ex) {
                Response.Write("<script>alert('Error: \n '"+ex+"'')</script>");

                //throw ex;
            }
            
        }
               
        public void productinfotbl()
        {
            string sql = "Select p.pid, p.productname, p.productprice, p.productimgpath, p.productdesc, c.companyname, c.cinfoid from infoofproduct p inner join companyinfo c on p.cinfoid=c.cinfoid";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);

            DataSet ds1 = new DataSet();
            sda.Fill(ds1);

            gvproductinfo.DataSource = ds1;
            
            gvproductinfo.DataBind();
        }

        // edit event
        protected void gvpinfo_RowEditing(Object sender, GridViewEditEventArgs e)
        {
            gvproductinfo.EditIndex = e.NewEditIndex;            
            productinfotbl();
        }

        // cancel event
        protected void gvpinfo_RowCancelingEdit(Object sender, GridViewCancelEditEventArgs e)
        {
            gvproductinfo.EditIndex = -1;
            productinfotbl();
        }

        // data populate in drop down after clicking edit
        protected void grproinfo_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            string sql = "Select * from companyinfo";
            SqlCommand cmd = new SqlCommand(sql, gc.cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DropDownList ddl = (DropDownList)e.Row.FindControl("ddlcompanyid");
            if (gvproductinfo.EditIndex == e.Row.RowIndex && e.Row.RowType==DataControlRowType.DataRow) {
                //ddl.DataTextField = ds.Tables[0].Columns["companyname"].ToString(); // textfieldname of tble displayed in dropdown
                //ddl.DataValueField = ds.Tables[0].Columns["cinfoid"].ToString(); // to retrive specific textfield name
                //ddl.DataSource = ds.Tables[0]; // assigning datasource to the dropdownlist
                //ddl.DataBind();

                ddl.DataSource = ds;
                ddl.DataValueField = "cinfoid";
                ddl.DataTextField = "companyname";
                ddl.DataBind();
            }
            
        }

        // update event
        public void gvproinfo_RowUpdating(Object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow) gvproductinfo.Rows[e.RowIndex];
            Label lblproid = (Label)row.FindControl("pid");
            //Label lbldelimg = (Label)row.FindControl("lblimgpath");
            DropDownList ddlcomid = (DropDownList) gvproductinfo.Rows[e.RowIndex].FindControl("ddlcompanyid");
            TextBox txtproname = (TextBox) gvproductinfo.Rows[e.RowIndex].FindControl("txtproname");
            TextBox txtprorate = (TextBox)gvproductinfo.Rows[e.RowIndex].FindControl("txtprorate");
            FileUpload FileUpload1 = (FileUpload)gvproductinfo.Rows[e.RowIndex].FindControl("FileUpload1");
            //SqlConnection sc = new SqlConnection(gc.cn);
            string path = "~/ProductImages/";
            if (FileUpload1.HasFile)
            {
                path += FileUpload1.FileName;
                //save image in folder    
                FileUpload1.SaveAs(MapPath(path));
            }
            else
            {
                // use previous user image if new image is not changed    
                Image img = (Image)gvproductinfo.Rows[e.RowIndex].FindControl("img_user");
                path = img.ImageUrl;
            }

            TextBox txtprodesc = (TextBox)gvproductinfo.Rows[e.RowIndex].FindControl("txtprodesc");

            int pid = Convert.ToInt32(lblproid.Text);
            int comid = Convert.ToInt32(ddlcomid.Text);
            string proname = txtproname.Text;
            string prorate = txtprorate.Text;
            string prodesc = txtprodesc.Text;

            string sql = "update infoofproduct set cinfoid=@comid, productname=@proname, productprice=@prorate, productimgpath=@path, productdesc=@prodesc where pid=@pid";
            SqlCommand cmd = new SqlCommand(sql, gc.cn);
            cmd.Parameters.AddWithValue("@comid", comid);
            cmd.Parameters.AddWithValue("@proname", proname);
            cmd.Parameters.AddWithValue("@prorate", prorate);
            cmd.Parameters.AddWithValue("@path", path);
            cmd.Parameters.AddWithValue("@prodesc", prodesc);
            cmd.Parameters.AddWithValue("@pid", pid);

            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                Response.Write("<script>alert('Product Information is Update Successfully!!!')</script>");
                gvproductinfo.EditIndex = -1;
                //ImageDeleteFromFolder(lbldelimg.Text);
                productinfotbl();
            }

        }

       
        // populate dropdownlist
        public void filldropdownlist()
        {
            string sql = "Select * from companyinfo";
            SqlCommand cmd = new SqlCommand(sql, gc.cn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ddlcompanyinfo.DataTextField = ds.Tables[0].Columns["companyname"].ToString(); // textfieldname of tble displayed in dropdown
            ddlcompanyinfo.DataValueField = ds.Tables[0].Columns["cinfoid"].ToString(); // to retrive specific textfield name

            ddlcompanyinfo.DataSource = ds.Tables[0]; // assigning datasource to the dropdownlist
            ddlcompanyinfo.DataBind(); // binding dropdownlist
        }

        protected void gvproductinfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvproductinfo.Rows[e.RowIndex];
            Label lblproid = (Label)row.FindControl("pid");
            int proid = Convert.ToInt32(lblproid.Text);
            Label lbldelimg = (Label) row.FindControl("lblimgpath");
            string sql = "Delete from infoofproduct where pid=@pid";
            SqlCommand cmd = new SqlCommand(sql, gc.cn);
            cmd.Parameters.AddWithValue("@pid", proid);
            int i = cmd.ExecuteNonQuery();
            if (i == 1)
            {
                Response.Write("<script>alert('Product Information is Delete Successfully!!!')</script>");
                ImageDeleteFromFolder(lbldelimg.Text);
                productinfotbl();
            }
        }

        protected void ImageDeleteFromFolder(string imagename)
        {
            string file_name = imagename;
            string path = Server.MapPath(@imagename);
            FileInfo file = new FileInfo(path);
            if (file.Exists) //check file exsit or not  
            {
                file.Delete();
            }
        }
    }
}