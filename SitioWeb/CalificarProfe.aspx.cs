using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CalificarProfe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack) {
            if (Request.QueryString["PROF_ID"] != null && Request.QueryString["PCO_ID"] != null)
            {
                int idProfe = int.Parse(Request.QueryString["PROF_ID"]);
                SinAlitas.Admin.Entidad.Profesor profe = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPord(idProfe);
                if (profe != null && profe.Id > 0)
                {
                    litNombre.Text = profe.Nombres + " " + profe.PrimerApellido + " " + profe.SegundoApellido;
                    List<SinAlitas.Admin.Entidad.CalificacionesProfesor> calificaciones =
                        SinAlitas.Admin.Negocio.CalificacionesProfesor.ObtenerCalificacionesPorProfId(profe.Id);
                    litEvaluadasCincoEstrellas.Text = "0";
                    litEvaluadasFinalizadas.Text = "0";
                    litPromedioEvaluacion.Text = "0";
                    if (calificaciones != null && calificaciones.Count > 0)
                    {
                        int evaluadas = calificaciones.Count;
                        litEvaluadasFinalizadas.Text = evaluadas.ToString();
                        int cincoEstrellas = calificaciones.Count(p => p.Calificacion == 5);
                        litEvaluadasCincoEstrellas.Text = cincoEstrellas.ToString();
                        int totalValores = calificaciones.Sum(p => p.Calificacion);
                        int promedio = 0;
                        if (evaluadas > 0)
                            promedio = totalValores / evaluadas;

                        litPromedioEvaluacion.Text = promedio.ToString();
                    }


                }
            }
        //}
    }
    private void Desactivar()
    {
        btnGuardar.ClientVisible = false;
    }
    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null && e.Parameter.Length > 0)
        {

            int pcoId = int.Parse(Request.QueryString["PCO_ID"]);
            int idProfe = int.Parse(Request.QueryString["PROF_ID"]);
            //obtenemos las calificaciones del profe
            List<SinAlitas.Admin.Entidad.CalificacionesProfesor> calificaciones =
                        SinAlitas.Admin.Negocio.CalificacionesProfesor.ObtenerCalificacionesPorProfId(idProfe);
            if (!calificaciones.Exists(p => p.PcoId == pcoId))
            {
                int valorCalificacion = int.Parse(ASPxRatingControl1.Value.ToString());

                if (pcoId > 0 && idProfe > 0)
                {
                    SinAlitas.Admin.Entidad.CalificacionesProfesor cal = new SinAlitas.Admin.Entidad.CalificacionesProfesor();
                    cal.Calificacion = valorCalificacion;
                    cal.Fecha = DateTime.Now;
                    if (memObservaciones.Text != "")
                        cal.Observacion = memObservaciones.Text;
                    else
                        cal.Observacion = "";
                    cal.PcoId = pcoId;
                    cal.ProfId = idProfe;
                    int guardado = SinAlitas.Admin.Negocio.CalificacionesProfesor.Insetar(cal);
                    if (guardado > 0)
                    {
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Guardado con éxito, puede cerrar la ventana.");
                        Desactivar();
                    }
                    else
                    {
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Se produjo un error al guardar, contácte al Administrador.");
                    }
                }
                else
                {
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Error al obtener profesor o producto, contácte al Administrador.");
                }
            }
            else
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "El Profesor ya fué evaluado por Usted.");

        }
    }
}