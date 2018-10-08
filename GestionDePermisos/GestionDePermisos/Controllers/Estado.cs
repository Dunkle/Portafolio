using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;

namespace GestionDePermisos.Controllers
{
    public class Estado
    {
        public int idEstado { get; set; }
        public string nombreEstado { get; set; }
        public string tipo { get; set; }

        public Estado()
        {
            idEstado = default(int);
            nombreEstado = string.Empty;
            tipo = string.Empty;
        }

        public bool read()
        {
            try
            {
                ESTADO estado = Conexion.entities.ESTADO.First(f=>f.IDESTADO == this.idEstado);

                this.idEstado = Convert.ToInt32(estado.IDESTADO);
                this.nombreEstado = estado.NOMBREESTADO;
                this.tipo = estado.TIPO;

                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }
    }
}