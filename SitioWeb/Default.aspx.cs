using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //List<string> correos = new List<string>();
        //correos.Add("nntroncoso@gmail.com");
        //correos.Add("vcoronado@saydex.cl");
        //SinAlitas.Admin.Mensajeria.CorreoPop.EnviarCorreo(correos, "Prueba de correo para ver como se comporta el servidor de Cpas.cl.");
        //SinAlitas.Admin.Mensajeria.MensajesSMS.Enviar("56985006988");
        //SinAlitas.Admin.Negocio.Utiles.Log("prueba");

    }

    protected void btnCliente_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InicioCliente.aspx");
    }

    protected void btnProfesor_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}