using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioCuenta
    {
        Cuenta cuenta = new Cuenta();

        public bool comprobarCuenta(string user, string passw)
        {
            cuenta.usuario = user;
            cuenta.read();

            if (user.Equals(cuenta.usuario) && !string.IsNullOrEmpty(cuenta.usuario))
            {
                if (passw.Equals(cuenta.contraseña) && !string.IsNullOrEmpty(cuenta.contraseña))
                {
                    return true;
                }
                else { return false; }
            }
            else { return false; }
        }
        public int retonarCargo() {
            return cuenta.idPerfilCuenta;
        }
    }
}