using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BuscarPack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //VOLVEMOS A NULL ESTA VARIABLE
        if (Session["PRIMERA_FECHA"] != null)
            Session["PRIMERA_FECHA"] = null;
        SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
        if (Session["USUARIO_AUTENTICADO"] != null)
        {
            envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            {
                litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                // Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;


            }
            else
                Response.Redirect("~/login.aspx");
        }
        else
            Response.Redirect("~/login.aspx");
    }

    protected void grillaResultados_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters.Length > 0)
        {
            string[] param = e.Parameters.Split('|');
            string estado = param[0];
            string codigo = param[1];
            odsBusqueda.SelectParameters[0].DefaultValue = estado;
            odsBusqueda.SelectParameters[1].DefaultValue = codigo;
            odsBusqueda.DataBind();
            grillaResultados.DataBind();
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InicioSupervisor.aspx");
    }

    protected void grillaResultados_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
    {
        if (e.VisibleIndex == -1) return;
        switch (e.ButtonType)
        {
            case ColumnCommandButtonType.Edit:
                e.Visible = EditButtonVisibleCriteria((ASPxGridView)sender, e.VisibleIndex);
                break;
            case ColumnCommandButtonType.Delete:
                e.Visible = DeleteButtonVisibleCriteria((ASPxGridView)sender, e.VisibleIndex);
                break;
        }
    }
    private bool EditButtonVisibleCriteria(ASPxGridView grid, int visibleIndex)
    {
        object row = grid.GetRow(visibleIndex);
        if (row != null)
        {
            SinAlitas.Admin.Entidad.ProductoCodigoTexto entidad = row as SinAlitas.Admin.Entidad.ProductoCodigoTexto;
            bool estaPagado = entidad.EstaPagado;
            if (estaPagado)
                return false;
            else
                return true;
        }
        else
            return false;
    }
    private bool DeleteButtonVisibleCriteria(ASPxGridView grid, int visibleIndex)
    {
        object row = grid.GetRow(visibleIndex);
        return ((DataRowView)row)["ProductName"].ToString().Contains("b");
    }
}