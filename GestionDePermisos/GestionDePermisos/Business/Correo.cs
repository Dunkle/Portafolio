using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;

namespace Utilidades
{
    public class Correo
    {
        public string correoDesde { get; set; }
        public string nombreDesde { get; set; }
        public string asunto { get; set; }
        public string cuerpo { get; set; }
        public string correoHasta { get; set; }
        private string usuario { get; set; }
        private string contraseña { get; set; }

        public Correo()
        {
            correoDesde = string.Empty;
            nombreDesde = string.Empty;
            asunto = string.Empty;
            cuerpo = string.Empty;
            correoHasta = string.Empty;
            usuario = "agenciaontour2018@gmail.com";
            contraseña = "duoc2018.";
        }

        public void EnviarCorreo()
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
            mail.From = new MailAddress(correoDesde, nombreDesde, Encoding.UTF8);
            //Aquí ponemos el asunto del correo
            mail.Subject = asunto;
            //Aquí ponemos el mensaje que incluirá el correo
            mail.Body = cuerpo;

            //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
            mail.To.Add(correoHasta);
            //Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran
            //mail.Attachments.Add(new Attachment(@"C:\Documentos\carta.docx"));

            //Configuracion del SMTP
            SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                                   //Especificamos las credenciales con las que enviaremos el mail
            SmtpServer.Credentials = new System.Net.NetworkCredential(usuario, contraseña);
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
        }
    }
}
