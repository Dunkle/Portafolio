using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;

namespace GestionDePermisos.Views.Funcionario
{
    public partial class EstadoPermisosFuncionario : System.Web.UI.Page
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
                else
                {
                    NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
                    NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
                    NegocioCuenta negocioCuenta = new NegocioCuenta();

                    string usuario = Session["usuario"].ToString();
                    string rut = negocioEmpleado.retornarRutByCuentaID(negocioCuenta.retornarID(usuario));

                    if (negocioSolicitud.listadoFiltradoByID(rut).Count > 0)
                    {
                        cargarListado(rut);
                        containerTabla.Attributes.Remove("hidden");
                    }
                    else
                    {
                        cargarDialogo();
                    }
                }
            }

        }

        private string retornarEstado(int id)
        {
            NegocioEstado negocioEstado = new NegocioEstado();
            return negocioEstado.nameByID(id);
        }

        private string retornarTipoPermiso(int id)
        {
            NegocioTipoPermiso negocioTipoPermiso = new NegocioTipoPermiso();
            return negocioTipoPermiso.nameByID(id);
        }
        private void cargarListado(string rut)
        {
            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            NegocioCuenta negocioCuenta = new NegocioCuenta();
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();           

            foreach (var item in negocioSolicitud.listadoFiltradoByID(rut))
            {
                TableRow tableRow = new TableRow();
                TableCell codigoDocumento = new TableCell();
                TableCell descripcion = new TableCell();
                TableCell fechaSolicitud = new TableCell();
                TableCell fechaInicio = new TableCell();
                TableCell fechaTermino = new TableCell();
                TableCell tipoPermiso = new TableCell();
                TableCell rutAutorizador = new TableCell();
                TableCell rutSolicitante = new TableCell();
                TableCell estado = new TableCell();
                TableCell motivo = new TableCell();
                TableCell nombre = new TableCell();
                tablaEstadoPermisos.Rows.Add(tableRow);
                codigoDocumento.Text = item.codigoDocumento;
                descripcion.Text = item.descripcion;
                fechaSolicitud.Text = item.fechaSolicitud.ToString("dd/MM/yyyy");
                fechaInicio.Text = item.fechaInicio.ToString("dd/MM/yyyy");
                fechaTermino.Text = item.fechaTermino.ToString("dd/MM/yyyy");
                tipoPermiso.Text = retornarTipoPermiso(item.idTipoPermiso);
                rutSolicitante.Text = item.rutSolicitante.ToString();
                if (item.rutAutorizante == null)
                {
                    rutAutorizador.Text = "Sin asignar";
                }
                else
                {
                    rutAutorizador.Text = item.rutAutorizante.ToString();
                }
                estado.Text = retornarEstado(item.idEstado);
                motivo.Text = retornarMotivo(item.idMotivo);
                nombre.Text = retornarNombreByRut(item.rutSolicitante);
                nombre.Attributes.Add("hidden", "true");
                tableRow.ID = item.idSolicitud.ToString();
                tableRow.Attributes.Add("onClick", "modalTabla(this.id)");

                tableRow.Cells.Add(codigoDocumento);
                tableRow.Cells.Add(descripcion);
                tableRow.Cells.Add(fechaSolicitud);
                tableRow.Cells.Add(fechaInicio);
                tableRow.Cells.Add(fechaTermino);
                tableRow.Cells.Add(tipoPermiso);
                tableRow.Cells.Add(motivo);
                tableRow.Cells.Add(rutSolicitante);
                tableRow.Cells.Add(rutAutorizador);
                tableRow.Cells.Add(estado);
                tableRow.Cells.Add(nombre);
            }
        }
        private void cargarDialogo()
        {
            this.errorBuscaSolicitud.Attributes.Remove("hidden");
        }
        private string retornarMotivo(int id)
        {
            NegocioMotivo negocio = new NegocioMotivo();
            return negocio.nameByID(id);
        }
        private string retornarNombreByRut(string rut)
        {
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
            return negocioEmpleado.retornarNombreByRut(rut);
        }
    }
}