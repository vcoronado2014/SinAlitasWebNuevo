using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListarProfesores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
                    case 3://Profesor
                        Response.Redirect("~/ContenidoProfesor.aspx");
                        break;
                }

                //ahora podemos listar los Profesores
                List<SinAlitas.Admin.Entidad.Profesor> listaProf = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerProfesores();
                if (listaProf != null && listaProf.Count > 0)
                {
                    litContenidoLista.Text = SinAlitas.Admin.Negocio.CrudProfesores.ConstruirTabla(listaProf);
                    litContenidoItem.Text = SinAlitas.Admin.Negocio.CrudProfesores.ConstruirItem(listaProf);
                }
            }
            else
                Response.Redirect("~/Login.aspx");
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            {
                //pnlProfesor.ClientVisible = true;
                litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;

            }
            else
                Response.Redirect("~/login.aspx");
        }
        else
            Response.Redirect("~/login.aspx");
    }

    protected void pnlGeneral_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null && e.Parameter.Length > 0)
        {
            string[] param = e.Parameter.Split(';');

            int idProfe = int.Parse(param[0]);
            string mensaje = param[1];
            Mensaje1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, mensaje);
            //MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, mensaje);
            List<SinAlitas.Admin.Entidad.Profesor> listaProf = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerProfesores();
            if (listaProf != null && listaProf.Count > 0)
            {
                litContenidoLista.Text = SinAlitas.Admin.Negocio.CrudProfesores.ConstruirTabla(listaProf);
                litContenidoItem.Text = SinAlitas.Admin.Negocio.CrudProfesores.ConstruirItem(listaProf);
            }
        }
    }
}