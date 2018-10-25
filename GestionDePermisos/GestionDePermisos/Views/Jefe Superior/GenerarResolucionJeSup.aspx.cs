using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;

namespace GestionDePermisos.Views.Jefe_Superior
{
    public partial class GenerarResolucionJeSup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NegocioUnidad negocioUnidad = new NegocioUnidad();
                cmbUnidad.Items.Add(new ListItem { Value ="0", Text="- Seleccione -"});
                foreach (var item in negocioUnidad.listado())
                {
                    cmbUnidad.Items.Add(new ListItem { Value = item.idUnidad.ToString(), Text = item.nombreUnidad});
                }
            }
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            string date1 = fechaInicio.SelectedDate.ToString("yyyyMMdd");
            string date2 = fechaTermino.SelectedDate.ToString("yyyyMMdd");
            int unidad = Convert.ToInt32(cmbUnidad.SelectedValue);

        }
    }
}