using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioMotivo
    {
        Motivo motivo = new Motivo();
        public IList<Motivo> listado()
        {
            IList<Motivo> lista = new List<Motivo>();
            if (motivo.readAll())
            {
                foreach (var item in motivo.motivos)
                {
                    lista.Add(item);
                }
                return lista;
            }
            else { return null; }
        }
    }
}