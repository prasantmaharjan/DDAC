using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DDAC.DataAccess
{
    
    public class GlobalConnection
    {
        public SqlConnection cn;
        public GlobalConnection()
        {
            string sqlconn = System.Configuration.ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;
            cn = new SqlConnection(sqlconn);
            cn.Open();
        }
    }
}