using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class InicioCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }

    protected void grillaResultados_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters.Length > 0)
        {
            odsBusqueda.SelectParameters[0].DefaultValue = e.Parameters;
            odsBusqueda.DataBind();
            grillaResultados.DataBind();
        }
    }

    protected void pnlGeneral_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter.Length > 0)
            lblIdPack.Text = e.Parameter;
    }
}
