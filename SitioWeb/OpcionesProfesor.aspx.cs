using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OpcionesProfesor : System.Web.UI.Page
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

                List<SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo> cuposProfesor = SinAlitas.Admin.Negocio.EnvoltorioProfesorCupo.ListaProfesoresYCupos();
                rptCupos.DataSource = cuposProfesor;
                rptCupos.DataBind();


            }
            else
                Response.Redirect("~/login.aspx");
        }
        else
            Response.Redirect("~/login.aspx");
    }

    protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {

    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {

    }
}