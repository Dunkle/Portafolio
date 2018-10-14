using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioUnidad
    {
        public IList<Unidad> listado()
        {
            Unidad unidad = new Unidad();
            IList<Unidad> lista = new List<Unidad>();

            if (unidad.readAll())
            {
                foreach (var item in unidad.unidades)
                {
                    lista.Add(item);
                }
                return lista;
            }
            else { return null; }
        }

        public IList<Unidad> listadoByEstado(int estado)
        {
            Unidad unidad = new Unidad();
            IList<Unidad> lista = new List<Unidad>();
            if (unidad.readAll())
            {
                foreach (var item in unidad.unidades)
                {
                    if (item.idEstado == estado)
                    {
                        lista.Add(item);
                    }                    
                }
                return lista;
            }
            else { return null; }
        }
    }
}