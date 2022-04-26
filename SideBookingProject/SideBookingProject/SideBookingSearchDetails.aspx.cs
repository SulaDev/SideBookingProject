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
    public partial class BusBookingSearchDetails : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                    bindSearchDetails();
            }
        }

        private void bindSearchDetails()
        {
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Origin",Convert.ToString(Request.QueryString["Origin"]));
            sqlCmd.Parameters.AddWithValue("@TravelDate",Convert.ToString(Request.QueryString["TravelDate"]));
            sqlCmd.CommandText = "ispGetAvailableSideDetails";
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
            if(dsGetData.Tables[0].Rows.Count>0)
            {
                hlinkSearch.Visible = false;
                gvBusDetails.DataSource = dsGetData.Tables[0];
                gvBusDetails.DataBind();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Trip not available,Please search again with different date')", true);
                hlinkSearch.Visible = true;
            }
        }

        protected void gvBusDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow)
            {
                HiddenField hdnNewSideID = (HiddenField)e.Row.FindControl("hdnSideID");
                HiddenField hdnNewLineRow = (HiddenField)e.Row.FindControl("hdnLineRow");
                HiddenField hdnNewSeatCol = (HiddenField)e.Row.FindControl("hdnLineColumn");
                HyperLink hlnkSelect = (HyperLink)e.Row.FindControl("hplnkSelect");
                Label lblFare = (Label)e.Row.FindControl("lblFare");
                hlnkSelect.NavigateUrl="LineDetails.aspx?SideID=" + hdnNewSideID.Value + "&Row=" + hdnNewLineRow.Value + "&Column=" + hdnNewSeatCol.Value+
                    "&Origin=" + Request.QueryString["Origin"]+
                    "&TravelDate=" + Request.QueryString["TravelDate"]+"&Fare="+lblFare.Text;
            }
        }
    }
}