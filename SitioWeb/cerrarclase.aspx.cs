using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cerrarclase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["NOMBRE_CLIENTE"] != null && Request.QueryString["ID"] != null)
        {
            litNombre.Text = Request.QueryString["NOMBRE_CLIENTE"];
        }

    }

    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null && e.Parameter.Length > 0)
        {
            string nombreCliente = "";
            int id = 0;
            if (Request.QueryString["NOMBRE_CLIENTE"] != null && Request.QueryString["ID"] != null)
            {
                nombreCliente = Request.QueryString["NOMBRE_CLIENTE"];
                id = int.Parse(Request.QueryString["ID"]);
                //AHORA PROCESAMOS EL ID Y CAMBIAMOS DE ESTADO E INSERTAMOS LA OBSERVACION
                //EL ESTADO ES 3 TERMINADA
                SinAlitas.Admin.Entidad.Cupo cupo = SinAlitas.Admin.Negocio.Cupo.ObtenerCupoPorId(id);
                if (cupo != null && cupo.Id > 0)
                {
                    //antes debemos validar fechas
                    DateTime fechaCupo = cupo.FechaHoraTermino;
                    if (fechaCupo < DateTime.Now)
                    {
                        cupo.EstadoCupo = 3; //terminada
                        SinAlitas.Admin.Entidad.ObservacionesProfesor obs = new SinAlitas.Admin.Entidad.ObservacionesProfesor();
                        obs.CpoId = cupo.Id;
                        obs.Observacion = memObservaciones.Text;
                        obs.PcoId = cupo.PcoId;
                        //guardamos el cupo
                        if (SinAlitas.Admin.Negocio.Cupo.Actualizar(cupo) > 0)
                        {
                            if (SinAlitas.Admin.Negocio.ObservacionesProfesor.Insetar(obs) > 0)
                            {
                                btnGuardar.ClientVisible = false;
                                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Guardado con éxito, cierre esta ventana.");
                                #region insertar historial
                                SinAlitas.Admin.Entidad.HistorialMovimiento historial = new SinAlitas.Admin.Entidad.HistorialMovimiento();
                                historial.TipoMovimiento = "Profesor cierra Clase|" + cupo.Id.ToString();
                                historial.UsuarioMovimiento = cupo.ProfId;
                                historial.UsuarioOrigen = cupo.ProfId;
                                SinAlitas.Admin.Negocio.HistorialMovimiento.Insetar(historial);
                                #endregion
                            }
                            else
                            {
                                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Error al guardar la observación");
                            }
                        }
                        else
                        {
                            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Error al actualizar el estado de la clase.");
                        }

                    }
                    else
                    {
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "No puede cerrar una clase con fecha anterior a que se termine.");
                    }
                    

                }
                else
                {
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Error al obtener el cupo");
                }

            }
            else
            {
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Error al obtener el cupo");
            }




        }
    }
}