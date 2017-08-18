using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlAdministrador.ClientVisible = false;
        pnlProfesor.ClientVisible = false;
        litCantidadNotificaciones.Text = "0";
        //acá siempre debemos validaar el rol para entrar a esta página
        SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
        if (Session["USUARIO_AUTENTICADO"] != null)
        {
            envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            {
                //ahora evaluamos el rol
                //if (envProfesor)
                pnlProfesor.ClientVisible = true;
                Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                List<SinAlitas.Admin.Entidad.Notificacion> notificaciones = 
                    SinAlitas.Admin.Negocio.TareasProfesor.Notificaciones(SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now), envProfesor.Profesor.NodId, envProfesor.Profesor.Id);
                if (notificaciones != null && notificaciones.Count > 0)
                {
                    if (notificaciones.Count == 1 && notificaciones[0].Detalle == "No hay Tareas Pendientes.")
                    {
                        litCantidadNotificaciones.Text = "0";
                    }
                    else
                    {
                        litCantidadNotificaciones.Text = notificaciones.Count().ToString();
                    }
                    StringBuilder sb = new StringBuilder();
                    foreach(SinAlitas.Admin.Entidad.Notificacion not in notificaciones)
                    {
                        sb.Append(not.FechaHora);
                        sb.Append(not.Detalle);
                        sb.Append("<br />");
                        sb.Append("<hr/>");
                    }
                    litTextoNotificaciones.Text = sb.ToString();
                }
            }
            else
                Response.Redirect("~/login.aspx");
        }
        else
            Response.Redirect("~/login.aspx");
    }
}