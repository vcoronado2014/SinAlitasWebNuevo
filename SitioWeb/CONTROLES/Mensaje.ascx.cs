using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CONTROLES_Mensaje : System.Web.UI.UserControl
{
    public void MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje estadoMensaje, string mensaje)
    {
        switch (estadoMensaje)
        {
            case SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto:
                imgOk.ClientVisible = true;
                lblMensaje.ForeColor = System.Drawing.Color.Black;

                break;
            case SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error:
                imgError.ClientVisible = true;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                break;
            case SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta:
                imgWarning.ClientVisible = true;
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                break;
        }
        pnlPrinciapl.ClientVisible = true;
        lblMensaje.Text = mensaje;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}