using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioTipoPermiso
    {
        TipoPermiso permiso = new TipoPermiso();

        public IList<TipoPermiso> listado()
        {
            IList <TipoPermiso> lista = new List<TipoPermiso>();
            if (permiso.readAll())
            {
                foreach (var item in permiso.coleccion)
                {
                    lista.Add(item);
                }
                return lista;
            }
            else { return null; }
        }
    }
}