using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class GeneraFormularios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["ID_PACK"] != null)
            {
                
                int codigo =int.Parse(Request.QueryString["ID_PACK"].ToString());
                List<SinAlitas.Admin.Entidad.ProductoCodigo> proCod = SinAlitas.Admin.Negocio.ProductoCodigo.ObtenerProductosCodigoPorId(codigo);
                if (proCod != null && proCod.Count == 1)
                {
                    SinAlitas.Admin.Entidad.ProductoCodigo elemento = proCod[0];
                    //hay que verificar si acepta o no las condiciones antes
                    SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envoltorio = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(elemento.Id);
                    if (envoltorio.Condiciones != null && envoltorio.Condiciones.Id > 0)
                    {
                        List<SinAlitas.Admin.Entidad.FichaPack> fichas = SinAlitas.Admin.Negocio.FichaPack.ObtenerFichasPack(elemento.Id);
                        if (fichas != null && fichas.Count > 0)
                        {
                            //Response.Redirect("~/SeleccionHorasCliente.aspx?PCO_ID=" + codigo);
                            //se tiene que ir a la nueva pagina de inicio
                            Response.Redirect("InicioCliente.aspx");
                        }
                        else
                        {
                            MostrarCantidadAlumnos(elemento.CantidadAlumnos);
                        }
                    }
                    else
                    {
                        MostrarCantidadAlumnos(elemento.CantidadAlumnos);
                    }
                }
                else
                {
                    Response.Redirect("~/InicioCliente.aspx");
                }
            }
            else
                Response.Redirect("~/InicioCliente.aspx");
        }
    }
    private void MostrarCantidadAlumnos(int cantidadAlumnos)
    {
        
        List<SinAlitas.Admin.Entidad.FichaAlumnoEnvoltorio> fichasEnv = new List<SinAlitas.Admin.Entidad.FichaAlumnoEnvoltorio>();
        for (int i=0; i < cantidadAlumnos; i++)
        {
            SinAlitas.Admin.Entidad.FichaAlumnoEnvoltorio nn = new SinAlitas.Admin.Entidad.FichaAlumnoEnvoltorio();
            nn.Id = i + 1;
            if (i== 0)
                nn.EstiloItem = "panel-body panel-collapse collapse in";
            else
                nn.EstiloItem = "panel-body panel-collapse collapse";
            fichasEnv.Add(nn);
        }
        rptAlumnos.DataSource = fichasEnv;
        rptAlumnos.DataBind();
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InicioCliente.aspx");
    }

    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter.Length > 0)
        {
            //tomar los elementos que se deben guardar

        }
    }
    private void RecorrerRepeat()
    {
        bool exito = true;
        List<SinAlitas.Admin.Entidad.FichaAlumno> fichas = new List<SinAlitas.Admin.Entidad.FichaAlumno>();
        int cantidadGuardados = 0;
        try {
            if (rptAlumnos.Items != null)
            {
                foreach (RepeaterItem item in rptAlumnos.Items)
                {

                    ASPxTextBox txtNombres = item.FindControl("txtNombres") as ASPxTextBox;
                    ASPxTextBox txtEdad = item.FindControl("txtEdad") as ASPxTextBox;
                    ASPxComboBox cmbSexo = item.FindControl("cmbSexo") as ASPxComboBox;

                    ASPxComboBox cmbProblemasMotores = item.FindControl("cmbProblemasMotores") as ASPxComboBox;
                    ASPxTextBox txtProblemasMotores = item.FindControl("txtProblemasMotores") as ASPxTextBox;

                    ASPxComboBox cmbProblemasCardiacos = item.FindControl("cmbProblemasCardiacos") as ASPxComboBox;
                    ASPxTextBox txtProblemasCardiacos = item.FindControl("txtProblemasCardiacos") as ASPxTextBox;

                    ASPxComboBox cmbAsma = item.FindControl("cmbAsma") as ASPxComboBox;
                    ASPxTextBox txtOtro = item.FindControl("txtOtro") as ASPxTextBox;

                    ASPxTextBox txtNumero = item.FindControl("txtNumero") as ASPxTextBox;
                    ASPxTextBox txtDondeAcudir = item.FindControl("txtDondeAcudir") as ASPxTextBox;
                    ASPxTextBox txtObservacion = item.FindControl("txtObservacion") as ASPxTextBox;

                    //verificacion de datos requeridos
                    if (txtNombres.Text == string.Empty)
                    {
                        txtNombres.ValidationSettings.ErrorText = "*";
                        txtNombres.ValidationSettings.ErrorDisplayMode = ErrorDisplayMode.None;
                        txtNombres.IsValid = false;
                        break;
                    }
                    if (txtEdad.Text == string.Empty)
                    {
                        txtEdad.ValidationSettings.ErrorText = "*";
                        txtEdad.ValidationSettings.ErrorDisplayMode = ErrorDisplayMode.None;
                        txtEdad.IsValid = false;
                        break;
                    }
                    if (txtNumero.Text == string.Empty)
                    {
                        txtNumero.ValidationSettings.ErrorText = "*";
                        txtNumero.ValidationSettings.ErrorDisplayMode = ErrorDisplayMode.None;
                        txtNumero.IsValid = false;
                        break;
                    }
                    if (txtDondeAcudir.Text == string.Empty)
                    {
                        txtDondeAcudir.ValidationSettings.ErrorText = "*";
                        txtDondeAcudir.ValidationSettings.ErrorDisplayMode = ErrorDisplayMode.None;
                        txtDondeAcudir.IsValid = false;
                        break;
                    }
                    //recogemos las variables
                    SinAlitas.Admin.Entidad.FichaAlumno ficha = new SinAlitas.Admin.Entidad.FichaAlumno();
                    ficha.NombreCompleto = txtNombres.Text;
                    //hay que validar que sea solo numeros
                    ficha.Edad = int.Parse(txtEdad.Text);
                    ficha.Sexo = cmbSexo.Text;
                    ficha.TieneProblemasMotores = int.Parse(cmbProblemasMotores.Value.ToString());
                    ficha.CualesProblemasMotores = txtProblemasMotores.Text;
                    ficha.TieneProblemasCardiacos = int.Parse(cmbProblemasCardiacos.Value.ToString());
                    ficha.CualesProblemasCardiacos = txtProblemasCardiacos.Text;
                    ficha.TieneAsma = int.Parse(cmbAsma.Value.ToString());
                    ficha.OtraEnfermedad = txtOtro.Text;
                    ficha.NumeroEmergencia = txtNumero.Text;
                    ficha.DondeAcudir = txtDondeAcudir.Text;
                    ficha.Observacion = txtObservacion.Text;
                    int idAlumno = SinAlitas.Admin.Negocio.FichaAlumno.Insetar(ficha);
                    if (idAlumno > 0)
                    {
                        int codigo = int.Parse(Request.QueryString["ID_PACK"].ToString());
                        SinAlitas.Admin.Entidad.FichaPack fichapack = new SinAlitas.Admin.Entidad.FichaPack();
                        fichapack.Activo = 1;
                        fichapack.Eliminado = 0;
                        fichapack.FechaCreacion = DateTime.Now;
                        fichapack.IdAlumno = idAlumno;
                        fichapack.IdPack = codigo;
                        int idFichaPack = SinAlitas.Admin.Negocio.FichaPack.Insetar(fichapack);
                        cantidadGuardados++;

                    }



                }
                if (cantidadGuardados == rptAlumnos.Items.Count)
                {
                    //ir a la selección de horas.
                    int codigo = int.Parse(Request.QueryString["ID_PACK"].ToString());
                    List<SinAlitas.Admin.Entidad.ProductoCodigo> proCod = SinAlitas.Admin.Negocio.ProductoCodigo.ObtenerProductosCodigoPorId(codigo);
                    //se debe redireccionar a la nueva url
                    Response.Redirect("InicioCliente.aspx");
                }
            }
        }
        catch(Exception ex)
        {
            SinAlitas.Admin.Negocio.Utiles.Log(ex);
            
        }
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        //hay que recoger los elementos que se van a guardar
        //rptAlumnos
        RecorrerRepeat();
    }
}