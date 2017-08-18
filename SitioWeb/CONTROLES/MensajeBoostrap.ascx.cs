using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class CONTROLES_MensajeBoostrap : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje estadoMensaje, string mensaje)
    {
        StringBuilder div = new StringBuilder();

        switch (estadoMensaje)
        {
            case SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto:
                litMensaje.Visible = true;
                div.AppendFormat("<div class='alert alert-success'>{0}</div>", mensaje);

                break;
            case SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error:
                litMensaje.Visible = true;
                div.AppendFormat("<div class='alert alert-danger'>{0}</div>", mensaje);
                break;
            case SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta:
                litMensaje.Visible = true;
                div.AppendFormat("<div class='alert alert-info'>{0}</div>", mensaje);
                break;
        }
        litMensaje.Text = div.ToString();
    }
}