    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;

namespace GestionDePermisos.Controllers
{
    public class TipoPermiso
    {
        public int idTipoPermiso { get; set; }
        public string nombreTipoPermiso { get; set; }
        public int idEstado { get; set; }
        public IList<TipoPermiso> coleccion { get; set; }

        public TipoPermiso() {
            idTipoPermiso = default(int);
            nombreTipoPermiso = string.Empty;
            idEstado = default(int);
        }

        public bool readAll() {
            try
            {
                this.coleccion = new List<TipoPermiso>();
                foreach (var tmp in Conexion.entities.TIPOPERMISO.ToList())
                {
                    TipoPermiso tipoPermiso = new TipoPermiso();
                    tipoPermiso.idTipoPermiso = Convert.ToInt32(tmp.IDTIPOPERMISO);
                    tipoPermiso.nombreTipoPermiso = tmp.NOMBRETIPOPERMISO;
                    tipoPermiso.idEstado = Convert.ToInt32(tmp.IDESTADO);

                    this.coleccion.Add(tipoPermiso);
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
                TIPOPERMISO tipoPermiso = Conexion.entities.TIPOPERMISO.First(f=>f.IDTIPOPERMISO == this.idTipoPermiso);
                this.idTipoPermiso = Convert.ToInt32(tipoPermiso.IDTIPOPERMISO);
                this.nombreTipoPermiso = tipoPermiso.NOMBRETIPOPERMISO;
                this.idEstado = Convert.ToInt32(tipoPermiso.IDESTADO);

                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }
    }
}