using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Security.Cryptography;

namespace SinAlitas.Admin.Mensajeria
{
    public class MensajesPush
    {
        public static bool Enviar(String registration_id)
        {
            String GCM_URL = @"https://android.googleapis.com/gcm/send";
            string collapseKey = DateTime.Now.ToString();

            //System.Collections.Generic.Dictionary data = new System.Collections.Generic.Dictionary();
            //data.Add("data.msg",
            //    HttpUtility.UrlEncode("Prueba. Timestamp: " + DateTime.Now.ToString()));

            Dictionary<string, string> data = new Dictionary<string, string>()
            {
                {"data.msg", HttpUtility.UrlEncode("Prueba. Timestamp: " + DateTime.Now.ToString()) }
            };

            bool flag = false;
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat("registration_id={0}&collapse_key={1}",
                registration_id, collapseKey);

            foreach (string item in data.Keys)
            {
                if (item.Contains("data."))
                    sb.AppendFormat("&{0}={1}", item, data[item]);
            }

            string msg = sb.ToString();
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(GCM_URL);
            req.Method = "POST";
            req.ContentLength = msg.Length;
            req.ContentType = "application/x-www-form-urlencoded";

            string apiKey = "AIzaSyC-Mtochov2t1TFGO2oBv6vtVdfUdhT6eU";
            req.Headers.Add("Authorization:key=" + apiKey);

            using (StreamWriter oWriter = new StreamWriter(req.GetRequestStream()))
            {
                oWriter.Write(msg);
            }

            using (HttpWebResponse resp = (HttpWebResponse)req.GetResponse())
            {
                using (StreamReader sr = new StreamReader(resp.GetResponseStream()))
                {
                    string respData = sr.ReadToEnd();

                    if (resp.StatusCode == HttpStatusCode.OK)   // OK = 200
                    {
                        if (respData.StartsWith("id="))
                            flag = true;
                    }
                    else if (resp.StatusCode == HttpStatusCode.InternalServerError)    // 500
                        Console.WriteLine("Error interno del servidor, prueba más tarde.");
                    else if (resp.StatusCode == HttpStatusCode.ServiceUnavailable)    // 503
                        Console.WriteLine("Servidor no disponible temporalmente, prueba más tarde.");
                    else if (resp.StatusCode == HttpStatusCode.Unauthorized)          // 401
                        Console.WriteLine("La API Key utilizada no es válida.");
                    else
                        Console.WriteLine("Error: " + resp.StatusCode);
                }
            }

            return flag;

        }

        public static void EnviarPush(string nuevoMensaje)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback += (s, ce, ca, p) => true;
            string GoogleAppId = "AIzaSyC-Mtochov2t1TFGO2oBv6vtVdfUdhT6eU";
            WebRequest webRequest = WebRequest.Create("https://android.googleapis.com/gcm/send");
            webRequest.Method = "post";
            webRequest.ContentType = "application/json";
            webRequest.Headers.Add(String.Format("Authorization:key={0}", GoogleAppId));

            string[] devicesToSend = { "AP-PPPPP" };

            if (devicesToSend.Length > 0)
            {
                string postDataSend = String.Empty;
                postDataSend += "{";
                postDataSend += " \"delay_while_idle\": false, ";
                postDataSend += " \"collapse_key\":\"newNotification\",";
                postDataSend += " \"resgistration_ids\" : [\"" + nuevoMensaje + "\"";
                postDataSend += "}";
                postDataSend += "}";

                byte[] byteArray = Encoding.UTF8.GetBytes(postDataSend);
                webRequest.ContentLength = byteArray.Length;

                Stream dataStream = webRequest.GetRequestStream();
                dataStream.Write(byteArray, 0, byteArray.Length);
                dataStream.Close();

                WebResponse tResponse = webRequest.GetResponse();
                dataStream = tResponse.GetResponseStream();

                StreamReader tReader = new StreamReader(dataStream);
                String sResponseFromServer = tReader.ReadToEnd();
                tReader.Close();
                dataStream.Close();
                tResponse.Close();


            }

        }
    }
}
