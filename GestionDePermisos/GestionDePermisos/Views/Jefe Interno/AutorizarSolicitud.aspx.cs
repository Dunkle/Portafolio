using GestionDePermisos.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionDePermisos.Views.Jefe_Interno
{
    public partial class AutorizarSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["JefeInterno"] == null)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("../../Default.aspx");
                }
                else
                {
                    NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
                    NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
                    NegocioCuenta negocioCuenta = new NegocioCuenta();

                    
                    
                        cargarListado();
                        containerTabla.Attributes.Remove("hidden");
                    
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
        private void cargarListado()
        {
            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            NegocioCuenta negocioCuenta = new NegocioCuenta();
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();

            foreach (var item in negocioSolicitud.listado())
            {
                TableRow tableRow = new TableRow();
                TableCell codigoDocumento = new TableCell();
                TableCell descripcion = new TableCell();
                TableCell fechaSolicitud = new TableCell();
                TableCell fechaInicio = new TableCell();
                TableCell fechaTermino = new TableCell();
                TableCell tipoPermiso = new TableCell();
                TableCell Motivo = new TableCell();
                TableCell rutSolicitante = new TableCell();
                TableCell estado = new TableCell();
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
                    Motivo.Text = "Sin asignar";
                }
                else
                {
                    Motivo.Text = item.rutAutorizante.ToString();
                }
                estado.Text = retornarEstado(item.idEstado);
                
                tableRow.Cells.Add(codigoDocumento);
                tableRow.Cells.Add(descripcion);
                tableRow.Cells.Add(fechaSolicitud);
                tableRow.Cells.Add(fechaInicio);
                tableRow.Cells.Add(fechaTermino);
                tableRow.Cells.Add(tipoPermiso);
                tableRow.Cells.Add(rutSolicitante);
                tableRow.Cells.Add(Motivo);
                tableRow.Cells.Add(estado);

            }
        }
        private void cargarDialogo()
        {
           
        }
    }
}