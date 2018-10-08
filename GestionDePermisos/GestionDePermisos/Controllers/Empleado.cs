using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;


namespace GestionDePermisos.Controllers
{
    public class Empleado
    {
        public int rut { get; set; }
        public string nombres { get; set; }
        public string apellidoPaterno { get; set; }
        public string apellidoMaterno { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string direccion { get; set; }
        public int telefono { get; set; }
        public string correo { get; set; }
        public DateTime fechaContratacion { get; set; }
        public int idEstado { get; set; }
        public int idCargo { get; set; }
        public int idComuna { get; set; }
        public int idDepartamento { get; set; }
        public int idCuenta { get; set; }
        public int idTipoContrato { get; set; }

        public Empleado()
        {
            rut = default(int);
            nombres = string.Empty;
            apellidoMaterno = string.Empty;
            apellidoPaterno = string.Empty;
            fechaNacimiento = default(DateTime);
            direccion = string.Empty;
            telefono = default(int);
            correo = string.Empty;
            fechaContratacion = default(DateTime);
            idEstado = default(int);
            idCargo = default(int);
            idComuna = default(int);
            idDepartamento = default(int);
            idCuenta = default(int);
            idTipoContrato = default(int);
        }

        public bool read()
        {            

            try
            {
                EMPLEADO empleado = Conexion.entities.EMPLEADO.First(f => f.IDCUENTA == this.idCuenta);

                this.rut = Convert.ToInt32(empleado.RUT);
                this.nombres = empleado.NOMBRES;
                this.apellidoMaterno = empleado.APELLIDOMATERNO;
                this.apellidoPaterno = empleado.APELLIDOPATERNO;
                this.fechaNacimiento = Convert.ToDateTime(empleado.FECHANACIMIENTO);
                this.direccion = empleado.DIRECCION;
                this.telefono = Convert.ToInt32(empleado.TELEFONO);
                this.correo = empleado.CORREO;
                this.fechaContratacion = Convert.ToDateTime(empleado.FECHACONTRATACION);
                this.idEstado = Convert.ToInt32(empleado.IDESTADO);
                this.idCargo = Convert.ToInt32(empleado.IDCARGO);
                this.idComuna = Convert.ToInt32(empleado.IDCOMUNA);
                this.idDepartamento = Convert.ToInt32(empleado.IDDEPARTAMENTO);
                this.idCuenta = Convert.ToInt32(empleado.IDCUENTA);
                this.idTipoContrato = Convert.ToInt32(empleado.TIPOCONTRATO);

                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }

    }
}