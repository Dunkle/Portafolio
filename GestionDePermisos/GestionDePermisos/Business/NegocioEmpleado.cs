using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioEmpleado
    {
        public int retornarRutByCuentaID(int idCuenta) {
            Empleado empleado = new Empleado();
            empleado.readAll();
            empleado = empleado.empleados.First(f=> f.idCuenta == idCuenta);
            if (empleado != null)
            {
                return empleado.rut;
            }
            else
            {
                return 0;
            }
        }
    }
}