using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionDePermisos.Controllers
{
    public class Empleado
    {
        int rut { get; set; }
        string nombres {get;set;}
        string apellidoPaterno { get; set; }
        string apellidoMaterno { get; set; }
        DateTime fechaNacimiento { get; set; }
        string direccion { get; set; }

        int telefono { get; set; }
        string correo { get; set; }
        DateTime fechaContratacion { get; set; }
        int idEstado { get; set; }
        int idCargo { get; set; }
        int idComuna { get; set; }
        int idDepartamento { get; set; }
        int idCuenta { get; set; }
        int idTipoContrato { get; set; }


    }
}