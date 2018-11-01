using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionDePermisos
{
    public partial class MaFuncionario : System.Web.UI.MasterPage
    {                
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] != null)
                {
                    lblFuncionario.Text = Session["usuario"].ToString();
                }
                if (Session["funcionario"] == null)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("../../Default.aspx");
                }
            }
        }        
    }
}