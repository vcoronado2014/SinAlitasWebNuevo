using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TareasProfesorSup : System.Web.UI.Page
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


            }
            else
                Response.Redirect("~/Login.aspx");
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            {
                //pnlProfesor.ClientVisible = true;
                litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                //Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;

                //nos traemos al profesor que estamos editando
                int idProfe = 0;
                if (Request.QueryString["PROF_ID_EDITAR"] != null)
                {
                    idProfe = int.Parse(Request.QueryString["PROF_ID_EDITAR"]);
                    SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfeConsultar = SinAlitas.Admin.Negocio.Profesor.ObtenerEnvoltorioProfesorPorId(idProfe);
                    if (envProfeConsultar != null && envProfeConsultar.Profesor != null && envProfeConsultar.Profesor.Id > 0)
                    {
                        lblFechaEnteraOculto.Text = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now.AddDays(-30)).ToString();
                        lblNodIdOculto.Text = envProfeConsultar.Profesor.NodId.ToString();
                        lblProfIdOculto.Text = envProfeConsultar.Profesor.Id.ToString();

                        List<SinAlitas.Admin.Entidad.TareasEnvoltorio> tareasEnv = SinAlitas.Admin.Negocio.TareasProfesor.ObtenerTareasProfesorEnvoltorioSupervisor(int.Parse(lblFechaEnteraOculto.Text), int.Parse(lblNodIdOculto.Text), int.Parse(lblProfIdOculto.Text));
                        if (tareasEnv != null && tareasEnv.Count > 0)
                            tareasEnv = tareasEnv.OrderByDescending(x => x.Fecha).ToList();
                        rptTareas.DataSource = tareasEnv;
                        rptTareas.DataBind();
                    }
                }

            }
            else
                Response.Redirect("~/login.aspx");
        }
        else
            Response.Redirect("~/login.aspx");
    }
    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {

    }

    protected void rptTareas_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var data2 = ((SinAlitas.Admin.Entidad.TareasEnvoltorio)e.Item.DataItem).TareasMostrar;
        //var listBoxCupos = ((DevExpress.Web.ASPxListBox)e.Item.DataItem);
        var rpt = (Repeater)e.Item.FindControl("rptItems");
        if (rpt != null)
        {
            rpt.DataSource = data2;
            rpt.DataBind();

        }
    }
}