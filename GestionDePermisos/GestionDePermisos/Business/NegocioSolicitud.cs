using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;
using GestionDePermisos.Models;

namespace GestionDePermisos.Business
{
    public class NegocioSolicitud
    {
        public IList<ControllerSolicitud> listado()
        {
            ControllerSolicitud solicitud = new ControllerSolicitud();
            IList<ControllerSolicitud> lista = new List<ControllerSolicitud>();
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
        public bool crearSolicitud(Solicitud solicitud)
        {
            ControllerSolicitud controllerSolicitud = new ControllerSolicitud();
            controllerSolicitud.idSolicitud = solicitud.idSolicitud;
            controllerSolicitud.descripcion = solicitud.descripcion;
            controllerSolicitud.fechaInicio = solicitud.fechaInicio;
            controllerSolicitud.fechaSolicitud = solicitud.fechaSolicitud;
            controllerSolicitud.fechaTermino = solicitud.fechaTermino;
            controllerSolicitud.rutSolicitante = solicitud.rutSolicitante;
            controllerSolicitud.idEstado = solicitud.idEstado;
            controllerSolicitud.idTipoPermiso = solicitud.idTipoPermiso;
            if (controllerSolicitud.create())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}