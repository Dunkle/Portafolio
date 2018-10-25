using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioMotivo
    {

        public IList<Motivo> retornarLista()
        {
            Motivo motivo = new Motivo();
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
        public string nameByID(int id)
        {
            Motivo motivo = new Motivo();
            motivo.idMotivo = id;
            if (motivo.read())
            {
                return motivo.nombreMotivo;
            }
            else
            {
                return string.Empty;
            }
        }

        public IList<Motivo> retornarListaFiltrada(int index)
        {
            Motivo motivo = new Motivo();
            IList<Motivo> lista = new List<Motivo>();
            if (motivo.readAll())
            {
                foreach (var item in motivo.motivos)
                {
                    if (item.idTipoPermiso == index)
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



