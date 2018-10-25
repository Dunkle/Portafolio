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
        {/*
            Solicitud solicitud = new Solicitud();
            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            string codigo = txtCodigoDocumento.Text;
            if (!string.IsNullOrEmpty(codigo))
            {
                solicitud = negocioSolicitud.retornarSolicitudByCodigoDocumento(codigo);
            }*/

            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            string codigo = txtCodigoDocumento.Text;

            if (negocioSolicitud.retornarSolicitudByCodigoDocumento(codigo) != null)
            {
                cargarTabla(codigo);
            }
            else
            {

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

            if (solicitud.rutAutorizante != null)
            {
                tdAutorizador.Visible = true;
            }
            string script = @"<script type='text/javascript'>
                       $(document).ready(function () {
                            $('#mostrarmodal').modal('show'); 
                        });
                  </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);

        }
        protected void btnLimpiar_Click(object sender, EventArgs e)
        {

        }
    }
}