using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Models;
using GestionDePermisos.Business;
using System.Web.Security;
using System.Net;

namespace GestionDePermisos.Views.Funcionario
{
    public partial class BuscarDocumentoFuncionario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["funcionario"] == null)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("../../Default.aspx");
                }
            }


        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            string codigo = txtCodigoDocumento.Text;

            if (negocioSolicitud.retornarSolicitudByCodigoDocumento(codigo) != null)
            {
                cargarTabla(codigo);
            }
            else
            {
                string script = @"<script type='text/javascript'>
                       $(document).ready(function () {
                            $('#modalerror').modal('show');
                        });
                  </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);
                txtCodigoDocumento.Text = "";
            }
        }
        private void cargarTabla(string codigo)
        {

            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
            NegocioTipoPermiso tipo = new NegocioTipoPermiso();
            NegocioMotivo motivo = new NegocioMotivo();
            NegocioEstado estado = new NegocioEstado();

            Solicitud solicitud = new Solicitud();

            solicitud = negocioSolicitud.retornarSolicitudByCodigoDocumento(codigo);

            codSolicitud.Text = solicitud.codigoDocumento;
            rutSolicitante.Text = solicitud.rutSolicitante;
            nombreSolicitante.Text = negocioEmpleado.retornarNombreByRut(solicitud.rutSolicitante);
            fechaSolicitud.Text = solicitud.fechaSolicitud.ToShortDateString();
            tipoSolicitud.Text = tipo.nameByID(solicitud.idTipoPermiso);
            motivoSolicitud.Text = motivo.nameByID(solicitud.idMotivo);
            autorizadorSolicitud.Text = solicitud.rutAutorizante;
            estadoSolicitud.Text = estado.nameByID(solicitud.idEstado);
            if (solicitud.rutAutorizante == null || solicitud.rutAutorizante.ToString() == "")
            {
                tdAutorizador.Visible = false;
            }
            else
            {
                tdAutorizador.Visible = true;
            }

            
            string script = @"<script type='text/javascript'>
                       $(document).ready(function () {
                            $('#mostrarmodal').modal('show');
                        });
                  </script>";

            certSolicitante.Text = nombreSolicitante.Text;
            cetInicio.Text = solicitud.fechaInicio.ToShortDateString();
            certFin.Text = solicitud.fechaTermino.ToShortDateString();
            cetPermiso.Text = tipoSolicitud.Text;
            certMotivo.Text = motivoSolicitud.Text;
            certDias.Text = (solicitud.fechaTermino.Date - solicitud.fechaInicio.Date).TotalDays.ToString();

            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);
            txtCodigoDocumento.Text = "";

        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtCodigoDocumento.Text = "";
        }
    }
}