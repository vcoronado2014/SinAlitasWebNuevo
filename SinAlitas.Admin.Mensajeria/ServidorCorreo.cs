using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;

namespace SinAlitas.Admin.Mensajeria
{
    public class ServidorCorreo
    {
        SmtpClient server = new SmtpClient(Utiles.SMTP(), int.Parse(Utiles.PUERTO_SMTP()));

        public ServidorCorreo()
        {
            server.Credentials = new System.Net.NetworkCredential(Utiles.NOMBRE_SERVIDOR_CORREO(), Utiles.CLAVE_SERVIDOR_CORREO());
            if (Utiles.ENABLE_SSL() == "1")
                server.EnableSsl = true;
            else
                server.EnableSsl = false;
            //server.DeliveryMethod = SmtpDeliveryMethod.Network;
            //server.UseDefaultCredentials = false;
        }
        public void Enviar(MailMessage mensaje)
        {
            try
            {
                server.Send(mensaje);
                //SinAlitas.Admin.Negocio.Utiles.Log("correo enviado");
            }
            catch (Exception ex)
            {
                Utiles.Log(ex);
                throw ex;
            }
        }
    }
}
