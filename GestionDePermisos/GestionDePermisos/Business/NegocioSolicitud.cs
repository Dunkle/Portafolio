using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioSolicitud
    {
        public IList<Solicitud> listado()
        {
            Solicitud solicitud = new Solicitud();
            IList<Solicitud> lista = new List<Solicitud>();
            if (solicitud.readAll())
            {
                foreach (var item in solicitud.coleccionSolicitudes)
                {
                    lista.Add(item);
                }
                return lista;
            }
            else { return null; }
        }
        
    }
}