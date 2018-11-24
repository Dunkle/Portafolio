using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using GestionDePermisos.Models;
using Newtonsoft.Json;

namespace GestionDePermisos.Business
{
    public class ConsumirWS
    {
        public int ConsultaAntiguedad(string rut) {
            string url = string.Format("http://localhost:8585/Sistema-rrhh-1.0.0/empleado/{0}",rut);
            
            var syncClient = new WebClient();
            syncClient.Headers[HttpRequestHeader.ContentType] = "application/json; charset=utf-8";
            syncClient.Headers[HttpRequestHeader.Accept] = "application/json";

            var resp = syncClient.UploadString(url, "POST");

            AntiguedadEmpleado empleado;

            empleado = JsonConvert.DeserializeObject<AntiguedadEmpleado>(resp);

            return empleado.antiguedad;
        }

        public int cantidadDias(string rut) {
            int cantidad = ConsultaAntiguedad(rut);
            if (cantidad >= 1 && cantidad < 15)
            {
                return 15;
            }
            else if (cantidad >= 15 && cantidad < 20)
            {
                return 20;
            }
            else if (cantidad >= 20)
            {
                return 25;
            }
            else return 0;

        }
    }
}