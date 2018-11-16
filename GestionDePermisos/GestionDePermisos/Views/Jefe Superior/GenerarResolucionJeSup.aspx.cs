using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;

namespace GestionDePermisos.Views.Jefe_Superior
{
    public partial class GenerarResolucionJeSup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClientScript.GetPostBackEventReference(this, "");
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
                cmbMes.Items.Add(new ListItem { Value = "0", Text = "- Seleccione -" });
                cmbMes.Items.Add(new ListItem { Value = DateTime.Now.AddMonths(-1).ToString("MM"), Text = DateTime.Now.AddMonths(-1).ToString("MMMM", CultureInfo.CurrentUICulture) });
                int año = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
                cmbAño.Items.Add(new ListItem { Value = (año).ToString(), Text = (año).ToString() });
                int unidad = negocioDepartamento.retornarUnidadByDepartamento(negocioEmpleado.retornarDepartamentoByRut(negocioEmpleado.retornarRutByCuentaID(negocioCuenta.retornarID(user))));
                foreach (var item in negocioDepartamento.listado())
                {
                    if (item.idUnidad == unidad)
                    {
                        cmbUnidad.Items.Add(new ListItem { Value = item.idDepartamento.ToString(), Text = item.nombreDepartamento });
                    }
                }
            }

            if (Request["__EVENTTARGET"] == "limpiar")
            {
                limpiar();
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
                TableCell departamento = new TableCell();

                tablaEstadoPermisos.Rows.Add(tableRow);
                rut.Text = item.rut;
                tipoPermiso.Text = item.nombreTipoPermiso;
                dias.Text = item.cantidadPermisos.ToString();
                departamento.Text = item.departamento;

                tableRow.Cells.Add(departamento);
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
            
            this.containerTabla.Attributes.Add("hidden", "true");
            this.formularioResolucion.Attributes.Remove("hidden");
        }
    }
}