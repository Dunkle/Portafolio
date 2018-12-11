using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;

namespace GestionDePermisos.Utils
{
    public class Correo
    {
        public string remitente { get; set; }
        public string nombreRemitente { get; set; }
        public string asunto { get; set; }
        public string cuerpo { get; set; }
        public string destinatario { get; set; }
        private string usuario { get; set; }
        private string contraseña { get; set; }

        public Correo()
        {
            remitente ="s.salinassalinas@gmail.com";
            nombreRemitente = "Municipalidad Vista Hermosa";
            asunto = string.Empty;
            cuerpo = string.Empty;
            destinatario = string.Empty;
            usuario = "agenciaontour2018@gmail.com";
            contraseña = "duoc2018.";
        }

        public void EnviarCorreo()
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
            mail.From = new MailAddress(remitente, nombreRemitente, Encoding.UTF8);
            //Aquí ponemos el asunto del correo
            mail.Subject = asunto;
            //Aquí ponemos el mensaje que incluirá el correo
            mail.Body = cuerpo;

            //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
            mail.To.Add(destinatario);
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
