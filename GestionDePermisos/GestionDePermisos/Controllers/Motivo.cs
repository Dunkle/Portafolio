using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionDePermisos.Controllers
{
    public class Motivo
    {
        public int idMotivo { get; set; }
        public string nombreMotivo { get; set; } 
        int idTipoPermiso { get; set; }
        public IList<Motivo> motivos { get; set; }

        public Motivo()
        {
            idMotivo = default(int);
            nombreMotivo = string.Empty;
            idTipoPermiso = default(int);
        }

        public bool readAll()
        {
            this.motivos = new List<Motivo>();
            try
            {
                foreach (var item in Conexion.entities.MOTIVO.ToList())
                {
                    this.idMotivo = Convert.ToInt32(item.IDMOTIVO);
                    this.nombreMotivo = item.NOMBREMOTIVO;
                    this.idTipoPermiso = Convert.ToInt32(item.IDTIPOPERMISO);
                }
                return true;
            }
            catch (Exception e)
            {

                return false;
            }           
        }
    }
}