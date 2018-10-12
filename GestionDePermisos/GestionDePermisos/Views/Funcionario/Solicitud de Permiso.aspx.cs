using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;
using GestionDePermisos.Models;

namespace GestionDePermisos.Views.Funcionario
{
    public partial class Solicitud_de_Permiso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["funcionario"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("../../Default.aspx");
            }
            if (!IsPostBack)
            {
                NegocioTipoPermiso negocioTipo = new NegocioTipoPermiso();
                NegocioMotivo negocioMotivo = new NegocioMotivo();
                cmbMotivo.Items.Add(new ListItem() { Value = "0", Text = "- Seleccione -" });
                cmbTipoPermiso.Items.Add(new ListItem() { Value = "0", Text = "- Seleccione -" });
                if (negocioTipo.listado() != null)
                {
                    
                    foreach (var tmp in negocioTipo.listado())
                    {
                        cmbTipoPermiso.Items.Add(new ListItem() { Value = tmp.idTipoPermiso.ToString(), Text = tmp.nombreTipoPermiso });
                    }                    
                }                
            }
        }

        protected void btnFinalizarPermiso_Click(object sender, EventArgs e)
        {
            Solicitud newSolicitud = new Solicitud();
            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
            NegocioCuenta negocioCuenta = new NegocioCuenta();
            string cuenta = Session["usuario"].ToString();

            newSolicitud.idSolicitud = negocioSolicitud.listado().Count + 1;
            newSolicitud.idTipoPermiso = Convert.ToInt32(cmbTipoPermiso.SelectedItem.Value);
            newSolicitud.descripcion = txtDetalleSolicitud.Text;
            newSolicitud.fechaSolicitud = DateTime.Today;
            newSolicitud.fechaInicio = DateTime.ParseExact(txtDate1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            newSolicitud.fechaTermino = DateTime.ParseExact(txtDate2.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            newSolicitud.idEstado = 4;
            newSolicitud.rutSolicitante = negocioEmpleado.retornarRutByCuentaID(negocioCuenta.retornarID(cuenta));

            if (negocioSolicitud.crearSolicitud(newSolicitud))
            {
                limpiarFormulario();
            }            
        }

        private void limpiarFormulario()
        {
            cmbTipoPermiso.SelectedIndex = 0;
            cmbMotivo.SelectedIndex = 0;
            txtDate1.Text = string.Empty;
            txtDate2.Text = string.Empty;
            txtDetalleSolicitud.Text = string.Empty;
        }

        protected void cmbTipoPermiso_SelectedIndexChanged(object sender, EventArgs e)
        {
            NegocioMotivo negocioMotivo = new NegocioMotivo();
            int var = cmbTipoPermiso.SelectedIndex;
            cmbMotivo.Items.Clear();
            foreach (var item in negocioMotivo.retornarListaFiltrada(var))
            {
                cmbMotivo.Items.Add(new ListItem() { Value = item.idMotivo.ToString(), Text = item.nombreMotivo });
            }
        }
    }
}