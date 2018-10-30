using GestionDePermisos.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionDePermisos.Views.Alcalde
{
    public partial class ConsultarResolucionAlcalde : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NegocioUnidad negocioUnidad = new NegocioUnidad();
                cmbUnidad.Items.Add(new ListItem { Value = "0", Text = "- Seleccione -" });
                cmbAño.Items.Add(new ListItem { Value = "0", Text = "- Seleccione -" });
                foreach (var item in negocioUnidad.listado())
                {
                    cmbUnidad.Items.Add(new ListItem { Value = item.idUnidad.ToString(), Text = item.nombreUnidad });
                }
                for (int i = 0; i < 9; i++)
                {
                    int año = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
                    cmbAño.Items.Add(new ListItem { Value = (año - i).ToString(), Text = (año - i).ToString() });
                }
            }
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            int año = Convert.ToInt32(cmbAño.SelectedItem.Value);
            int mes = Convert.ToInt32(cmbMes.SelectedItem.Value);
            int unidad = Convert.ToInt32(cmbUnidad.SelectedItem.Value);
            string usuario = Session["usuario"].ToString();
            NegocioCuenta negocioCuenta = new NegocioCuenta();
            NegocioDepartamento negocioDepartamento = new NegocioDepartamento();
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();

            Reportes reportes = new Reportes();

            foreach (var item in reportes.generarResolucion(unidad, año, mes))
            {
                TableRow tableRow = new TableRow();
                TableCell rut = new TableCell();
                TableCell tipoPermiso = new TableCell();
                TableCell dias = new TableCell();

                tablaEstadoPermisos.Rows.Add(tableRow);
                rut.Text = item.rut;
                tipoPermiso.Text = item.nombreTipoPermiso;
                dias.Text = item.dias.ToString();

                tableRow.Cells.Add(rut);
                tableRow.Cells.Add(tipoPermiso);
                tableRow.Cells.Add(dias);
            }
            this.formularioResolucion.Attributes.Add("hidden", "true");
            this.containerTabla.Attributes.Remove("hidden");
        }
    }
}
}