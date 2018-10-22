using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Models;
using GestionDePermisos.Business;
using System.Web.Security;

namespace GestionDePermisos.Views.Funcionario
{
    public partial class BuscarDocumentoFuncionario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["funcionario"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("../../Default.aspx");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Solicitud solicitud = new Solicitud();
            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            string codigo = txtCodigoDocumento.Text;
            if (!string.IsNullOrEmpty(codigo))
            {
                solicitud = negocioSolicitud.retornarSolicitudByCodigoDocumento(codigo);
            }            
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {

        }
    }
}