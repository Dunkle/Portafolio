using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Controllers;
using GestionDePermisos.Models;

namespace GestionDePermisos.Business
{
    public class Reportes
    {
        IList<Unidad> unidades { get; set; }
        IList<ControllerSolicitud> solicitudes { get; set; }
        IList<Departamento> departamentos { get; set; }
        IList<Empleado> empleados { get; set; }
        IList<TipoPermiso> listTipoPermiso { get; set; }

        public IList<Reporte> reporteCantidadTipoPermisoUnidad()
        {
            IList<Reporte> reportes = new List<Reporte>();
            unidades = new NegocioUnidad().listado();
            solicitudes = new NegocioSolicitud().listado();
            departamentos = new NegocioDepartamento().listado();
            empleados = new NegocioEmpleado().listado();
            listTipoPermiso = new NegocioTipoPermiso().listado();

            var query = from s in solicitudes
                        join t in listTipoPermiso
                        on s.idTipoPermiso equals t.idTipoPermiso
                        join e in empleados
                        on s.rutSolicitante equals e.rut
                        join d in departamentos
                        on e.idDepartamento equals d.idDepartamento                        
                        group s by new { d.nombreDepartamento, t.nombreTipoPermiso} into r
                        select new
                        {
                            unidad = r.Key.nombreDepartamento,
                            tipoPermiso = r.Key.nombreTipoPermiso,
                            cantidad = r.Count(c => c.idSolicitud != null)
                        };
            foreach (var item in query)
            {
                Reporte nuevo = new Reporte();
                nuevo.nombreUnidad = item.unidad;
                nuevo.nombreTipoPermiso = item.tipoPermiso;
                nuevo.cantidadPermisos = item.cantidad;

                reportes.Add(nuevo);
            }

            return reportes;

        }

        public IList<Reporte> reportePorTipoPermiso()
        {
            IList<Reporte> reportes = new List<Reporte>();
            unidades = new NegocioUnidad().listado();
            solicitudes = new NegocioSolicitud().listado();
            departamentos = new NegocioDepartamento().listado();
            empleados = new NegocioEmpleado().listado();
            listTipoPermiso = new NegocioTipoPermiso().listado();

            var query = from s in solicitudes
                        join t in listTipoPermiso
                        on s.idTipoPermiso equals t.idTipoPermiso                        
                        group s by new { t.nombreTipoPermiso } into r
                        select new
                        {                            
                            tipoPermiso = r.Key.nombreTipoPermiso,
                            cantidad = r.Count(c => c.idSolicitud != null)
                        };
            foreach (var item in query)
            {
                Reporte nuevo = new Reporte();
                nuevo.nombreUnidad = string.Empty;
                nuevo.nombreTipoPermiso = item.tipoPermiso;
                nuevo.cantidadPermisos = item.cantidad;

                reportes.Add(nuevo);
            }

            return reportes;
        }

        public IList<Resolucion> generarResolucion(int unidad, int año, int mes)
        {
            IList<Resolucion> reportes = new List<Resolucion>();            
            solicitudes = new NegocioSolicitud().listado();
            departamentos = new NegocioDepartamento().listado();
            empleados = new NegocioEmpleado().listado();
            listTipoPermiso = new NegocioTipoPermiso().listado();

            var query = from s in solicitudes
                        join t in listTipoPermiso
                        on s.idTipoPermiso equals t.idTipoPermiso
                        join e in empleados
                        on s.rutSolicitante equals e.rut
                        join d in departamentos
                        on e.idDepartamento equals d.idDepartamento
                        where d.idUnidad == unidad && s.idEstado == 3 && s.fechaSolicitud.Year == año && s.fechaSolicitud.Month == mes
                        group s by new { e.rut, t.nombreTipoPermiso, d.nombreDepartamento, s.fechaInicio, s.fechaTermino } into r
                        select new
                        {
                            rut = r.Key.rut,
                            nombrePermiso = r.Key.nombreTipoPermiso,
                            departamento = r.Key.nombreDepartamento,
                            dias = r.Key.fechaTermino - r.Key.fechaInicio
                        };
            foreach (var item in query)
            {
                Resolucion resolucion = new Resolucion();
                resolucion.dias = item.dias.Days;
                resolucion.nombreTipoPermiso = item.nombrePermiso;
                resolucion.rut = item.rut;
                resolucion.departamento = item.departamento;

                reportes.Add(resolucion);
            }

            return reportes;
        }
        public IList<Reporte> reportePorTipoPermisoDeUnidadInterna(int idUnidad)
        {
            IList<Reporte> reportes = new List<Reporte>();
            unidades = new NegocioUnidad().listado();
            solicitudes = new NegocioSolicitud().listado();
            departamentos = new NegocioDepartamento().listado();
            empleados = new NegocioEmpleado().listado();
            listTipoPermiso = new NegocioTipoPermiso().listado();

            var query = from s in solicitudes
                        join t in listTipoPermiso
                        on s.idTipoPermiso equals t.idTipoPermiso
                        join e in empleados
                        on s.rutAutorizante equals e.rut
                        join d in departamentos
                        on e.idDepartamento equals d.idDepartamento
                        where e.idDepartamento == idUnidad
                        group s by new { t.nombreTipoPermiso, d.nombreDepartamento } into r                        
                        select new
                        {
                            nombreDepartamento = r.Key.nombreDepartamento,
                            tipoPermiso = r.Key.nombreTipoPermiso,
                            cantidad = r.Count(c => c.idSolicitud != null)
                        };
            foreach (var item in query)
            {
                Reporte nuevo = new Reporte();
                nuevo.nombreUnidad = item.nombreDepartamento;
                nuevo.nombreTipoPermiso = item.tipoPermiso;
                nuevo.cantidadPermisos = item.cantidad;

                reportes.Add(nuevo);
            }

            return reportes;
        }
    }
}