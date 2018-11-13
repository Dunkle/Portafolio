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
            controllerSolicitud.codigoDocumento = solicitud.codigoDocumento;
            controllerSolicitud.descripcion = solicitud.descripcion;
            controllerSolicitud.fechaInicio = solicitud.fechaInicio;
            controllerSolicitud.fechaSolicitud = solicitud.fechaSolicitud;
            controllerSolicitud.fechaTermino = solicitud.fechaTermino;
            controllerSolicitud.rutSolicitante = solicitud.rutSolicitante;
            controllerSolicitud.idEstado = solicitud.idEstado;
            controllerSolicitud.idTipoPermiso = solicitud.idTipoPermiso;
            controllerSolicitud.idMotivo = solicitud.idMotivo;
            if (controllerSolicitud.create())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool updateSolicitud(Solicitud solicitud)
        {
            ControllerSolicitud controllerSolicitud = new ControllerSolicitud();
            controllerSolicitud.readAll();
            controllerSolicitud = controllerSolicitud.coleccionSolicitudes.First(f=> f.codigoDocumento == solicitud.codigoDocumento);
            controllerSolicitud.idEstado = solicitud.idEstado;
            controllerSolicitud.rutAutorizante = solicitud.rutAutorizante;

            if (controllerSolicitud.update())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public IList<ControllerSolicitud> listadoFiltradoByID(string rut)
        {
            ControllerSolicitud solicitud = new ControllerSolicitud();
            IList<ControllerSolicitud> lista = new List<ControllerSolicitud>();
            if (solicitud.readAll())
            {
                foreach (var item in solicitud.coleccionSolicitudes)
                {
                    if (item.rutSolicitante == rut)
                    {
                        lista.Add(item);
                    }
                }
                return lista;
            }
            else { return null; }
        }
        public Solicitud retornarSolicitudByCodigoDocumento(string codigo)
        {
            ControllerSolicitud controllerSolicitud = new ControllerSolicitud();
            Solicitud solicitud = new Solicitud();
            controllerSolicitud.readAll();
            try
            {
                controllerSolicitud = controllerSolicitud.coleccionSolicitudes.First(f => f.codigoDocumento == codigo);
                solicitud.idSolicitud = controllerSolicitud.idSolicitud;
                solicitud.codigoDocumento = controllerSolicitud.codigoDocumento;
                solicitud.descripcion = controllerSolicitud.descripcion;
                solicitud.fechaSolicitud = controllerSolicitud.fechaSolicitud;
                solicitud.fechaInicio = controllerSolicitud.fechaInicio;
                solicitud.fechaTermino = controllerSolicitud.fechaTermino;
                solicitud.idTipoPermiso = controllerSolicitud.idTipoPermiso;
                solicitud.idEstado = controllerSolicitud.idEstado;
                solicitud.rutAutorizante = controllerSolicitud.rutAutorizante;
                solicitud.rutSolicitante = controllerSolicitud.rutSolicitante;
                solicitud.idMotivo = controllerSolicitud.idMotivo;

                return solicitud;
            }
            catch (Exception e)
            {

                return null;
            }

        }
        public IList<ControllerSolicitud> listadoFiltradoByEstado(int estado)
        {
            ControllerSolicitud solicitud = new ControllerSolicitud();
            IList<ControllerSolicitud> lista = new List<ControllerSolicitud>();
            if (solicitud.readAll())
            {
                foreach (var item in solicitud.coleccionSolicitudes)
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
