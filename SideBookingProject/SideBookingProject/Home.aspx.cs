using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject
{
    public partial class Home : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindOriginCity();
            }
        }

        private void bindOriginCity()
        {
            DataSet dsOrigin = getCity();
            if(dsOrigin.Tables[0].Rows.Count>0)
            {
                ddlOrigin.DataSource = dsOrigin.Tables[0];
                ddlOrigin.DataTextField = "SideName";
                ddlOrigin.DataValueField = "SideName";
                ddlOrigin.DataBind();
            }
            ddlOrigin.Items.Insert(0, new ListItem("-Выберите компанию--","0"));
        }

    

        private DataSet getCity()
        {
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "ispGetCompany";
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
            return dsGetData;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("SideBookingSearchDetails.aspx?Origin="+ddlOrigin.SelectedItem.Text+"&TravelDate="+txtDate.Text);
        }
    }
}