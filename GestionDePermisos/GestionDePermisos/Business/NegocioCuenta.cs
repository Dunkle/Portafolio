using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioCuenta
    {        

        public bool comprobarCuenta(string user, string passw)
        {
            Cuenta cuenta = new Cuenta();
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
        public int retonarCargo(string user) {
            Cuenta cuenta = new Cuenta();
            cuenta.usuario = user;
            if (cuenta.read())
            {
                return cuenta.idPerfilCuenta;
            }
            else
            {
                return 0;
            }
            
        }
        public int retornarID(string user)
        {
            Cuenta cuenta = new Cuenta();
            cuenta.usuario = user;
            if (cuenta.read())
            {
                return cuenta.idCuenta;
            }
            else
            {
                return 0;
            }
        }
    }
}