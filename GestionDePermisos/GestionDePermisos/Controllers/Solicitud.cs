using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;

namespace GestionDePermisos.Controllers
{
    public class Solicitud
    {
        public int idSolicitud { set; get; }
        public String descripcion { set; get; }
        public DateTime fechaSolicitud { set; get; }
        public DateTime fechaInicio { set; get; }
        public DateTime fechaTermino { set; get; }
        public int idTipoPermiso { set; get; }
        public int rutSolicitante { set; get; }
        public int rutAutorizante { set; get; }
        public int idEstado { set; get; }
        public IList<Solicitud> coleccionSolicitudes { get; set; }


        public Solicitud()
        {
            idSolicitud = default(int);
            descripcion = string.Empty;
            fechaSolicitud = default(DateTime);
            fechaInicio = default(DateTime);
            fechaTermino = default(DateTime);
            idTipoPermiso = default(int);
            rutSolicitante = default(int);
            rutAutorizante = default(int);
            idEstado = default(int);
        }

        public bool readAll()
        {
            try
            {
                this.coleccionSolicitudes = new List<Solicitud>();
                foreach (var tmp in Conexion.entities.SOLICITUD.ToList())
                {
                    Solicitud solicitud = new Solicitud();
                    solicitud.idSolicitud = Convert.ToInt32(tmp.IDSOLICITUD);
                    solicitud.descripcion = tmp.DESCRIPCION;
                    solicitud.fechaSolicitud = Convert.ToDateTime(tmp.FECHASOLICITUD);
                    solicitud.fechaInicio = Convert.ToDateTime(tmp.FECHAINICIO);
                    solicitud.fechaTermino = Convert.ToDateTime(tmp.FECHATERMINO);
                    solicitud.idTipoPermiso = Convert.ToInt32(tmp.IDTIPOPERMISO);
                    solicitud.rutSolicitante = Convert.ToInt32(tmp.RUT);
                    solicitud.rutAutorizante = Convert.ToInt32(tmp.AUTORIZADOR);
                    solicitud.idEstado = Convert.ToInt32(tmp.ESTADO);

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
                this.descripcion = solicitud.DESCRIPCION;
                this.fechaSolicitud = Convert.ToDateTime(solicitud.FECHASOLICITUD);
                this.fechaInicio = Convert.ToDateTime(solicitud.FECHAINICIO);
                this.fechaTermino = Convert.ToDateTime(solicitud.FECHATERMINO);
                this.idTipoPermiso = Convert.ToInt32(solicitud.IDTIPOPERMISO);
                this.rutSolicitante = Convert.ToInt32(solicitud.RUT);
                this.rutAutorizante = Convert.ToInt32(solicitud.AUTORIZADOR);
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