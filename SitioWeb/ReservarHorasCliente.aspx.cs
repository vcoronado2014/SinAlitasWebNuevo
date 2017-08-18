using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class ReservarHorasCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //AQUI VAMOS A PONER UNA PAGINA INTERMEDIA QUE MUESTRE LAS SEMANAS DEL PROFESOR}

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["PCO_ID"] != null && Request.QueryString["PROF_ID"] != null && Request.QueryString["FECHA_ENTERA"] != null)
            {
                int pcoId = int.Parse(Request.QueryString["PCO_ID"]);
                int profId = int.Parse(Request.QueryString["PROF_ID"]);
                DateTime fechaInicioSemana = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(int.Parse(Request.QueryString["FECHA_ENTERA"]));
                SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envoltorio = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(pcoId);
                //acá buscamos la semana
                List<SinAlitas.Admin.Entidad.Semanas> semanas = SinAlitas.Admin.Entidad.Utiles.RetornaSemanas(DateTime.Now);
                if (envoltorio != null && envoltorio.Cliente != null && envoltorio.Cliente.Id > 0)
                {
                    TraeProfesorYCupos(profId, envoltorio.Cliente.ComId, envoltorio.ProductoCodigo.CantidadClases, fechaInicioSemana);

                }
                else
                {
                    Response.Redirect("~/SeleccionHorasCliente.aspx?PCO_ID=" + pcoId.ToString());
                }
            }
        }
    }

    private void TraeProfesorYCupos(int profId, int comId, int cantidadClases, DateTime fechaInicioSemana)
    {
        //traer al profesor y sus cupos
        SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo envProfe =
            SinAlitas.Admin.Negocio.EnvoltorioProfesorCupo.ObtenerProfesorYCupos(profId, comId, cantidadClases, fechaInicioSemana);
        if (envProfe != null && envProfe.Profesor.Id > 0)
        {
            //ahora asignamos valores... ojo que falta asociar esto
            if (envProfe.Profesor.Fotografia != null && envProfe.Profesor.Fotografia != string.Empty)
                imgProfesor.ImageUrl = envProfe.Profesor.Fotografia;
            else
                imgProfesor.ImageUrl = "img/no_disponible.png";
            //*********
            litNombreProfesor.Text = envProfe.Profesor.Nombres + " " + envProfe.Profesor.PrimerApellido + " " + envProfe.Profesor.SegundoApellido;
            //mostramos las horas contratadas por el cliente
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("Usted contrató {0} clases en su servicio, puede agendar un mínimo de {1} clases.", cantidadClases.ToString(), "4");
            litClasesAgendar.Text = sb.ToString();
            //ahora tenemos lños cupos y los días disponibles del profesor
            if (envProfe.CuposMostrar != null && envProfe.CuposMostrar.Count > 0)
            {
                rptCupos.DataSource = envProfe.CuposMostrar;
                rptCupos.DataBind();
            }


        }
    }
    protected void rptCupos_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
        var data2 = ((SinAlitas.Admin.Entidad.CupoMostrarProfesor)e.Item.DataItem);
        //var listBoxCupos = ((DevExpress.Web.ASPxListBox)e.Item.DataItem);
        var panel = (DevExpress.Web.ASPxRoundPanel)e.Item.FindControl("rpPrincipal");
        if (panel != null)
        {
            var list = ((DevExpress.Web.ASPxRadioButtonList)panel.FindControl("listBoxCupos"));
            if (list != null)
            {
                list.ClientInstanceName = data2.NombreListBox;
                list.DataSource = data2.Cupos;
                list.DataBind();
            }
        }
        //var listBoxCupos = (DevExpress.Web.ASPxRadioButtonList)e.Item.FindControl("listBoxCupos");
        //var repeater2 = (Repeater)e.Item.FindControl("rptHoras");
        //repeater2.DataSource = data2.Cupos;
        //repeater2.DataBind();
        //listBoxCupos.DataSource = data2.Cupos;
        //listBoxCupos.DataBind();

    }

    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null && e.Parameter.Length > 0)
        {
            Procesar();
        }
    }
    private void Procesar()
    {
        //contador de selecciones
        int contadorSeleccionados = 0;
        List<SinAlitas.Admin.Entidad.Cupo> cuposSeleccionados = new List<SinAlitas.Admin.Entidad.Cupo>();
        //hay que treaer las que ya tiene agendados
        int pcoId = int.Parse(Request.QueryString["PCO_ID"]);
        int profId = int.Parse(Request.QueryString["PROF_ID"]);
        DateTime fechaInicioSemana = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(int.Parse(Request.QueryString["FECHA_ENTERA"]));
        SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envoltorio = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(pcoId);
        bool yaEstaTomado = false;
        int cuposTomados = 0;

        //antes de recorrer los controles se debe verificar si 
        //el cliente ya tiene cupos tomados para este pack
        if (envoltorio != null && envoltorio.CuposTomados != null)
        {
            cuposTomados = envoltorio.CuposTomados.Count;
            if (envoltorio.CuposTomados.Count == envoltorio.ProductoCodigo.CantidadClases)
            {
                yaEstaTomado = true;
            }
        }

        if (yaEstaTomado == false)
        {
            //estamos tomando cupos semanalmente, por lo tanto debemos controlar que la cantidad de cupos que ya fueron tomados
            //en esta semana no supere los 3, por lo tanto

            SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo profCpo = SinAlitas.Admin.Negocio.EnvoltorioProfesorCupo.ObtenerProfesorYCupos(profId, envoltorio.Comuna.Id, envoltorio.ProductoCodigo.CantidadClases, fechaInicioSemana);
            int cuposYaTomadosSemana = 0;
            DateTime fechaTerminoSemana = Convert.ToDateTime(fechaInicioSemana.ToShortDateString() + " 06:00").AddDays(6);
            cuposYaTomadosSemana = envoltorio.CuposTomados.FindAll(p => p.FechaHoraInicio >= fechaInicioSemana && p.FechaHoraTermino <= fechaTerminoSemana).Count;
            string fechaMensaje = "";

            //if (cuposYaTomadosSemana <= 3)
            //{

            #region recorrer repetaer y obtener cupos seleccionados
            if (rptCupos.Controls != null)
            {
                foreach (Control ctr in rptCupos.Controls)
                {
                    if (ctr is RepeaterItem)
                    {
                        if (ctr.Controls != null && ctr.Controls.Count > 0)
                        {
                            foreach (Control ct in ctr.Controls)
                            {
                                if (ct is DevExpress.Web.ASPxRoundPanel)
                                {
                                    Control rdb = ct.FindControl("listBoxCupos");

                                    if (rdb != null && rdb is DevExpress.Web.ASPxRadioButtonList)
                                    {
                                        DevExpress.Web.ASPxRadioButtonList radio = ((DevExpress.Web.ASPxRadioButtonList)rdb);
                                        int indiceSeleccionado = radio.SelectedIndex;
                                        if (indiceSeleccionado >= 0)
                                        {
                                            int idCupo = 0;
                                            if (radio.Value != null)
                                            {
                                                idCupo = int.Parse(radio.Value.ToString());
                                                SinAlitas.Admin.Entidad.Cupo cpo = SinAlitas.Admin.Negocio.Cupo.ObtenerCupoPorId(idCupo);
                                                //algunas validaciones antes
                                                if (cpo != null && cpo.Id > 0)
                                                {
                                                    if (cpo.PcoId == 0)
                                                    {
                                                        cuposSeleccionados.Add(cpo);
                                                    }
                                                    else
                                                    {
                                                        //informar que ya se tomó ese cupo
                                                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "La clase " + cpo.FechaHoraInicio.ToShortDateString() + " ya fué tomada por otro Cliente, vuelva a seleccionar.");
                                                        break;
                                                    }
                                                }

                                            }

                                            contadorSeleccionados++;
                                        }
                                    }

                                }
                            }
                        }
                    }
                }
            }
            #endregion
            //antes debemos validar los seleccionados vs los que ya tiene
            int totalGeneral = cuposSeleccionados.Count + cuposTomados;
            if (totalGeneral > envoltorio.ProductoCodigo.CantidadClases)
            {
                int eliminar = totalGeneral - envoltorio.ProductoCodigo.CantidadClases;
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Usted ha seleccionado más clases de las que tiene disponibles para este pack, elimine " + eliminar.ToString());
                //Descativar();
            }
            else
            {
                bool correcto = true;
                int cuposGuardados = 0;

                //cambiar cosas de los cupos

                if (envoltorio != null && envoltorio.Cliente != null && envoltorio.Cliente.Id > 0)
                {

                    foreach (SinAlitas.Admin.Entidad.Cupo cp in cuposSeleccionados)
                    {
                        if (cp.FechaHoraInicio.AddHours(3) > DateTime.Now)
                        {
                            //verificar si ya tiene una clase tomada esta misma semana
                            //veamos si existen duplicados
                            List<SinAlitas.Admin.Entidad.Cupo> listaEliminar =
                                SinAlitas.Admin.Negocio.Cupo.ListarCuposEliminar(profId, cp.SghId, SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(cp.FechaHoraInicio), cp.Id);

                            if (listaEliminar != null && listaEliminar.Count > 0)
                            {
                                foreach(SinAlitas.Admin.Entidad.Cupo cpEl in listaEliminar)
                                {
                                    SinAlitas.Admin.Negocio.Cupo.Eliminar(cpEl);
                                }
                            }
                            //verificamos si ya existe

                            cp.Descripcion = "Clase tomada por " + envoltorio.Cliente.Nombres + " " + envoltorio.Cliente.PrimerApellido;
                            cp.EstadoCupo = 2;
                            cp.PcoId = pcoId;
                            cp.ProfId = profId;
                            cp.ClieId = envoltorio.Cliente.Id;
                            //guardar los cupos y modificar los demas elementos
                            //entre ellos la revalorización del servicio
                            if (SinAlitas.Admin.Negocio.Cupo.Actualizar(cp) > 0)
                            {
                                fechaMensaje = cp.FechaHoraInicio.ToShortDateString();
                                cuposGuardados++;
                            }
                        }
                        else
                        {
                            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "No se puede tomar una clase que ya pasó.");
                            correcto = false;
                            break;
                        }

                    }
                }
                else
                {
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Error al encontrar al Cliente.");
                    //Descativar();
                }
                //aca deberiamos actualizar el data set
                TraeProfesorYCupos(profId, envoltorio.Comuna.Id, envoltorio.ProductoCodigo.CantidadClases, fechaInicioSemana);
                if (correcto)
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Se han agendado " + cuposGuardados.ToString() + " con éxito.");

                if (cuposGuardados > 0 && totalGeneral == envoltorio.ProductoCodigo.CantidadClases)
                {
                    //envio de mensajes
                    #region mensaje de correo y sms
                    SinAlitas.Admin.Entidad.Cliente cliente = envoltorio.Cliente;
                    if (cliente != null && cliente.Email != "")
                    {
                        string nombreCliente = envoltorio.Cliente.Nombres + " " + envoltorio.Cliente.PrimerApellido;
                        string nombreProfesor = profCpo.Profesor.Nombres + " " + profCpo.Profesor.PrimerApellido;
                        SinAlitas.Admin.Entidad.Cupo primerCupo = envoltorio.CuposTomados.FirstOrDefault();
                        if (SinAlitas.Admin.Mensajeria.Utiles.ENVIA_CORREOS_CLIENTE() == "1")
                        {
                            //correo al cliente
                            //string mensaje = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeCrearCodigoCliente(codigoCliente);
                            
                            if (primerCupo != null)
                            {
                                //este esta ok
                                string mensajeProfesor = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeClaseCreadaParaElProfesor(primerCupo);
                                //este no
                                string mensajeCliente = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeClaseCreadaParaElCliente(envoltorio, nombreProfesor);

                                List<string> correos = new List<string>();
                                correos.Add(cliente.Email);
                                List<string> correosProf = new List<string>();
                                correosProf.Add(profCpo.Profesor.Email);

                                SinAlitas.Admin.Mensajeria.CorreoPop.EnviarCorreo(correos, mensajeCliente);
                                SinAlitas.Admin.Mensajeria.CorreoPop.EnviarCorreo(correosProf, mensajeProfesor);
                            }

                        }
                        if (SinAlitas.Admin.Mensajeria.Utiles.ENVIA_SMS() == "1")
                        {
                            if (cliente.TelefonosContacto != "")
                            {
                                string celular = cliente.TelefonosContacto.Replace("+", "").Trim().Replace(" ", "");
                                string mensajeProf = SinAlitas.Admin.Mensajeria.MensajesSMS.RetornaMensajeClaseCreadaParaElProfesor(nombreCliente, fechaMensaje, cliente.Direccion);
                                string mensajeCliente = SinAlitas.Admin.Mensajeria.MensajesSMS.RetornaMensajeClaseCreadaParaElCliente(nombreProfesor, fechaMensaje);
                                SinAlitas.Admin.Mensajeria.MensajesSMS.EnviarTwilio(profCpo.Profesor.TelefonosContacto, mensajeProf);
                                SinAlitas.Admin.Mensajeria.MensajesSMS.EnviarTwilio(celular, mensajeCliente);

                            }
                        }
                    }
                    #endregion
                    //ahora hay que revalorizar el pack, ya que como el cliente
                    //termino de agendar puede haber agendado días domingos
                    if (envoltorio.ProductoCodigo != null && envoltorio.CuposTomados != null)
                    {
                        int sumar = 0;
                        foreach(SinAlitas.Admin.Entidad.Cupo cp in envoltorio.CuposTomados)
                        {
                            if (cp.FechaHoraInicio.DayOfWeek == DayOfWeek.Sunday || cp.FechaHoraInicio.DayOfWeek == DayOfWeek.Saturday)
                            {
                                //revalorizar
                                sumar = sumar + 5000;
                            }
                        }
                        if (sumar > 0)
                        {
                            envoltorio.ProductoCodigo.TotalPack = envoltorio.ProductoCodigo.TotalPack + sumar;
                            try
                            {
                                SinAlitas.Admin.Negocio.ProductoCodigo.Actualizar(envoltorio.ProductoCodigo);
                            }
                            catch (Exception ex)
                            {
                                SinAlitas.Admin.Negocio.Utiles.Log(ex);
                                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Error al actualizar valor del pack.");
                            }
                        }
                    }

                }

            }


        }
        else
        {
            //ya tiene todos los cupos tomados para este producto
            //DESACTIVAR TODO
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Usted ya tiene tomados los cupos para este pack, no puede continuar.");
            Descativar();
        }
    }
    private void Descativar()
    {
        btnGuardar.ClientEnabled = false;
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        int pcoId = int.Parse(Request.QueryString["PCO_ID"]);
        int profId = int.Parse(Request.QueryString["PROF_ID"]);

        SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envoltorio = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(pcoId);
        int fechaEntera = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now);
        if (Request.QueryString["FECHA_ENTERA"] != null)
        {
            if (Session["PRIMERA_FECHA"] != null)
            {
                fechaEntera = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(Convert.ToDateTime(Session["PRIMERA_FECHA"]));
            }
            else
            {
                if (envoltorio != null && envoltorio.CuposTomados != null && envoltorio.CuposTomados.Count > 0)
                {
                    fechaEntera = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(envoltorio.CuposTomados.FirstOrDefault().FechaHoraInicio);
                }
                else
                {
                    fechaEntera = int.Parse(Request.QueryString["FECHA_ENTERA"]);
                }
            }
        }
        Response.Redirect("~/SeleccionarSemanasCliente.aspx?PCO_ID=" + pcoId.ToString() + "&PROF_ID=" + profId.ToString() + "&FECHA_ENTERA=" + fechaEntera.ToString());
    }
}