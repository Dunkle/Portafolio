using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;

namespace GestionDePermisos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            comprobarConexion();
        }
        private void comprobarConexion()
        {
            string usuario = txtUsuario.Text;
            string contraseña = txtContraseña.Text;
            bool conectar;
            NegocioCuenta controladorLogin = new NegocioCuenta();
            conectar = controladorLogin.comprobarCuenta(usuario, contraseña);
            if (conectar)
            {
                Response.Redirect("Views/InicioFuncionario.aspx");
            }
            else {
                ShowPopUpMsg("Ingrese credenciales correctas");
                txtUsuario.Text = string.Empty;
                txtContraseña.Text = string.Empty;

            }
        }
        private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    }
}