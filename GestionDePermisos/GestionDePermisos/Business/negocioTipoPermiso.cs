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

        public IList<TipoPermiso> listado()
        {
            TipoPermiso permiso = new TipoPermiso();
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

        public string nameByID(int id)
        {
            TipoPermiso tipoPermiso = new TipoPermiso();
            tipoPermiso.idTipoPermiso = id;
            if (tipoPermiso.read())
            {
                return tipoPermiso.nombreTipoPermiso;
            }
            else
            {
                return string.Empty;
            }
        }
    }    
}