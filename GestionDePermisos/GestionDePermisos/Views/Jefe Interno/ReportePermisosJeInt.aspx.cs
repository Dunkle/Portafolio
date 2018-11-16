using GestionDePermisos.Business;
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
        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            Reportes reportes = new Reportes();
            NegocioCuenta negocioCuenta = new NegocioCuenta();
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
            int id = negocioEmpleado.retornarDepartamentoByRut(negocioEmpleado.retornarRutByCuentaID(negocioCuenta.retornarID(Session["usuario"].ToString())));
            foreach (var item in reportes.reportePorTipoPermisoDeUnidadInterna(id))
            {
                TableRow tableRow = new TableRow();
                TableCell nombreUnidad = new TableCell();
                TableCell tipoPermiso = new TableCell();
                TableCell cantidad = new TableCell();
                tablaEstadoPermisos.Rows.Add(tableRow);
                nombreUnidad.Text = item.nombreUnidad;
                tipoPermiso.Text = item.nombreTipoPermiso;
                cantidad.Text = item.cantidadPermisos.ToString();

                tableRow.Cells.Add(nombreUnidad);
                tableRow.Cells.Add(tipoPermiso);
                tableRow.Cells.Add(cantidad);
            }

            this.containerTabla.Attributes.Remove("hidden");
        }
    }
}
