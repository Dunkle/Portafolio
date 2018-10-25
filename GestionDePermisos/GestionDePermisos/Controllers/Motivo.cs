using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;

namespace GestionDePermisos.Controllers
{
    public class Motivo
    {
        public int idMotivo { get; set; }
        public string nombreMotivo { get; set; }
        public string descripcion { get; set; }
        public int idTipoPermiso { get; set; }
        public IList<Motivo> motivos { get; set; }

        public Motivo()
        {
            idMotivo = default(int);
            nombreMotivo = string.Empty;
            descripcion = string.Empty;
            idTipoPermiso = default(int);
        }

        public bool readAll()
        {
            this.motivos = new List<Motivo>();
            try
            {
                foreach (var item in Conexion.entities.MOTIVO.ToList())
                {
                    Motivo motivo = new Motivo();
                    motivo.idMotivo = Convert.ToInt32(item.IDMOTIVO);
                    motivo.nombreMotivo = item.NOMBREMOTIVO;
                    motivo.descripcion = item.DESCRIPCION;
                    motivo.idTipoPermiso = Convert.ToInt32(item.IDTIPOPERMISO);

                    this.motivos.Add(motivo);
                }
                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }

        public bool read()
        {
            try
            {
                MOTIVO tipoPermiso = Conexion.entities.MOTIVO.First(f => f.IDMOTIVO == this.idMotivo);
                this.idMotivo = Convert.ToInt32(tipoPermiso.IDTIPOPERMISO);
                this.nombreMotivo = tipoPermiso.NOMBREMOTIVO;

                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }
    }
}


