using GestionDePermisos.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionDePermisos.Views.Alcalde
{
    public partial class ReporteTipoPermisoAlcalde : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["alcalde"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("../../Default.aspx");
            }
        }
        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            Reportes reportes = new Reportes();
            foreach (var item in reportes.reportePorTipoPermiso())
            {
                TableRow tableRow = new TableRow();                
                TableCell tipoPermiso = new TableCell();
                TableCell cantidad = new TableCell();

                tablaEstadoPermisos.Rows.Add(tableRow);                                
                tipoPermiso.Text = item.nombreTipoPermiso;
                cantidad.Text = item.cantidadPermisos.ToString();
                
                tableRow.Cells.Add(tipoPermiso);
                tableRow.Cells.Add(cantidad);
            }

            this.containerTabla.Attributes.Remove("hidden");
        }
    }
}