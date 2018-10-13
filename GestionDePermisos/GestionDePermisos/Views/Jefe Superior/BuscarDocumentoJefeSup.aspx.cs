using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;
using GestionDePermisos.Models;


namespace GestionDePermisos.Views.Jefe_Superior
{
    public partial class BuscarDocumentoJefeSup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                var rut = inputSuccess5.ToString();

                if (!IsPostBack)
                {
                    NegocioSolicitud negocioSolicitud = new NegocioSolicitud();

                    negocioSolicitud.listadoFiltradoByID(rut);

                }
                else
                {

                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}