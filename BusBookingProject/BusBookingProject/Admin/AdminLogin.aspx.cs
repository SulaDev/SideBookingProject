using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(txtUserId.Text=="admin" && txtPassword.Text=="admin")
            {
                Session["UserName"] = "Admin";
                Response.Redirect("SideDetailsReport.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Логин или пароль некорректный. Введите правильные данные')", true); 
            }
        }
    }
}