using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace GCMServer
{
    /// <summary>
    /// Summary description for Notificaciones
    /// </summary>
    public class Notificaciones : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string PROFiD = context.Request["PROF_ID"];
            context.Response.ContentType = "application/json";

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(ObtenerNotificaciones(int.Parse(PROFiD)));

            context.Response.Write(sb.ToString());
        }

        public string ObtenerNotificaciones(int idProfesor)
        {
            string retorno = string.Empty;
            SinAlitas.Admin.Entidad.Notificacion notificacion = new SinAlitas.Admin.Entidad.Notificacion();
            List<SinAlitas.Admin.Entidad.Cupo> cupos = SinAlitas.Admin.Negocio.Cupo.ObtenerCuposNotificaciones(idProfesor);
            int contadorNotificaciones = 0;
            try
            {

                
                if (cupos != null && cupos.Count > 0)
                {

                    notificacion.FechaHora = DateTime.Now.ToShortDateString();
                    notificacion.TipoNotificacion = SinAlitas.Admin.Entidad.TipoNotificacion.Mensaje;
                    foreach(SinAlitas.Admin.Entidad.Cupo cpo in cupos)
                    {
                        if (cpo.PcoId > 0 && cpo.EstadoCupo > 0)
                        {
                            contadorNotificaciones++;
                        }
                    }
                    if (contadorNotificaciones > 0)
                    {
                        if (contadorNotificaciones == 1)
                            notificacion.Detalle = "Usted tiene una Actividad para hoy, pinche aquí para verla.";
                        else
                            notificacion.Detalle = "Usted tiene varias Actividades para hoy, pinche aquí para verlas.";
                    }
                    
                }
                else
                {
                    notificacion.Detalle = "No hay";
                    notificacion.FechaHora = DateTime.Now.ToShortDateString();


                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                retorno = js.Serialize(notificacion);

            }
            catch (Exception ex)
            {
                retorno = ex.Message;
            }

            return retorno;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}