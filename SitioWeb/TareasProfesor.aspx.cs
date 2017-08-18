using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TareasProfesor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
            if (Session["USUARIO_AUTENTICADO"] != null)
            {
                envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
                lblFechaEnteraOculto.Text =  SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now.AddDays(-30)).ToString();

                if (envProfesor != null && envProfesor.Profesor.Id > 0)
                {
                    //Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                    litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                    //valido
                    //los meses del combo
                    int idMes = 0;
                    //List<SinAlitas.Admin.Entidad.Meses> meses = SinAlitas.Admin.Entidad.Utiles.RetornaMesesProfesor();
                    //cmbMeses.DataSource = meses;
                    //cmbMeses.DataBind();

                    //seleccionamos mes actual
                    if (Request.QueryString["ID_MES"] != null)
                        idMes = int.Parse(Request.QueryString["ID_MES"]);
                    else
                        idMes = DateTime.Now.Month;

                    //cmbMeses.Value = idMes.ToString();
                    //seteo de variables ocultas
                    lblNodIdOculto.Text = envProfesor.Profesor.NodId.ToString();
                    lblProfIdOculto.Text = envProfesor.Profesor.Id.ToString();
                    //hlVolver.NavigateUrl = "inicio.aspx";
                    //para que un profesor tenga tareas disponibles debe tener clientes 
                    //asociados a sus cupos.
                    //ActualizarAgenda(envProfesor.Nodo.Id, idMes, envProfesor.Profesor.Id);
                    List<SinAlitas.Admin.Entidad.TareasEnvoltorio> tareasEnv = SinAlitas.Admin.Negocio.TareasProfesor.ObtenerTareasProfesorEnvoltorio(int.Parse(lblFechaEnteraOculto.Text), int.Parse(lblNodIdOculto.Text), int.Parse(lblProfIdOculto.Text));
                    rptTareas.DataSource = tareasEnv;
                    rptTareas.DataBind();

                }
                else
                    Response.Redirect("~/login.aspx");
            }
            else
                Response.Redirect("~/login.aspx");



        }
    }
    private void ActualizarTareas()
    {

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