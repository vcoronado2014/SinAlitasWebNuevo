using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MatrizProfesor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //    SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
        //    if (Session["USUARIO_AUTENTICADO"] != null)
        //    {
        //        envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
        //        if (envProfesor != null && envProfesor.Profesor.Id > 0)
        //        {
        //            Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
        //            //valido
        //            //los meses del combo
        //            int idMes = 0;
        //            List<SinAlitas.Admin.Entidad.Meses> meses = SinAlitas.Admin.Entidad.Utiles.RetornaMesesProfesor();
        //            cmbMeses.DataSource = meses;
        //            cmbMeses.DataBind();

        //            //seleccionamos mes actual
        //            if (Request.QueryString["ID_MES"] != null)
        //                idMes = int.Parse(Request.QueryString["ID_MES"]);
        //            else
        //                idMes = DateTime.Now.Month;

        //            cmbMeses.Value = idMes.ToString();
        //            //seteo de variables ocultas
        //            lblNodIdOculto.Text = envProfesor.Profesor.NodId.ToString();
        //            lblProfIdOculto.Text = envProfesor.Profesor.Id.ToString();

        //            ActualizarAgenda(envProfesor.Nodo.Id, idMes, envProfesor.Profesor.Id);
        //            hlVolver.NavigateUrl = "inicio.aspx";
        //        }
        //        else
        //            Response.Redirect("~/login.aspx");
        //    }
        //    else
        //        Response.Redirect("~/login.aspx");

        if (!Page.IsPostBack)
        {
            lblNodIdOculto.Text = "1";
            lblProfIdOculto.Text = "1";
            lblClieIdOculto.Text = "1";
            ActualizarAgenda(1, 1);

        }
    }
    private void ActualizarAgenda(int nodId, int profId)
    {
        SinAlitas.Admin.Entidad.SegmentoMostrarFecha segmento = SinAlitas.Admin.Negocio.MatrizSegmentos.ContruirSegmentosParaCliente(nodId, profId);

        List<SinAlitas.Admin.Entidad.SegmentoMostrar> segmentoDias = segmento.Dias;

        Repeater1.DataSource = segmentoDias;
        Repeater1.DataBind();
    }
    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null && e.Parameter.Length > 0)
        {
            string[] param = e.Parameter.Split('|');
            int nodId = int.Parse(param[1].ToString());
            int profId = int.Parse(param[2].ToString());
            int idMes = int.Parse(param[0].ToString());
            ActualizarAgenda(nodId, profId);
        }
    }
    private void CargarGrilla(int fechaEntera, int nodId, int profId, int esBloqueado, int clieIdLog)
    {
        List<SinAlitas.Admin.Entidad.CupoLiviano> lista = SinAlitas.Admin.Negocio.MatrizSegmentos.EntregaSegmentos(fechaEntera, nodId, profId, esBloqueado, clieIdLog);
        //grillaSegmentos.DataSource = lista;
        //grillaSegmentos.DataBind();
        Repeater2.DataSource = lista;
        Repeater2.DataBind();
    }
    #region grilla
    //protected void grillaSegmentos_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    //{
    //    if (e.Parameters.Length > 0)
    //    {
    //        string[] param = e.Parameters.Split('|');
    //        int fecha = int.Parse(param[0]);
    //        int nodId = int.Parse(param[1]);
    //        int profId = int.Parse(param[2]);
    //        int puede = int.Parse(param[3]);
    //        int clieIdLog = int.Parse(lblClieIdOculto.Text);
    //        CargarGrilla(fecha, nodId, profId, puede, clieIdLog);
    //    }
    //}

    //protected void grillaSegmentos_BatchUpdate(object sender, DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs e)
    //{
    //    if (e.UpdateValues.Count <= 1)
    //    {
    //        List<DevExpress.Web.Data.ASPxDataUpdateValues> valores = e.UpdateValues;
    //        foreach(DevExpress.Web.Data.ASPxDataUpdateValues valor in valores)
    //        {
    //            //SinAlitas.Admin.Entidad.CupoLiviano cupo1 = grillaSegmentos.GetRowValuesByKeyValue(valor.Keys[0], "Id") as SinAlitas.Admin.Entidad.CupoLiviano;
    //            object obj = grillaSegmentos.GetRowValuesByKeyValue(valor.Keys[0], "Id");
    //            //este Id debemos ocupar para buscar el elemento y actualizarlo al profe,
    //            //el id viene compuesto por la fechaentera+horainicio+horatermino todo como entero, así que hay que
    //            //descomponerlo


    //        }


    //        e.Handled = true;
    //    }
    //    else
    //    {
    //        e.Handled = false;
    //        throw new Exception("Se permite tomar un máximo de una clase por día");

    //    }
    //}

    //protected void grillaSegmentos_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
    //{
    //    if (e.DataColumn.FieldName == "EsDisponible")
    //    {

    //    }
    //}
    #endregion

    protected void pnlCupos_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter.Length > 0)
        {
            string[] param = e.Parameter.Split('|');
            int fecha = int.Parse(param[0]);
            int nodId = int.Parse(param[1]);
            int profId = int.Parse(param[2]);
            int puede = int.Parse(param[3]);
            int clieIdLog = int.Parse(lblClieIdOculto.Text);
            CargarGrilla(fecha, nodId, profId, puede, clieIdLog);
        }
    }
}