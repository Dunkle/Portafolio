using GestionDePermisos.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionDePermisos.Views.Jefe_Superior
{
    public partial class ConsultaResolucionJeSup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["jefeSuperior"] == null)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("../../Default.aspx");
                }
                NegocioDepartamento negocioDepartamento = new NegocioDepartamento();
                NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
                NegocioCuenta negocioCuenta = new NegocioCuenta();
                NegocioUnidad negocioUnidad = new NegocioUnidad();
                string user = Session["usuario"].ToString();
                cmbUnidad.Items.Add(new ListItem { Value = "0", Text = "- Seleccione -" });
                cmbAño.Items.Add(new ListItem { Value = "0", Text = "- Seleccione -" });
                int unidad = negocioDepartamento.retornarUnidadByDepartamento(negocioEmpleado.retornarDepartamentoByRut(negocioEmpleado.retornarRutByCuentaID(negocioCuenta.retornarID(user))));
                foreach (var item in negocioUnidad.listado())
                {
                    if (item.idUnidad == unidad)
                    {
                        cmbUnidad.Items.Add(new ListItem { Value = item.idUnidad.ToString(), Text = item.nombreUnidad });
                    }
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
            if (validarCampos())
            {
                if (tablaEstadoPermisos.Rows.Count > 1)
                {
                    this.formularioResolucion.Attributes.Add("hidden", "true");
                    this.containerTabla.Attributes.Remove("hidden");
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                       $(document).ready(function () {
                            $('#modalerror').modal('show');
                        });
                  </script>";

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);
                    lblError.Text = "No se encontraron permisos autorizados para mes y año";
                    limpiar();
                }
            }
            else
            {
                string script = @"<script type='text/javascript'>
                       $(document).ready(function () {
                            $('#modalerror').modal('show');
                        });
                  </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);
                lblError.Text = "Debe seleccionar todos los campos";
                limpiar();
            }
        }

        private bool validarCampos()
        {
            if (cmbAño.SelectedIndex != 0 && cmbMes.SelectedIndex != 0 && cmbUnidad.SelectedIndex != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void limpiar()
        {
            cmbAño.SelectedIndex = 0;
            cmbMes.SelectedIndex = 0;
            cmbUnidad.SelectedIndex = 0;
        }
    }
}
