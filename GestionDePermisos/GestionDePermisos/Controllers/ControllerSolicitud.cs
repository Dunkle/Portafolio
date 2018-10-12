using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;

namespace GestionDePermisos.Controllers
{
    public class ControllerSolicitud
    {
        public int idSolicitud { set; get; }
        public string codigoDocumento { get; set; }
        public String descripcion { set; get; }
        public DateTime fechaSolicitud { set; get; }
        public DateTime fechaInicio { set; get; }
        public DateTime fechaTermino { set; get; }
        public int idTipoPermiso { set; get; }
        public string rutSolicitante { set; get; }
        public string rutAutorizante { set; get; }
        public int idEstado { set; get; }
        public IList<ControllerSolicitud> coleccionSolicitudes { get; set; }


        public ControllerSolicitud()
        {
            idSolicitud = default(int);
            codigoDocumento = string.Empty;
            descripcion = string.Empty;
            fechaSolicitud = default(DateTime);
            fechaInicio = default(DateTime);
            fechaTermino = default(DateTime);
            idTipoPermiso = default(int);
            rutSolicitante = string.Empty;
            rutAutorizante = string.Empty;
            idEstado = default(int);
        }

        public bool readAll()
        {
            try
            {
                this.coleccionSolicitudes = new List<ControllerSolicitud>();
                foreach (var tmp in Conexion.entities.SOLICITUD.ToList())
                {
                    ControllerSolicitud solicitud = new ControllerSolicitud();
                    solicitud.idSolicitud = Convert.ToInt32(tmp.IDSOLICITUD);
                    solicitud.codigoDocumento = tmp.CODIGODOCUMENTO;
                    solicitud.descripcion = tmp.DESCRIPCION;
                    solicitud.fechaSolicitud = Convert.ToDateTime(tmp.FECHASOLICITUD);
                    solicitud.fechaInicio = Convert.ToDateTime(tmp.FECHAINICIO);
                    solicitud.fechaTermino = Convert.ToDateTime(tmp.FECHATERMINO);
                    solicitud.idTipoPermiso = Convert.ToInt32(tmp.IDTIPOPERMISO);
                    solicitud.rutSolicitante = tmp.RUT;
                    solicitud.rutAutorizante = tmp.AUTORIZADOR;
                    solicitud.idEstado = Convert.ToInt32(tmp.IDESTADO);

                    this.coleccionSolicitudes.Add(solicitud);
                }
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        public bool create()
        {
            SOLICITUD solicitud = new SOLICITUD();
            try
            {
                solicitud.IDSOLICITUD = this.idSolicitud;
                solicitud.CODIGODOCUMENTO = this.codigoDocumento;
                solicitud.DESCRIPCION = this.descripcion;
                solicitud.FECHASOLICITUD = this.fechaSolicitud;
                solicitud.FECHAINICIO = this.fechaInicio;
                solicitud.FECHATERMINO = this.fechaTermino;
                solicitud.IDTIPOPERMISO = this.idTipoPermiso;
                solicitud.RUT = this.rutSolicitante;
                solicitud.AUTORIZADOR = this.rutAutorizante;
                solicitud.IDESTADO = this.idEstado;

                Conexion.entities.SOLICITUD.Add(solicitud);
                
                Conexion.entities.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                Conexion.entities.SOLICITUD.Local.Clear();
                return false;
            }
        }

        public bool update()
        {
            try
            {
                SOLICITUD solicitud = Conexion.entities.SOLICITUD.First(f => f.IDSOLICITUD == this.idSolicitud);

                solicitud.IDSOLICITUD = this.idSolicitud;
                solicitud.CODIGODOCUMENTO = this.codigoDocumento;
                solicitud.DESCRIPCION = this.descripcion;
                solicitud.FECHASOLICITUD = this.fechaSolicitud;
                solicitud.FECHAINICIO = this.fechaInicio;
                solicitud.FECHATERMINO = this.fechaTermino;
                solicitud.IDTIPOPERMISO = this.idTipoPermiso;
                solicitud.RUT = this.rutSolicitante;
                solicitud.AUTORIZADOR = this.rutAutorizante;
                solicitud.IDESTADO = this.idEstado;

                Conexion.entities.SaveChanges();
                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }

        public bool read()
        {
            try
            {
                SOLICITUD solicitud = Conexion.entities.SOLICITUD.First(f => f.IDSOLICITUD == this.idSolicitud);

                this.idSolicitud = Convert.ToInt32(solicitud.IDSOLICITUD);
                this.codigoDocumento = solicitud.CODIGODOCUMENTO;
                this.descripcion = solicitud.DESCRIPCION;
                this.fechaSolicitud = Convert.ToDateTime(solicitud.FECHASOLICITUD);
                this.fechaInicio = Convert.ToDateTime(solicitud.FECHAINICIO);
                this.fechaTermino = Convert.ToDateTime(solicitud.FECHATERMINO);
                this.idTipoPermiso = Convert.ToInt32(solicitud.IDTIPOPERMISO);
                this.rutSolicitante = solicitud.RUT;
                this.rutAutorizante = solicitud.AUTORIZADOR;
                this.idEstado = Convert.ToInt32(solicitud.IDESTADO);

                return true;


            }
            catch (Exception e)
            {

                return false;
            }
        }
    }
}