using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;

namespace GestionDePermisos.Controllers
{
    public class Unidad
    {
        public int idUnidad { get; set; }
        public string nombreUnidad { get; set; }
        public int idMunicipalidad { get; set; }
        public int idEstado { get; set; }
        public IList<Unidad> unidades { get; set; }

        public Unidad()
        {
            idUnidad = default(int);
            nombreUnidad = string.Empty;
            idMunicipalidad = default(int);
            idEstado = default(int);
        }

        public bool readAll()
        {
            try
            {
                this.unidades = new List<Unidad>();
                foreach (var tmp in Conexion.entities.UNIDAD.ToList())
                {
                    Unidad unidad = new Unidad();
                    unidad.idUnidad = Convert.ToInt32(tmp.IDUNIDAD);
                    unidad.nombreUnidad = tmp.NOMBREUNIDAD;
                    unidad.idMunicipalidad = Convert.ToInt32(tmp.IDMUNICIPALIDAD);                    
                    this.unidades.Add(unidad);
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