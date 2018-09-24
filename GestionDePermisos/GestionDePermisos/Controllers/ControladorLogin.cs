using System;
using System.Collections.Generic;
using Oracle.DataAccess.Client;
using System.Linq;
using System.Web;

namespace GestionDePermisos.Controllers
{
    public class ControladorLogin
    {
        Conexion c;
        OracleCommand cmd;
        string query = "";
        int flag;

        public bool comprobarUsuario(string user, string passw) {
            c = new Conexion();
            query = "select usuario,contraseña from Cuenta where usuario = '" +user+ "' and contraseña = '" + passw + "';";
            cmd = new OracleCommand(query, c.regresarConexion());
            flag = cmd.ExecuteNonQuery();
            c.cerrarConexion();

            if (flag == 1)
            {
                return true;
            }
            else {
                return false;
            }
        }
    }
}