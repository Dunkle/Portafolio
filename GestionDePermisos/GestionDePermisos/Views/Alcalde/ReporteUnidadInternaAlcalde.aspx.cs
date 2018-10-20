using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;

namespace GestionDePermisos.Views.Alcalde
{
    public partial class ReporteUnidadInternaAlcalde : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            Reportes reportes = new Reportes();
            foreach (var item in reportes.reporteDelAlcalde())
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