using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class InicioSupervisor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //VOLVEMOS A NULL ESTA VARIABLE
        if (Session["PRIMERA_FECHA"] != null)
            Session["PRIMERA_FECHA"] = null;
        SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
        if (Request.QueryString["NOMBRE_USUARIO"] != null && Request.QueryString["CONTRASENA"] != null)
        {
            string usuario = Request.QueryString["NOMBRE_USUARIO"];
            string contrasena = Request.QueryString["CONTRASENA"];
            envProfesor = SinAlitas.Admin.Negocio.Profesor.ObtenerEnvoltorioProfesorPorUsuarioPassword(usuario, contrasena);
            Session["USUARIO_AUTENTICADO"] = envProfesor;
        }

        if (Session["USUARIO_AUTENTICADO"] != null)
        {
            envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
            if (envProfesor.Rol.Id > 0)
            {
                switch (envProfesor.Rol.Id)
                {
                    case 1: //Super Administrador
                        break;
                    case 3://Profesor
                        Response.Redirect("~/ContenidoProfesor.aspx");
                        break;
                }


            }
            else
                Response.Redirect("~/Login.aspx");
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            { 
                //pnlProfesor.ClientVisible = true;
                litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                //Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                List<SinAlitas.Admin.Entidad.ReporteClases> lista = SinAlitas.Admin.Negocio.ReporteClases.ObtenerReporteClases();
                List<SinAlitas.Admin.Entidad.ReporteClases> alertas = new List<SinAlitas.Admin.Entidad.ReporteClases>();
                if (lista != null && lista.Count > 0)
                {
                    foreach(SinAlitas.Admin.Entidad.ReporteClases rpt in lista)
                    {
                        int suma = rpt.Pendientes + rpt.Cerradas;
                        if (suma < rpt.Programadas)
                        {
                            alertas.Add(rpt);
                        }
                    }
                }
                StringBuilder sb = new StringBuilder();
                if (alertas != null && alertas.Count > 0)
                {

                    sb.Append("<div class='alert alert-danger alert-dismissible visible-md visible-lg' role='alert'>");
                    sb.Append("<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                    foreach(SinAlitas.Admin.Entidad.ReporteClases rep in alertas)
                    {
                        int suma = rep.Pendientes + rep.Cerradas;
                        sb.AppendFormat("<span class='visible-md visible-lg font-muypequeno'>El Cliente <strong>{0}</strong>, <strong>{1}</strong>, tiene {2} clases en el sistema, de un total de {3} Programadas. </span>", rep.Nombre, rep.CodigoCliente, suma.ToString(), rep.Programadas.ToString());
                        
                    }
                    sb.Append("</div>");

                    sb.Append("<div class='alert alert-danger alert-dismissible visible-xs visible-sm' role='alert'>");
                    sb.Append("<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                    sb.Append("<div class='visible-xs visible-sm font-muypequeno no-padding'>");
                    foreach (SinAlitas.Admin.Entidad.ReporteClases rep in alertas)
                    {
                        int suma = rep.Pendientes + rep.Cerradas;
                        sb.AppendFormat("El <strong>{0}</strong>, tiene {1} clases en el sistema, de un total de {2} Programadas. ", rep.CodigoCliente, suma.ToString(), rep.Programadas.ToString());
                    }
                    sb.Append("</div>");
                    sb.Append("</div>");


                }
                if (sb.ToString() != "")
                    litAlerta.Text = sb.ToString();

            }
            else
                Response.Redirect("~/login.aspx");
        }
        else
            Response.Redirect("~/login.aspx");
    }
    protected void grillaResultados_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        ObjectDataSource1.DataBind();
        grillaResultados.DataBind();
    }



    protected void btnCrearCliente_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CrearCliente.aspx");
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InicioSupervisor.aspx");
    }
}