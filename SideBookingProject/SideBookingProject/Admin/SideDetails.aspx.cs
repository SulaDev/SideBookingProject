using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject.Admin
{
    public partial class BusDetails : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["UserName"]!=null)
                {
                    if(Request.QueryString["SideID"]!=null)
                    {
                        int SideID = Convert.ToInt32(Request.QueryString["SideID"]);
                        FillData(SideID);
                        btnSave.Text = "Обновить";
                    }
                    else
                    {
                        btnSave.Text="Добавить";
                    }
                }
                else
                {
                    Response.Redirect("AdminLogin.aspx");
                }
            }
        }

        private int UpdateData()
        {
            int ResultCout = 0;
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@SideID", Convert.ToInt32(Request.QueryString["SideID"]));
            sqlCmd.Parameters.AddWithValue("@SideNo", Convert.ToString(txtBusNo.Text));
            sqlCmd.Parameters.AddWithValue("@SideName", Convert.ToString(txtSideName.Text));
            sqlCmd.Parameters.AddWithValue("@SideType", Convert.ToString(ddlBusType.SelectedItem.Text));
            sqlCmd.Parameters.AddWithValue("@LineColumn", Convert.ToInt32(txtLineColumn.Text));
            sqlCmd.Parameters.AddWithValue("@LineRow", Convert.ToInt32(txtLineRows.Text));
            sqlCmd.Parameters.AddWithValue("@Origin", Convert.ToString(txtOrigin.Text));
     
            sqlCmd.CommandText = "ispUpdateSideData";
            sqlCmd.Connection = connString;
            ResultCout = sqlCmd.ExecuteNonQuery(); ;
            return ResultCout;
        }
        private void FillData(int SideID)
        {
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@SideID", SideID);
            sqlCmd.CommandText = "ispGetSideDataByBusID";
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
            if(dsGetData.Tables[0].Rows.Count>0)
            {
                txtSideName.Text = Convert.ToString(dsGetData.Tables[0].Rows[0]["SideName"]);
                txtBusNo.Text = Convert.ToString(dsGetData.Tables[0].Rows[0]["SideNo"]);
                ddlBusType.SelectedItem.Text = Convert.ToString(dsGetData.Tables[0].Rows[0]["SideType"]);
                txtLineRows.Text = Convert.ToString(dsGetData.Tables[0].Rows[0]["LineRow"]);
                txtLineColumn.Text = Convert.ToString(dsGetData.Tables[0].Rows[0]["LineColumn"]);
                txtOrigin.Text = Convert.ToString(dsGetData.Tables[0].Rows[0]["Origin"]);
            }
        }
        private int AddBusDetails()
        {
            int ResultCout = 0;
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@SideNo", Convert.ToString(txtBusNo.Text));
            sqlCmd.Parameters.AddWithValue("@SideName", Convert.ToString(txtSideName.Text));
            sqlCmd.Parameters.AddWithValue("@SideType", Convert.ToString(ddlBusType.SelectedItem.Text));
            sqlCmd.Parameters.AddWithValue("@LineColumn", Convert.ToInt32(txtLineColumn.Text));
            sqlCmd.Parameters.AddWithValue("@LineRow", Convert.ToInt32(txtLineRows.Text));
            sqlCmd.Parameters.AddWithValue("@Origin", Convert.ToString(txtOrigin.Text));
            
            sqlCmd.CommandText = "ispAddSideDetails";
            sqlCmd.Connection = connString;
            ResultCout = sqlCmd.ExecuteNonQuery(); ;
            return ResultCout;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
           if(btnSave.Text=="Добавить")
           {
               int result = AddBusDetails();
               if (result == -1)
               {
                   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bus Details has been added successfully')", true);
              
                   ddlBusType.SelectedValue = "0";
                   txtOrigin.Text = "";
                   txtBusNo.Text = "";
                   txtLineColumn.Text = "";
                   txtLineRows.Text = "";
                   txtSideName.Text = "";
               }
               else
               {
                   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error occur please contact your system administrator')", true);
               }
           }
           else
           {
               int result = UpdateData();
               if (result == -1)
               {
                   Response.Redirect("SideDetailsReport.aspx");
                   //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bus Details has been Updated successfully')", true);
               }
               else
               {
                   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updation Failed please contact your system administrator')", true);
               }
           }
            
          
        }
    }
}