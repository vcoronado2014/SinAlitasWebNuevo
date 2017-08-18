using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CONTROLES_Encabezado : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string TextoEncabezado
    {
        get { return litEncabezado.Text; }
        set { litEncabezado.Text = value; }
    }
}