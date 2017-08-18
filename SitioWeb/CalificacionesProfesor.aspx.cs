using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CalificacionesProfesor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
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
                        case 2://Supervisor
                            Response.Redirect("~/InicioSupervisor.aspx");
                            break;
                    }


                }
                else
                    Response.Redirect("~/Login.aspx");
                if (envProfesor != null && envProfesor.Profesor.Id > 0)
                {
                    //volver a poner un encabezado
                    litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                    List<SinAlitas.Admin.Entidad.CalificacionesProfesor> listaCalificaciones = SinAlitas.Admin.Negocio.CalificacionesProfesor.ObtenerCalificacionesPorProfId(envProfesor.Profesor.Id);
                    litPromedioCalificaciones.Text = SinAlitas.Admin.Negocio.CalificacionesProfesor.PromedioCalificaciones(envProfesor.Profesor.Id).ToString();
                    litCantidadComentarios.Text = listaCalificaciones.Count.ToString();
                    //List<SinAlitas.Admin.Entidad.EnvoltorioCalificaciones> calificaciones = SinAlitas.Admin.Negocio.CalificacionesProfesor.ListarCalificaciones(envProfesor.Profesor.Id);
                    rptCupos.DataSource = listaCalificaciones;
                    rptCupos.DataBind();

                }
                else
                    Response.Redirect("~/login.aspx");
            }
            else
                Response.Redirect("~/login.aspx");



        }
    }
}