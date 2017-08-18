using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CrearCodigo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
        if (Session["USUARIO_AUTENTICADO"] != null)
        {
            envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            {

                Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;


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