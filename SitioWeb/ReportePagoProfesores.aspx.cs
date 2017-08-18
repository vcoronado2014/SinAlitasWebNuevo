    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReportePagoProfesores : System.Web.UI.Page
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

        }
        else
            Response.Redirect("~/login.aspx");

        if (envProfesor != null && envProfesor.Profesor.Id > 0)
        {
            //pnlProfesor.ClientVisible = true;
            litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
            dtFechaInicio.Date = DateTime.Now.AddMonths(-1);
            dtFechaTermino.Date = DateTime.Now;
        }
    }
    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null)
        {
            if (dtFechaInicio.Date == DateTime.MinValue || dtFechaTermino.Date == DateTime.MinValue)
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Debe ingresar fecha de inicio y término");
            if (dtFechaInicio.Date == null || dtFechaTermino.Date == null)
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Debe ingresar fecha de inicio y término");
            if (dtFechaInicio.Date > dtFechaTermino.Date)
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "La fecha de inicio no puede ser mayor a la de término.");
            if (dtFechaTermino.Date < dtFechaInicio.Date)
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "La fecha de término no puede ser menor a la fecha de inicio");


            DateTime fechaInicio = dtFechaInicio.Date;
            try
            {
                rptClases.DataSource = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerReportePagos(dtFechaInicio.Date, dtFechaTermino.Date, int.Parse(cmbCantidadClases.Value.ToString()));
                rptClases.DataBind();

                //Consultar(fechaInicio);
            }
            catch (Exception ex)
            {
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, ex.Message);
            }

        }
    }

    protected void rptClases_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var data2 = ((SinAlitas.Admin.Entidad.ReportePagosEnvoltorio)e.Item.DataItem).DatosPack;
        //var listBoxCupos = ((DevExpress.Web.ASPxListBox)e.Item.DataItem);
        var rpt = (Repeater)e.Item.FindControl("rptItems");
        if (rpt != null)
        {
            rpt.DataSource = data2;
            rpt.DataBind();

        }
    }
}