using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CancelarClase : System.Web.UI.Page
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
                SinAlitas.Admin.Entidad.Cliente cliente = SinAlitas.Admin.Negocio.Cliente.ObtenerClientePorId(cupo.ClieId);
                if (cupo != null && cupo.Id > 0)
                {
                    //antes debemos validar fechas
                    DateTime fechaCupo = cupo.FechaHoraTermino;
                    if (fechaCupo.AddHours(24) > DateTime.Now)
                    {


                        //SinAlitas.Admin.Entidad.ObservacionesProfesor obs = new SinAlitas.Admin.Entidad.ObservacionesProfesor();
                        //obs.CpoId = cupo.Id;
                        //obs.Observacion = memObservaciones.Text;
                        //obs.PcoId = cupo.PcoId;
                        //guardamos el cupo
                        SinAlitas.Admin.Entidad.CancelacionClase obs = new SinAlitas.Admin.Entidad.CancelacionClase();
                        obs.CpoId = cupo.Id;
                        obs.FechaCancelacion = DateTime.Now;
                        obs.Motivo = memObservaciones.Text;
                        obs.PcoId = cupo.PcoId;
                        obs.ProfId = cupo.ProfId;


                        cupo.EstadoCupo = 0; //lo volvemnos a 0
                        cupo.PcoId = 0;
                        cupo.ClieId = 0;
                        cupo.Descripcion = "";
                        if (memObservaciones.Text != "")
                        {
                            if (SinAlitas.Admin.Negocio.Cupo.Actualizar(cupo) > 0)
                            {
                                if (SinAlitas.Admin.Negocio.CancelacionClase.Insetar(obs) > 0)
                                {
                                    btnGuardar.ClientVisible = false;
                                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Clase cancelada, cierre esta ventana.");
                                    //envio de mensajes
                                    //SinAlitas.Admin.Entidad.Cliente cliente = SinAlitas.Admin.Negocio.Cliente.ObtenerClientePorId(cupo.ClieId);
                                    //insertar al historial
                                    #region insertar historial
                                    SinAlitas.Admin.Entidad.HistorialMovimiento historial = new SinAlitas.Admin.Entidad.HistorialMovimiento();
                                    historial.TipoMovimiento = "Profesor Cancela Clase|" + cupo.Id.ToString();
                                    historial.UsuarioMovimiento = cupo.ProfId;
                                    historial.UsuarioOrigen = cupo.ProfId;
                                    SinAlitas.Admin.Negocio.HistorialMovimiento.Insetar(historial);
                                    #endregion

                                    if (cliente != null && cliente.Email != "")
                                    {
                                        string nombreCliente2 = cliente.Nombres + " " + cliente.PrimerApellido;
                                        if (SinAlitas.Admin.Mensajeria.Utiles.ENVIA_CORREOS_CLIENTE() == "1")
                                        {
                                            //correo al cliente

                                            string mensajeProfesor = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeClaseCanceladaPorElProfesor(cupo);

                                            List<string> correos = new List<string>();
                                            correos.Add(cliente.Email);

                                            SinAlitas.Admin.Mensajeria.CorreoPop.EnviarCorreo(correos, mensajeProfesor);
                                        }
                                        if (SinAlitas.Admin.Mensajeria.Utiles.ENVIA_SMS() == "1")
                                        {
                                            if (cliente.TelefonosContacto != "")
                                            {
                                                string celular = cliente.TelefonosContacto.Replace("+", "").Trim().Replace(" ", "");
                                                string mensajeProf = SinAlitas.Admin.Mensajeria.MensajesSMS.RetornaMensajeClaseCanceladaPorElProfesor(cupo.FechaHoraInicio.ToShortTimeString() + " " + cupo.FechaHoraInicio.ToShortTimeString());
                                                SinAlitas.Admin.Mensajeria.MensajesSMS.EnviarTwilio(celular, mensajeProf);

                                            }
                                        }
                                    }

                                }
                                else
                                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Error al actualizar la clase, no pudo guardarse la observación.");
                            }
                            else
                            {
                                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Error al actualizar el estado de la clase.");
                            }
                        }
                        else
                            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "El motivo de cancelación es requerido, ingréselo.");

                    }
                    else
                    {
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "No puede cancelar una clase con menos de 24 horas de anticipación");
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