using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using GestionDePermisos.Business;

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
                switch (controladorLogin.retonarCargo())
                {
                    case 1:
                        Session["funcionario"] = "funcionario";
                        //FormsAuthentication.RedirectFromLoginPage("funcionario", false);
                        Response.Redirect("Views/Funcionario/InicioFuncionario.aspx");
                        break;
                    case 2:
                        Session["jefeInterno"] = "jefeInterno";
                        //FormsAuthentication.RedirectFromLoginPage("funcionario", false);
                        Response.Redirect("Views/Jefe Interno/InicioJefeInterno.aspx");
                        break;
                    case 3:
                        Session["jefeSuperior"] = "jefeSuperior";
                        //FormsAuthentication.RedirectFromLoginPage("funcionario", false);
                        Response.Redirect("Views/Jefe Superior/InicioJefeSuperior.aspx");
                        break;
                    case 4:
                        Session["alcalde"] = "alcalde";
                        //FormsAuthentication.RedirectFromLoginPage("funcionario", false);
                        Response.Redirect("Views/Alcalde/InicioAlcalde.aspx");
                        break;
                    case 5:
                        //Session["funcionario"] = "funcionario";
                        //FormsAuthentication.RedirectFromLoginPage("funcionario", false);
                        //Response.Redirect("Views/Funcionario/InicioFuncionario.aspx");
                        break;
                    default:
                        break;
                }                
            }
            else
            {
                ShowPopUpMsg("Ingrese credenciales correctas");
                txtUsuario.Text = string.Empty;
                txtContraseña.Text = string.Empty;

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