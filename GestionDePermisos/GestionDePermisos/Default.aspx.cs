using GestionDePermisos.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        private void comprobarConexion() {
            string usuario = txtUsuario.Text;
            string contraseña = txtContraseña.Text;
            bool conectar;
            ControladorLogin controladorLogin = new ControladorLogin();
            conectar = controladorLogin.comprobarUsuario(usuario, contraseña);
            if (conectar)
            {
                Server.Transfer("inicio.aspx", true);
            }
        }
    }
}