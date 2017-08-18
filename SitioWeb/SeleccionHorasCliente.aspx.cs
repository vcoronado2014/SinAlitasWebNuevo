using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SeleccionHorasCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //ojo la query string trae el PCO_ID
            if (Request.QueryString["PCO_ID"] != null)
            {
                //nos traemos el envoltorio completo
                int pcoId = int.Parse(Request.QueryString["PCO_ID"]);
                SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envoltorio = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(pcoId);
                if (envoltorio.Condiciones != null && envoltorio.Condiciones.Id > 0)
                {
                    //verificamos si ya tiene todas las horas tomadas el pack
                    if (envoltorio.CuposTomados != null)
                    {
                        if (envoltorio.CuposTomados.Count  == envoltorio.ProductoCodigo.CantidadClases)
                        {
                            Response.Redirect("SeleccionarSemanasCliente.aspx?PCO_ID=" + envoltorio.ProductoCodigo.Id.ToString() + "&PROF_ID=" + envoltorio.CuposTomados[0].ProfId.ToString() + "&FECHA_ENTERA=" + SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(envoltorio.CuposTomados.FirstOrDefault().FechaHoraInicio));
                        }
                    }
                    hidPCO_ID.Value = pcoId.ToString();
                    List<SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo> cuposProfesor = SinAlitas.Admin.Negocio.EnvoltorioProfesorCupo.ListaProfesoresYCupos(envoltorio.Comuna.Id, pcoId);
                    rptCupos.DataSource = cuposProfesor;
                    rptCupos.DataBind();
                }
                else
                {
                    Response.Redirect("~/buscarpack.aspx");
                }
            }
            else
            {
                Response.Redirect("~/buscarpack.aspx");
            }
        }
    }

    //protected void rptCupos_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    var data = ((SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo)e.Item.DataItem).CuposProfesor;
    //    var repeater2 = (Repeater)e.Item.FindControl("rptCuposProfe");
    //    repeater2.DataSource = data;
    //    repeater2.DataBind();
    //}

    protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null)
        {
            //string[] valores = e.Parameter.Split('|');
            //int idProfe = int.Parse(valores[1]);
            //int fechaEntera = int.Parse(valores[0]);
            //List<SinAlitas.Admin.Negocio.EnvoltorioCupoMostrar> cupos = SinAlitas.Admin.Negocio.EnvoltorioProfesorCupo.ListaCuposProfeFecha(idProfe, fechaEntera);
            //if (!panelHoras.IsVisible())
            //{

            //    panelHoras.Visible = true;

            //}
            
            //DateTime fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(fechaEntera);
            //lblTituloPanel.Text = SinAlitas.Admin.Entidad.Utiles.EntregaFechaLetras(fecha);
            //rdbCupos.DataSource = cupos;
            //rdbCupos.DataBind();

            //hay que hacer la busqueda manual
            //foreach (RepeaterItem itm in rptCupos.Items)
            //{
            //    SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo item = (SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo)itm.DataItem;


            //}
            

        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/buscarpack.aspx");
    }
}