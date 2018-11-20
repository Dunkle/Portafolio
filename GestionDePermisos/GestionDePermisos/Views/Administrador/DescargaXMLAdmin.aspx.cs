using GestionDePermisos.Business;
using GestionDePermisos.Controllers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Security;
using System.Xml.Linq;

namespace GestionDePermisos.Views.Administrador
{
    public partial class DescargaXMLAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("../../Default.aspx");
                }
            }
        }

        protected void btnGenerarXML_Click(object sender, EventArgs e)
        {
            NegocioSolicitud negocioSolicitud = new NegocioSolicitud();

            XElement root = new XElement("Permiso");


            var filename = "Permisos.xml";
            var currentDirectory = @"C:\Users\Sebastian Salinas\Documents";
            //File.Create(currentDirectory + filename);
            var purchaseOrderFilepath = Path.Combine(currentDirectory, filename);

            XElement collection = new XElement(root);
            foreach (var item in negocioSolicitud.listado())
            {
                var parts = item.rutSolicitante.Split('-');
                
                var dias = (item.fechaTermino - item.fechaInicio).Days;
                XElement permiso =
                    new XElement("Permiso",
                        new XElement("Funcionario",
                            new XElement("Nombre", retornarNombreByRut(item.rutSolicitante)),
                            new XElement("Run", parts[0]),
                            new XElement("Dvrun", parts[1])
                            ),
                        new XElement("Detalle",
                            new XElement("Fecha_inicio", item.fechaInicio),
                            new XElement("Fecha_fin", item.fechaTermino),
                            new XElement("Fecha_fin", dias),
                            new XElement("Fecha_fin", retornaNombreMotivo(item.idTipoPermiso))
                        )
                    );

                collection.Add(permiso);
                
            }
            collection.Add();
            collection.Save(purchaseOrderFilepath);
        }
        private string retornarNombreByRut(string rut)
        {
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
            return negocioEmpleado.retornarNombreByRut(rut);
        }
        private string retornaNombreMotivo(int id)
        {
            NegocioMotivo negocioMotivo = new NegocioMotivo();
            return negocioMotivo.nameByID(id);
        }
    }
}