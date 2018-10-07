using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;

namespace GestionDePermisos.Views.Funcionario
{
    public partial class Solicitud_de_Permiso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["funcionario"] == null)
            //{
            //    FormsAuthentication.SignOut();
            //    Response.Redirect("../../Default.aspx");
            //}
            if (!IsPostBack)
            {
                NegocioTipoPermiso negocioTipo = new NegocioTipoPermiso();
                NegocioMotivo negocioMotivo = new NegocioMotivo();
                if (negocioTipo.listado().Count > 0)
                {
                    foreach (var tmp in negocioTipo.listado())
                    {
                        cmbTipoPermiso.Items.Add(new ListItem() { Value = tmp.idTipoPermiso.ToString(), Text = tmp.nombreTipoPermiso });
                    }
                    foreach (var item in negocioMotivo.retornarLista())
                    {
                        cmbMotivo.Items.Add(new ListItem() { Value = item.idMotivo.ToString(), Text = item.nombreMotivo });
                    }
                }
            }
        }

        protected void btnFinalizarPermiso_Click(object sender, EventArgs e)
        {

        }
    }
}