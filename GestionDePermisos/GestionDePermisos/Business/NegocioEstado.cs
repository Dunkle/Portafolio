using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;

namespace GestionDePermisos.Business
{
    public class NegocioEstado
    {
        public string nameByID(int id)
        {
            Estado estado = new Estado();
            estado.idEstado = id;
            if (estado.read())
            {
                return estado.nombreEstado;
            }
            else
            {
                return string.Empty;
            }
        }
    }
}