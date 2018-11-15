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
        public DateTime fechaRegistro { get; set; }
        public int idPerfilCuenta { get; set; }
        public int idEstado { get; set; }
        public IList<Cuenta> coleccionCuentas { get; set; }

        public Cuenta()
        {
            idCuenta = default(int);
            usuario = string.Empty;
            contraseña = string.Empty;
            fechaRegistro = default(DateTime);
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
                this.fechaRegistro = Convert.ToDateTime(cuenta.FECHAREGISTRO.ToString());
                this.idPerfilCuenta = Convert.ToInt32(cuenta.IDPERFILCUENTA);
                this.idEstado = Convert.ToInt32(cuenta.IDESTADO);
                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }

        public bool readAll()
        {
            try
            {
                this.coleccionCuentas = new List<Cuenta>();

                foreach (var tmp in Conexion.entities.CUENTA.ToList())
                {
                    Cuenta cuenta = new Cuenta();

                    cuenta.idCuenta = Convert.ToInt32(tmp.IDCUENTA);
                    cuenta.usuario = tmp.USUARIO;
                    cuenta.contraseña = tmp.CONTRASEÑA;
                    cuenta.fechaRegistro = Convert.ToDateTime(tmp.FECHAREGISTRO);
                    cuenta.idPerfilCuenta = Convert.ToInt32(tmp.IDPERFILCUENTA);
                    cuenta.idEstado = Convert.ToInt32(tmp.IDESTADO);
                    
                    this.coleccionCuentas.Add(cuenta);
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}