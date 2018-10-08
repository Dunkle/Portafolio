using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestionDePermisos.Models
{
    public class Solicitud
    {
        public int idSolicitud { set; get; }
        public String descripcion { set; get; }
        public DateTime fechaSolicitud { set; get; }
        public DateTime fechaInicio { set; get; }
        public DateTime fechaTermino { set; get; }
        public int idTipoPermiso { set; get; }
        public int rutSolicitante { set; get; }
        public int rutAutorizante { set; get; }
        public int idEstado { set; get; }

        public Solicitud()
        {
            idSolicitud = default(int);
            descripcion = string.Empty;
            fechaSolicitud = default(DateTime);
            fechaInicio = default(DateTime);
            fechaTermino = default(DateTime);
            idTipoPermiso = default(int);
            rutSolicitante = default(int);
            rutAutorizante = default(int);
            idEstado = default(int);
        }

    }
}