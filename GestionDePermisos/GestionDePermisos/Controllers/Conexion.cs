using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;

namespace GestionDePermisos.Controllers
{
    public class Conexion
    {
        private OracleConnection cn;

        public Conexion() {
            try
            {
                cn = new OracleConnection("Data Source=*; User Id=portafolio; Password=portafolio;");
                cn.Open();                
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public void cerrarConexion() {
            cn.Close();
        }

        public OracleConnection regresarConexion() {
            return cn;
        }
    }
}