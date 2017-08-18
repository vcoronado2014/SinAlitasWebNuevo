using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using Twilio;

namespace SinAlitas.Admin.Mensajeria
{
    public class MensajesSMS
    {
        static string domainid = "demopr";
        static string usuario = "micasa";
        static string contrasena = "xywufffg";
        static string remitente = "56985006988";
        //56xxxxxxxxx
        //Content-type: "application/x-www-form-urlencoded; charset=UTF-8".
        public static string EnviarTwilio(string telefonoDestino, string mensaje)
        {
            if (!telefonoDestino.Contains("+"))
                telefonoDestino = "+" + telefonoDestino;

            string retorno = "";


            string AccountSid = "AC01c61b2fd9bfab00910589b93d27c6dd";
            string AuthToken = "50a124bdae019261c556a3fd0022c04e";
            //SK89dea26f791475eb5ec4a6c6e8ff1c0c
            var twilio = new TwilioRestClient(AccountSid, AuthToken);

            var message = twilio.SendMessage("+56945950206", telefonoDestino, mensaje);
            //retorno = "Enviado Ok.";
            SinAlitas.Admin.Negocio.Utiles.Log(retorno);

            if (message.RestException != null)
            {
                var error = message.RestException.Message;
                SinAlitas.Admin.Negocio.Utiles.Log(error.ToString());
                retorno = error.ToString();
            }
            return retorno;
        }

        public static string Enviar(string telefonoDestino)
        {
            //Se fija la URL sobre la que enviar la petición POST
            //Como ejemplo la petición se envía a www.altiria.net/sustituirPOSTsms
            //Se debe reemplazar la cadena '/sustituirPOSTsms' por la parte correspondiente
            //de la URL suministrada por Altiria al dar de alta el servicio
            //o solicitar una cuenta de prueba
            //HttpWebRequest loHttp =
            HttpWebRequest loHttp = (HttpWebRequest)WebRequest.Create("http://www.altiria.net/api/http");

            // Compone el mensaje a enviar
            // XX, YY y ZZ se corresponden con los valores de identificación del usuario en el sistema.
            //Seran proporcionados por Altiria al dar de alta el servicio
            //o solicitar una cuenta de prueba
            string lcPostData =
              "cmd=sendsms&domainId=" + domainid + "&login=" + usuario + "&passwd=" + contrasena + "&dest=" + telefonoDestino +
              "&msg=Mensaje de prueba";
            //Remitente autorizado por Altiria al dar de alta el servicio.
            //No disponible en todos los países.
            //Omitir el parametro si no se cuenta con ninguno.
            //"&senderId=" + remitente;


            // Se codifica en utf-8
            byte[] lbPostBuffer = System.Text.Encoding.GetEncoding("utf-8").GetBytes(lcPostData);
            loHttp.Method = "POST";
            loHttp.ContentType = "application/x-www-form-urlencoded";
            loHttp.ContentLength = lbPostBuffer.Length;

            //Fijamos tiempo de espera de respuesta = 60 seg
            loHttp.Timeout = 60000;
            String error = "";
            String response = "";
            // Envía la peticion
            try
            {
                
                Stream loPostData = loHttp.GetRequestStream();
                loPostData.Write(lbPostBuffer, 0, lbPostBuffer.Length);
                loPostData.Close();
                // Prepara el objeto para obtener la respuesta
                HttpWebResponse loWebResponse = (HttpWebResponse)loHttp.GetResponse();
                // La respuesta vendría codificada en utf-8
                Encoding enc = System.Text.Encoding.GetEncoding("utf-8");
                StreamReader loResponseStream =
                new StreamReader(loWebResponse.GetResponseStream(), enc);
                // Conseguimos la respuesta en una cadena de texto
                response = loResponseStream.ReadToEnd();
                loWebResponse.Close();
                loResponseStream.Close();
            }
            catch (WebException e)
            {
                if (e.Status == WebExceptionStatus.ConnectFailure)
                    error = "Error en la conexión";
                else if (e.Status == WebExceptionStatus.Timeout)
                    error = "Error TimeOut";
                else
                    error = e.Message;
            }
            finally
            {
                if (error != "")
                    Console.WriteLine(error);
                else
                    Console.WriteLine(response);
            }
            return response.ToString();
        }

        public static string Enviar(string telefonoDestino, string mensaje)
        {
            //Se fija la URL sobre la que enviar la petición POST
            //Como ejemplo la petición se envía a www.altiria.net/sustituirPOSTsms
            //Se debe reemplazar la cadena '/sustituirPOSTsms' por la parte correspondiente
            //de la URL suministrada por Altiria al dar de alta el servicio
            //o solicitar una cuenta de prueba
            //HttpWebRequest loHttp =
            HttpWebRequest loHttp = (HttpWebRequest)WebRequest.Create("http://www.altiria.net/api/http");

            // Compone el mensaje a enviar
            // XX, YY y ZZ se corresponden con los valores de identificación del usuario en el sistema.
            //Seran proporcionados por Altiria al dar de alta el servicio
            //o solicitar una cuenta de prueba
            string lcPostData =
              "cmd=sendsms&domainId=" + domainid + "&login=" + usuario + "&passwd=" + contrasena + "&dest=" + telefonoDestino +
              "&msg=" + mensaje;
            //Remitente autorizado por Altiria al dar de alta el servicio.
            //No disponible en todos los países.
            //Omitir el parametro si no se cuenta con ninguno.
            //"&senderId=" + remitente;


            // Se codifica en utf-8
            byte[] lbPostBuffer = System.Text.Encoding.GetEncoding("utf-8").GetBytes(lcPostData);
            loHttp.Method = "POST";
            loHttp.ContentType = "application/x-www-form-urlencoded";
            loHttp.ContentLength = lbPostBuffer.Length;

            //Fijamos tiempo de espera de respuesta = 60 seg
            loHttp.Timeout = 60000;
            String error = "";
            String response = "";
            // Envía la peticion
            try
            {

                Stream loPostData = loHttp.GetRequestStream();
                loPostData.Write(lbPostBuffer, 0, lbPostBuffer.Length);
                loPostData.Close();
                // Prepara el objeto para obtener la respuesta
                HttpWebResponse loWebResponse = (HttpWebResponse)loHttp.GetResponse();
                // La respuesta vendría codificada en utf-8
                Encoding enc = System.Text.Encoding.GetEncoding("utf-8");
                StreamReader loResponseStream =
                new StreamReader(loWebResponse.GetResponseStream(), enc);
                // Conseguimos la respuesta en una cadena de texto
                response = loResponseStream.ReadToEnd();
                loWebResponse.Close();
                loResponseStream.Close();
            }
            catch (WebException e)
            {
                if (e.Status == WebExceptionStatus.ConnectFailure)
                {
                    error = "Error en la conexión";
                    SinAlitas.Admin.Negocio.Utiles.Log(error);
                }
                else if (e.Status == WebExceptionStatus.Timeout)
                {
                    error = "Error TimeOut";
                    SinAlitas.Admin.Negocio.Utiles.Log(error);
                }
                else
                {
                    error = e.Message;
                    SinAlitas.Admin.Negocio.Utiles.Log(error);
                }
            }
            finally
            {
                if (error != "")
                {
                    Console.WriteLine(error);
                    SinAlitas.Admin.Negocio.Utiles.Log(error);
                }
                else
                {
                    Console.WriteLine(response);
                    SinAlitas.Admin.Negocio.Utiles.Log(response);
                }
            }
            return response.ToString();
        }

        public static string RetornaMensajeCrearCodigoCliente(string codigo)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("Su código es {0}, guarde su código ya que posteriormente necesitará ingresarlo.", codigo);
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCanceladaPorElCliente(string nombreCliente, string fechaHora)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("Nuestro cliente {0} ha cancelado la clase del día {1} previa coordinación anterior.", nombreCliente, fechaHora);
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCanceladaPorElProfesor(string nombreProfesor, string fechaHora)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("El profesor {0} ha cancelado la clase del día {1} previa coordinación con Usted.", nombreProfesor, fechaHora);
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCanceladaPorElProfesor(string fechaHora)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("Se ha cancelado la clase del día {1}.", fechaHora);
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCreadaParaElCliente(string nombreprofesor, string fechaHora)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Usted ha agendado Clases.");
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCreadaParaElProfesor(string nombreCliente, string fechaHora, string domicilio)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Se han agendado clases.");
            return sb.ToString();

        }
        public static string RetornaMensajeClaseReagendadaParaElProfesor(string nombreCliente, string fechaHora, string domicilio, string fechaHoraNueva)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("Se ha reagendado la clase {0} para el día {1}", fechaHora, fechaHoraNueva);
            return sb.ToString();

        }

    }
}


