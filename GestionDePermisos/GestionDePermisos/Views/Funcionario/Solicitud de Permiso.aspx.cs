using System;
using System.Globalization;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;
using GestionDePermisos.Models;
using GestionDePermisos.Utils;



namespace GestionDePermisos.Views.Funcionario
{
    public partial class Solicitud_de_Permiso : System.Web.UI.Page
    {
        string script;
        string validaTexto;
        protected void Page_Load(object sender, EventArgs e)
        {
            script = @"<script type='text/javascript'>
                       $(document).ready(function () {
                            $('#mostrarmodal').modal('show'); 
                        });
                  </script>";
            //validaTexto = @"<script type='text/javascript'>
            //           $(document).ready(function () {
                            
            //            var $texo = document.getElementById('<%=txtDetalleSolicitud.ClientID%>');
            //            if($('#<%=txtDetalleSolicitud.ClientID%>').val().length > 5){
            //                $('#paso1').removeAttr('disabled');
            //             }
            //            });
            //      </script>";
            //ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", validaTexto, false);
            //
            if (!IsPostBack)
            {
                ConsumirWS ws = new ConsumirWS();
                NegocioCuenta negocioCuenta = new NegocioCuenta();
                NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
                var rut = negocioEmpleado.retornarRutByCuentaID(negocioCuenta.retornarID(Session["usuario"].ToString()));
                var parts = rut.Split('-');
                cantDias.InnerText = ws.cantidadDias(parts[0] + parts[1]).ToString();
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
                if (Session["funcionario"] == null)
                {
                    FormsAuthentication.SignOut();
                    Response.Redirect("../../Default.aspx");
                }
            }
            else
            {

                if (txtCod.Text == "")
                {
                    //ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);
                    txtCod.Text = "null";
                }

                if (txtCod.Text != "" || txtCod.Text != "null")
                {
                    txtCod.Text = string.Empty;
                }

                if (txtCod.Text == "null")
                {
                    if (txtCod.Text != "" || txtCod.Text != "null")
                    {
                        txtCod.Text = string.Empty;
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

            var codigo = string.Concat(DateTime.Now.ToString("yyyyMMdd"), newSolicitud.idSolicitud);


            newSolicitud.codigoDocumento = string.Concat(DateTime.Now.ToString("yyyyMMdd"), newSolicitud.idSolicitud);
            newSolicitud.idTipoPermiso = Convert.ToInt32(cmbTipoPermiso.SelectedItem.Value);
            newSolicitud.descripcion = txtDetalleSolicitud.Text;
            newSolicitud.fechaSolicitud = DateTime.Today;
            newSolicitud.fechaInicio = Convert.ToDateTime(txtDate1.Text, CultureInfo.InvariantCulture);
            newSolicitud.fechaTermino = Convert.ToDateTime(txtDate2.Text, CultureInfo.InvariantCulture);
            newSolicitud.idEstado = 4;
            newSolicitud.rutAutorizante = "";
            newSolicitud.rutSolicitante = negocioEmpleado.retornarRutByCuentaID(negocioCuenta.retornarID(cuenta));
            newSolicitud.idMotivo = Convert.ToInt32(cmbMotivo.SelectedItem.Value);

            if (negocioSolicitud.crearSolicitud(newSolicitud))
            {
                limpiarFormulario();
            }

            txtCod.Text = codigo;
            envioCorre(newSolicitud);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, false);
        }

        private void limpiarFormulario()
        {
            cmbTipoPermiso.SelectedIndex = 0;
            cmbMotivo.Items.Clear();
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
        private string encriptar(string txt_plano)
        {
            System.Security.Cryptography.HashAlgorithm obj_hash = new System.Security.Cryptography.SHA1CryptoServiceProvider();
            // Convertir el string original a un array de Bytes
            byte[] cadena_plana = System.Text.Encoding.UTF8.GetBytes(txt_plano);
            byte[] cadena_encrp = obj_hash.ComputeHash(cadena_plana);
            obj_hash.Clear();
            return (Convert.ToBase64String(cadena_encrp));
        }
        private string retornarRutAutorizador()
        {
            string rut = string.Empty;
            string usuario = Session["usuario"].ToString();
            NegocioCuenta negocioCuenta = new NegocioCuenta();
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
            rut = negocioEmpleado.retornarRutByCuentaID(negocioCuenta.retornarID(usuario));
            return rut;
        }
        private int retornarDepartamento(string rut)
        {
            int departamento = default(int);
            NegocioEmpleado negocioEmpleado = new NegocioEmpleado();
            departamento = negocioEmpleado.retornarDepartamentoByRut(rut);
            return departamento;
        }

        private void envioCorre(Solicitud solicitud)
        {
            Correo correo = new Correo();
            NegocioEmpleado empleado = new NegocioEmpleado();
            var empleadoSolicitud = empleado.retornarEmpleado(solicitud.rutSolicitante);

            var correoDest = empleadoSolicitud.correo;
            correo.asunto = "Solicitud numero: " + solicitud.codigoDocumento;
            var correoCuer = "Sr./Sra. " + empleadoSolicitud.nombres + " " + empleadoSolicitud.apellidoPaterno + " " + empleadoSolicitud.apellidoMaterno + "\n" +
                "\n" +
                "Se le comunica que con fecha: "+ solicitud.fechaSolicitud + ", su solicitud de permiso fue curzada con el numero de solicitud: " + solicitud.codigoDocumento + "\n" +
                "\n" +
                "Saludos. -" + "\n" +
                "Atte." + "\n"+
                "Ilustre Municipalidad de Vista Hermosa";
            
            correo.destinatario = correoDest;
            correo.cuerpo = correoCuer;

            correo.EnviarCorreo();
        }
    }
}