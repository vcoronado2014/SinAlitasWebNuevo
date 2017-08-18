using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContenidoProfesor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
            if (Request.QueryString["NOMBRE_USUARIO"] != null && Request.QueryString["CONTRASENA"] != null)
            {
                string usuario = Request.QueryString["NOMBRE_USUARIO"];
                string contrasena = Request.QueryString["CONTRASENA"];
                envProfesor = SinAlitas.Admin.Negocio.Profesor.ObtenerEnvoltorioProfesorPorUsuarioPassword(usuario, contrasena);
                Session["USUARIO_AUTENTICADO"] = envProfesor;
            }


            if (Session["USUARIO_AUTENTICADO"] != null)
            {
                envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
                if (envProfesor.Rol.Id > 0)
                {
                    switch (envProfesor.Rol.Id)
                    {
                        case 1: //Super Administrador
                            break;
                        case 2://Supervisor
                            Response.Redirect("~/InicioSupervisor.aspx");
                            break;
                    }


                }
                else
                    Response.Redirect("~/Login.aspx");
                if (envProfesor != null && envProfesor.Profesor.Id > 0)
                {
                    //volver a poner un encabezado
                    litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                    //Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                    //valido
                    //los meses del combo
                    int idMes = 0;
                    int anno = 0;
                    //List<SinAlitas.Admin.Entidad.Meses> meses = SinAlitas.Admin.Entidad.Utiles.RetornaMesesProfesor();
                    List<SinAlitas.Admin.Entidad.Meses> meses = SinAlitas.Admin.Entidad.Utiles.RetornaMesesAnnoProfesor();
                    cmbMeses.DataSource = meses;
                    cmbMeses.DataBind();

                    //seleccionamos mes actual
                    if (Request.QueryString["ID_MES"] != null)
                    {
                        idMes = int.Parse(Request.QueryString["ID_MES"]);
                    }
                    else
                        idMes = DateTime.Now.Month;

                    if (Request.QueryString["ID_ANNO"] != null)
                        anno = int.Parse(Request.QueryString["ID_ANNO"]);
                    else
                        anno = DateTime.Now.Year;

                    //cmbMeses.Value = idMes.ToString();
                    cmbMeses.Value = idMes;
                    //seteo de variables ocultas
                    lblNodIdOculto.Text = envProfesor.Profesor.NodId.ToString();
                    lblProfIdOculto.Text = envProfesor.Profesor.Id.ToString();

                    ActualizarAgenda(envProfesor.Nodo.Id, idMes, envProfesor.Profesor.Id, anno);
                    //hlVolver.NavigateUrl = "inicio.aspx";

                    //mensaje de prueba
                    //SinAlitas.Admin.Mensajeria.MensajesPush.EnviarPush("Mensjae");

                    //  envProfesor.Profesor.NombreUsuario

                }
                else
                    Response.Redirect("~/login.aspx");
            }
            else
                Response.Redirect("~/login.aspx");



        }
    }
    private void ActualizarAgenda(int nodId, int mesInicio, int profId, int anno)
    {
        SinAlitas.Admin.Entidad.SegmentoMostrarFecha segmento = SinAlitas.Admin.Negocio.SegmentoHorario.ContruirSegmentosFechaNuevo(nodId, mesInicio, profId, anno);
        //SinAlitas.Admin.Entidad.SegmentoMostrarFecha segmento = SinAlitas.Admin.Negocio.SegmentoHorario.ContruirSegmentosFechan(nodId, mesInicio, profId);

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
            string[] mesAnno = param[0].Split(',');

            int idMes = 0;
            switch(mesAnno[0].Replace(" ", "").ToUpper())
            {
                case "ENERO":
                    idMes = 1;
                    break;
                case "FEBRERO":
                    idMes = 2;
                    break;
                case "MARZO":
                    idMes = 3;
                    break;
                case "ABRIL":
                    idMes = 4;
                    break;
                case "MAYO":
                    idMes = 5;
                    break;
                case "JUNIO":
                    idMes = 6;
                    break;
                case "JULIO":
                    idMes = 7;
                    break;
                case "AGOSTO":
                    idMes = 8;
                    break;
                case "SEPTIEMBRE":
                    idMes = 9;
                    break;
                case "OCTUBRE":
                    idMes = 10;
                    break;
                case "NOVIEMBRE":
                    idMes = 11;
                    break;
                case "DICIEMBRE":
                    idMes = 12;
                    break;
                default:
                    idMes = int.Parse(mesAnno[0]);
                    break;

            }

            int anno = int.Parse(mesAnno[1].Replace(" ", "").ToString());
            ActualizarAgenda(nodId, idMes, profId, anno);
        }
    }
}