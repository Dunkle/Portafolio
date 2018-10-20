using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionDePermisos.Models
{
    public class ReporteAlcalde
    {
        public string nombreUnidad { get; set; }
        public string nombreTipoPermiso { get; set; }
        public int cantidadPermisos { get; set; }
    }
}