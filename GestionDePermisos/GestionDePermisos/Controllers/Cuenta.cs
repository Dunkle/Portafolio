using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;

namespace GestionDePermisos.Controllers
{
    public class Cuenta
    {
        public int idCuenta { get; set; }
        public string usuario { get; set; }
        public string contraseña { get; set; }
        public string fechaRegistro { get; set; }
        public int idPerfilCuenta { get; set; }
        public int idEstado { get; set; }

        public Cuenta()
        {
            idCuenta = default(int);
            usuario = string.Empty;
            contraseña = string.Empty;
            fechaRegistro = string.Empty;
            idPerfilCuenta = default(int);
            idEstado = default(int);
        }

        public bool read()
        {
            try
            {
                CUENTA cuenta = Conexion.entities.CUENTA.First(f => f.USUARIO == this.usuario);
                this.idCuenta = Convert.ToInt32(cuenta.IDCUENTA);
                this.usuario = cuenta.USUARIO;
                this.contraseña = cuenta.CONTRASEÑA;
                this.fechaRegistro = cuenta.FECHAREGISTRO.ToString();
                this.idPerfilCuenta = Convert.ToInt32(cuenta.IDPERFILCUENTA);
                this.idEstado = Convert.ToInt32(cuenta.IDESTADO);
                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }
    }
}