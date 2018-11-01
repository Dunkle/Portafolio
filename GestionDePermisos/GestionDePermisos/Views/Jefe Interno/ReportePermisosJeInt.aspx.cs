using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionDePermisos.Views.Jefe_Interno
{
    public partial class ReportePermisosJeInt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["jefeInterno"] == null)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("../../Default.aspx");
                }
            }
        }
    }
}