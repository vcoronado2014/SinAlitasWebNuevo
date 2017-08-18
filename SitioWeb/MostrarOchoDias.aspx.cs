using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MostrarOchoDias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //recibimos las variables query string

        }
    }
    private void Desactivar()
    {
        ASPxRadioButtonList1.SelectedIndex = -1;
        ASPxRadioButtonList1.ClientEnabled = false;
        btnGuardar.ClientEnabled = false;

    }  
    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null && e.Parameter.Length > 0)
        {
            int idNodo = 0;
            int idProfesor = 0;
            int pcoId = 0;
            int idCupoReagendar = 0;
            if (Request.QueryString["NOD_ID"] != null && Request.QueryString["PROF_ID"] != null && Request.QueryString["PCO_ID"] != null && Request.QueryString["CUPO_ID_REAGENDAR"] != null)
            {
                idNodo = int.Parse(Request.QueryString["NOD_ID"]);
                idProfesor = int.Parse(Request.QueryString["PROF_ID"]);
                pcoId = int.Parse(Request.QueryString["PCO_ID"]);
                SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envProCod = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(pcoId);
                SinAlitas.Admin.Entidad.Profesor profesor = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPord(idProfesor);

                idCupoReagendar = int.Parse(Request.QueryString["CUPO_ID_REAGENDAR"]);
                //ahora vamos a revisar el cupo seleccionado
                DevExpress.Web.ListEditItem itemSeleccionado = ASPxRadioButtonList1.SelectedItem;
                if (itemSeleccionado != null && itemSeleccionado.Value != null)
                {
                    //algunas verificaciones antes.
                    int idCupoNuevo = int.Parse(itemSeleccionado.Value.ToString());
                    SinAlitas.Admin.Entidad.Cupo cupoLiberar = SinAlitas.Admin.Negocio.Cupo.ObtenerCupoPorId(idCupoReagendar);
                    if (cupoLiberar != null && cupoLiberar.Id > 0)
                    {
                        SinAlitas.Admin.Entidad.Cupo cupoNuevo = SinAlitas.Admin.Negocio.Cupo.ObtenerCupoPorId(idCupoNuevo);
                        if (cupoNuevo != null && cupoNuevo.Id > 0)
                        {
                            //si existen ambnos, tanto el nuevo como el reagendado entonces.

                            if (cupoLiberar.FechaHoraInicio >= DateTime.Now.AddHours(3))
                            {
                                if (cupoNuevo.FechaHoraInicio >= DateTime.Now.AddHours(3))
                                {
                                    //hasta acá todo bien
                                    //ahora modificamos ambos cupos
                                    bool modificadoExitoNuevo = false;
                                    bool modificadoExitoAntiguo = false;
                                    //partimos coin el antiguo
                                    #region cupo antiguo
                                    cupoLiberar.Activo = 1;
                                    cupoLiberar.ClieId = 0;
                                    cupoLiberar.Descripcion = "";
                                    cupoLiberar.Eliminado = 0;
                                    cupoLiberar.EstadoCupo = 1;//agendado
                                    cupoLiberar.PcoId = 0;
                                    if (SinAlitas.Admin.Negocio.Cupo.Actualizar(cupoLiberar) > 0)
                                        modificadoExitoAntiguo = true;
                                    #endregion
                                    #region cupo nuevo
                                    cupoNuevo.Activo = 1;
                                    cupoNuevo.ClieId = envProCod.Cliente.Id;
                                    cupoNuevo.Descripcion = envProCod.Cliente.Nombres + " " + envProCod.Cliente.PrimerApellido;
                                    cupoNuevo.Eliminado = 0;
                                    cupoNuevo.EstadoCupo = 2;//tomado
                                    cupoNuevo.PcoId = envProCod.ProductoCodigo.Id;
                                    if (SinAlitas.Admin.Negocio.Cupo.Actualizar(cupoNuevo) > 0)
                                        modificadoExitoNuevo = true;
                                    #endregion  

                                    if (modificadoExitoNuevo && modificadoExitoAntiguo)
                                    {
                                        //todo ok y bloquear
                                        Desactivar();
                                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Su reagendamiento de la clase ha sido correcto, cierre la ventana para volver a la anterior.");

                                        //envio de mensajes
                                        SinAlitas.Admin.Entidad.Cliente cliente = envProCod.Cliente;

                                        if (cliente != null && cliente.Email != "")
                                        {
                                            string nombreCliente = cliente.Nombres + " " + cliente.PrimerApellido;
                                            string nombreProfesor = profesor.Nombres + " " + profesor.PrimerApellido;
                                            if (SinAlitas.Admin.Mensajeria.Utiles.ENVIA_CORREOS_CLIENTE() == "1")
                                            {
                                                //correo al cliente
                                                //string mensaje = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeCrearCodigoCliente(codigoCliente);
                                                string mensajeParaElProfesor = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeClaseCanceladaPorElCliente(profesor, cliente, cupoLiberar, cupoNuevo);

                                                //string mensajeProfesor = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeClaseCreadaParaElProfesor(nombreCliente, cupoNuevo.FechaHoraInicio.ToShortDateString(), cliente.Direccion);

                                                //string mensajeCliente = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeClaseCreadaParaElCliente(nombreProfesor, cupoNuevo.FechaHoraInicio.ToShortDateString());
                                                //List<string> correos = new List<string>();
                                                //correos.Add(cliente.Email);
                                                List<string> correosProf = new List<string>();
                                                correosProf.Add(profesor.Email);

                                                //SinAlitas.Admin.Mensajeria.CorreoPop.EnviarCorreo(correos, mensajeCliente);
                                                SinAlitas.Admin.Mensajeria.CorreoPop.EnviarCorreo(correosProf, mensajeParaElProfesor);
                                            }
                                            if (SinAlitas.Admin.Mensajeria.Utiles.ENVIA_SMS() == "1")
                                            {
                                                if (cliente.TelefonosContacto != "")
                                                {
                                                    string celular = cliente.TelefonosContacto.Replace("+", "").Trim().Replace(" ", "");
                                                    string mensajeProf = SinAlitas.Admin.Mensajeria.MensajesSMS.RetornaMensajeClaseReagendadaParaElProfesor(nombreCliente, cupoLiberar.FechaHoraInicio.ToShortDateString() + " " + cupoLiberar.FechaHoraInicio.ToShortTimeString() + " " + cupoLiberar.FechaHoraTermino.ToShortTimeString(), "", cupoNuevo.FechaHoraInicio.ToShortDateString() + " " + cupoNuevo.FechaHoraInicio.ToShortTimeString() + " " + cupoNuevo.FechaHoraTermino.ToShortTimeString());
                                                    //string mensajeCliente = SinAlitas.Admin.Mensajeria.MensajesSMS.RetornaMensajeClaseCreadaParaElCliente(nombreProfesor, cupoNuevo.FechaHoraInicio.ToShortDateString());
                                                    //SinAlitas.Admin.Mensajeria.MensajesSMS.Enviar(profesor.TelefonosContacto, mensajeProf);
                                                    //SinAlitas.Admin.Mensajeria.MensajesSMS.Enviar(celular, mensajeCliente);
                                                    SinAlitas.Admin.Mensajeria.MensajesSMS.EnviarTwilio(celular, mensajeProf);

                                                }
                                            }
                                        }
                                    }
                                    else
                                    {
                                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Hubo un error al guardar los cupos, contacte al supervisor con su codigo de pack.");
                                        Desactivar();
                                    }

                                }
                                else
                                {
                                    //el cupo a liberar tiene menos de 24 horas.
                                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "No puede reagendar una clase nueva con menos de 3 horas de anticipación.");
                                    Desactivar();
                                }
                            }
                            else
                            {
                                //el cupo a liberar tiene menos de 24 horas.
                                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "No puede reagendar una clase con menos de 3 horas.");
                                Desactivar();
                            }
                        }
                        else
                        {
                            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Ha ocurrido un error con el nuevo cupo, inténtelo de nuevo cerrando esta ventana.");
                            Desactivar();
                        }
                    }
                    else
                    {
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "El cupo ha liberar no existe, cierre la ventana e inténtelo nuevamente.");
                        Desactivar();
                    }
                }
                else
                {
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Debe seleccionar un nuevo segmento horario antes de guardar.");
                    //Desactivar();
                }


            }
            else
            {
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Parametros nulos, cierre el popup y vuelva a intentarlo.");
                Desactivar();
            }
        }
    }
}