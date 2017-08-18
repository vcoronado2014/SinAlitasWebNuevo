using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AceptaCondiciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID_PACK"] != null)
        {
            bool tieneAceptaCondiciones = false;
            bool tieneFichasAlumnos = false;
            lblIdPack.Text = Request.QueryString["ID_PACK"].ToString();
            //revisamos si existe o no en producto codigo y en las mismas acepta condiciones
            int pcoId = int.Parse(Request.QueryString["ID_PACK"]);
            SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envoltorio = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(pcoId);
            if (envoltorio.Condiciones != null && envoltorio.Condiciones.Id > 0)
            {
                //tiene el acepta condiciones debiera ir a generaFormularios
                tieneAceptaCondiciones = true;
            }
            if (envoltorio.FichaPack != null && envoltorio.FichaPack.Count > 0 && envoltorio.FichaPack.Count >= envoltorio.ProductoCodigo.CantidadAlumnos)
            {
                tieneFichasAlumnos = true;
            }
            //entonces
            if (tieneAceptaCondiciones && tieneFichasAlumnos == false)
            {
                //esto lo cambiamos, ahora será direccionada a una pgina informativa con sus clases
                Response.Redirect("~/GeneraFormularios.aspx?ID_PACK=" + envoltorio.ProductoCodigo.Id.ToString());
            }
            if (tieneAceptaCondiciones && tieneFichasAlumnos)
            {
                //esto lo cambiamos, ahora será direccionada a una pgina informativa con sus clases
                string profId = "";
                string fechaEntera = "";
                if (envoltorio.CuposTomados != null && envoltorio.CuposTomados.Count > 0) {
                    profId = envoltorio.CuposTomados[0].ProfId.ToString();
                    fechaEntera = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(envoltorio.CuposTomados.FirstOrDefault().FechaHoraInicio).ToString();
                }
                if (profId != "" && fechaEntera != "")
                    Response.Redirect("MostrarSemanasCliente.aspx?PCO_ID=" + envoltorio.ProductoCodigo.Id.ToString() + "&PROF_ID=" + envoltorio.CuposTomados[0].ProfId.ToString() + "&FECHA_ENTERA=" + SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(envoltorio.CuposTomados.FirstOrDefault().FechaHoraInicio));
                else
                    Response.Redirect("InicioCliente.aspx");
            }
        }
        else
            Response.Redirect("~/InicioCliente.aspx");
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InicioCliente.aspx");
    }
    protected void btnAceptar_Click(object sender, EventArgs e)
    {

        SinAlitas.Admin.Entidad.AceptaCondiciones acepta = new SinAlitas.Admin.Entidad.AceptaCondiciones();
        acepta.PcoId = int.Parse(Request.QueryString["ID_PACK"].ToString());
        acepta.FechaAcepta = DateTime.Now;
        acepta.EsAceptado = 1;
        acepta.EsCompletado = 0;
        acepta.Activo = 1;

        int id = SinAlitas.Admin.Negocio.AceptaCondiciones.Insetar(acepta);
        if (id > 0)
        {
            List<SinAlitas.Admin.Entidad.ProductoCodigo> pcos = SinAlitas.Admin.Negocio.ProductoCodigo.ObtenerProductosCodigoPorId(acepta.PcoId);
            if (pcos != null && pcos.Count == 1)
            {
                //coambiamos el estado del producto codigo
                pcos[0].Estado = 1; //aceptada por el cliente
                SinAlitas.Admin.Negocio.ProductoCodigo.Actualizar(pcos[0]);
            }
            Response.Redirect("~/GeneraFormularios.aspx?ID_PACK=" + Request.QueryString["ID_PACK"].ToString());
        }
        else
            Response.Redirect("~/InicioCliente.aspx");
    }
}