using GestionDePermisos.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionDePermisos.Views.Alcalde
{
    public partial class EstadoPermisosAlcalde : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();
            string rut = txtCodSolicitud.Text;
            if (negocioSolicitud.listadoFiltradoByID(rut) != null && negocioSolicitud.listadoFiltradoByID(rut).Count > 0)
            {
                error.Attributes.Add("hidden", "true");
                cargarTabla(rut);
            }
            else
            {
                error.Attributes.Remove("hidden");
            }
        }
        private void cargarTabla(string rut)
        {

            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();


            foreach (var item in negocioSolicitud.listadoFiltradoByID(rut))
            {
                TableRow tableRow = new TableRow();
                TableCell idSolicitud = new TableCell();
                TableCell codigoDocumento = new TableCell();
                TableCell descripcion = new TableCell();
                TableCell fechaSolicitud = new TableCell();
                TableCell fechaInicio = new TableCell();
                TableCell fechaTermino = new TableCell();
                TableCell tipoPermiso = new TableCell();
                TableCell rutAutorizador = new TableCell();
                TableCell rutSolicitante = new TableCell();
                TableCell estado = new TableCell();
                tablaEstadoPermisos.Rows.Add(tableRow);
                idSolicitud.Text = item.idSolicitud.ToString();
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

                tableRow.Cells.Add(idSolicitud);
                tableRow.Cells.Add(codigoDocumento);
                tableRow.Cells.Add(descripcion);
                tableRow.Cells.Add(fechaSolicitud);
                tableRow.Cells.Add(fechaInicio);
                tableRow.Cells.Add(fechaTermino);
                tableRow.Cells.Add(tipoPermiso);
                tableRow.Cells.Add(rutSolicitante);
                tableRow.Cells.Add(rutAutorizador);
                tableRow.Cells.Add(estado);
            }

            this.containerTabla.Attributes.Remove("hidden");
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtCodSolicitud.Text = string.Empty;
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
        private void cargarMensaje()
        {
            error.Attributes.Remove("hidden");
        }
    }
}