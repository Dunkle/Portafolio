using GestionDePermisos.Business;
using GestionDePermisos.Controllers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
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

            try
            {
                string Username = System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString();
                var profile = Username.Split('\\');
                var filename = "Permisos.xml";
                var currentDirectory = @"C:\Users\" + profile[1] + "\\Downloads";
                var purchaseOrderFilepath = Path.Combine(currentDirectory, filename);

                string internalSubset = @"MENSAJE SYSTEM 'define_permiso.dtd'";
                XDocument xDoc = new XDocument(
                    new XDeclaration("1.0", "utf-8", null),
                    new XDocumentType("Permisos", null, null, internalSubset));
                XElement xEle = new XElement("Permisos");
                xDoc.Add(xEle);
                foreach (var item in negocioSolicitud.listado())
                {
                    var parts = item.rutSolicitante.Split('-');
                    var dias = (item.fechaTermino - item.fechaInicio).Days;

                    XElement permiso = new XElement("Permiso",
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
                    xEle.Add(permiso);
                }
                xDoc.Save(purchaseOrderFilepath);

                string script = @"<script type='text/javascript'>
                       $(document).ready(function () {
                            $('#mostrarmodal').modal('show');
                        });
                  </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);
                txtCod.Text = "Ruta descarga " + purchaseOrderFilepath;
            }
            catch(Exception ex)
            {
                string script = @"<script type='text/javascript'>
                       $(document).ready(function () {
                            $('#modalerror').modal('show');
                        });
                  </script>";


                lblError.Text = "Se ha producido un error. Cosulte con el administrador del sistema "+ex;

                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);
            }

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