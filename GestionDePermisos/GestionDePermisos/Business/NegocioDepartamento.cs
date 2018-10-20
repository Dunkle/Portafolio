using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioDepartamento
    {
        public IList<Departamento> listado()
        {
            Departamento solicitud = new Departamento();
            IList<Departamento> lista = new List<Departamento>();
            if (solicitud.readAll())
            {
                foreach (var item in solicitud.departamentos)
                {
                    lista.Add(item);
                }
                return lista;
            }
            else { return null; }
        }
    }
}