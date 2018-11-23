using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace GestionDePermisos.Business
{
    public class ConsumirWS
    {
        public void ConsultaAntiguedad(string rut) {
            //WebClient webClient = new WebClient();
            //string url = string.Format("http://localhost:8585/Sistema-rrhh-1.0.0/empleado/{0}",rut);
            //byte[] datos = webClient.DownloadData(url);
            //Stream memoria = new MemoryStream(datos);
            //var reader = new StreamReader(memoria);
            //var result = reader.ReadToEnd();

            //byte[] data = UTF8Encoding.UTF8.GetBytes(rut);
            //HttpWebRequest request;
            //request = WebRequest.Create("http://localhost:8585/Sistema-rrhh-1.0.0/empleado/") as HttpWebRequest;
            //request.Timeout = 10 * 1000;
            //request.Method = "POST";            
            //request.ContentType = "application/json; charset=utf-8";
            //Stream postStream = request.GetRequestStream();
            //postStream.Write(data, 0, data.Length);

            //HttpWebResponse response = request.GetResponse() as HttpWebResponse;
            //StreamReader reader = new StreamReader(response.GetResponseStream());
            //string body = reader.ReadToEnd();

            var syncClient = new WebClient();
            syncClient.Headers[HttpRequestHeader.ContentType] = "application/json; charset=utf-8";
            syncClient.Headers[HttpRequestHeader.Accept] = "application/json";

            var resp = syncClient.UploadString("http://localhost:8585/Sistema-rrhh-1.0.0/empleado/", "POST", "{19}");

            string test = string.Empty;


        }
    }
}