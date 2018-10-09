using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;
using GestionDePermisos.Views;

namespace GestionDePermisos
{
    public partial class Default : System.Web.UI.Page
    {
        string usuario;
        NegocioCuenta controladorLogin = new NegocioCuenta();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (comprobarConexion())
            {
                switch (controladorLogin.retonarCargo(usuario))
                {
                    case 1:
                        Session["funcionario"] = "funcionario";
                        Session["usuario"] = usuario;
                        Response.Redirect("Views/Funcionario/InicioFuncionario.aspx");
                        break;
                    case 2:
                        Session["jefeInterno"] = "jefeInterno";
                        Session["usuario"] = usuario;
                        Response.Redirect("Views/Jefe Interno/InicioJefeInterno.aspx");
                        break;
                    case 3:
                        Session["jefeSuperior"] = "jefeSuperior";
                        Session["usuario"] = usuario;
                        Response.Redirect("Views/Jefe Superior/InicioJefeSuperior.aspx");
                        break;
                    case 4:
                        Session["alcalde"] = "alcalde";
                        Session["usuario"] = usuario;
                        Response.Redirect("Views/Alcalde/InicioAlcalde.aspx");
                        break;
                    case 5:
                        Session["admin"] = "admin";
                        Session["usuario"] = usuario;
                        Response.Redirect("Views/Administrador/InicioAdmin.aspx");
                        break;
                    default:
                        break;
                }
            }
            else
            {
                this.errorSession.Attributes.Remove("hidden");
            }
        }
        private bool comprobarConexion()
        {
            usuario = txtUsuario.Text;
            string contraseña = txtContraseña.Text;
            if (controladorLogin.comprobarCuenta(usuario, contraseña))
            {
                return true;
            }
            else { return false; }
        }
    }
}