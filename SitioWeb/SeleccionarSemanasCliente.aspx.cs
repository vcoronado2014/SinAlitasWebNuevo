using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SeleccionarSemanasCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["PCO_ID"] != null && Request.QueryString["PROF_ID"] != null)
            {
                //acá buscamos la semana
                //si el cliente ya tiene cupos tomados, entonces la fecha de inicio para realizar el agendamiento es la primera fecha
                DateTime fechaInicioAgenda = DateTime.Now;
                DateTime fechaUrl = DateTime.MinValue;
                if (Request.QueryString["FECHA_ENTERA"] != null)
                {
                    fechaUrl = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(int.Parse(Request.QueryString["FECHA_ENTERA"]));
                }
                if (Request.QueryString["PRIMERA_FECHA"] != null)
                {
                    Session["PRIMERA_FECHA"] = fechaUrl;
                }

                int pcoId = int.Parse(Request.QueryString["PCO_ID"]);
                int profId = int.Parse(Request.QueryString["PROF_ID"]);
                lblPcoId.Text = pcoId.ToString();
                lblProfId.Text = profId.ToString();
                int cuposTomados = 0;
                int cuposTerminados = 0;
                SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envoltorio = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(pcoId);
                int profesorAsignado = profId;
                SinAlitas.Admin.Entidad.Profesor envProfe = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPord(profId);
                if (fechaUrl == DateTime.MinValue)
                {
                    if (envoltorio != null && envoltorio.CuposTomados != null && envoltorio.CuposTomados.Count > 0)
                    {
                        fechaInicioAgenda = envoltorio.CuposTomados.FirstOrDefault().FechaHoraInicio;
                        profesorAsignado = envoltorio.CuposTomados.FirstOrDefault().ProfId;
                        envProfe = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPord(profesorAsignado);
                    }
                }
                else
                    fechaInicioAgenda = fechaUrl;

                if (profesorAsignado == profId)
                {
                    List<SinAlitas.Admin.Entidad.Semanas> semanas = SinAlitas.Admin.Entidad.Utiles.RetornaSemanas(fechaInicioAgenda);
                    if (envoltorio != null && envoltorio.Cliente != null && envoltorio.Cliente.Id > 0)
                    {
                        cuposTomados = envoltorio.CuposTomados.Count;
                        //traer al profesor y sus cupos
                        //envProfe =  SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPord(profId);
                        if (envProfe != null && envProfe.Id > 0)
                        {
                            //ahora asignamos valores... ojo que falta asociar esto
                            if (envProfe.Fotografia != null && envProfe.Fotografia != string.Empty)
                                imgProfesor.ImageUrl = envProfe.Fotografia;
                            else
                                imgProfesor.ImageUrl = "img/no_disponible.png";
                            //*********
                            litNombreProfesor.Text = envProfe.Nombres + " " + envProfe.PrimerApellido + " " + envProfe.SegundoApellido;
                            //mostramos las horas contratadas por el cliente
                            StringBuilder sb = new StringBuilder();
                            int resta = envoltorio.ProductoCodigo.CantidadClases - cuposTomados;
                            sb.AppendFormat("Número de Clases Agendadas {0},  número de Clases pendientes por agendar {1}", cuposTomados.ToString(), resta.ToString());
                            litClasesAgendar.Text = sb.ToString();
                            //listamos los cupos disponibles por semana
                            if (semanas != null && semanas.Count > 0)
                            {
                                //si ya tiene todos sus cupos tomados, se debe bloquear la agenda
                                if (envoltorio.CuposTomados.Count == envoltorio.ProductoCodigo.CantidadClases)
                                {
                                    foreach (SinAlitas.Admin.Entidad.Semanas semana in semanas)
                                    {
                                        SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo profCpo = SinAlitas.Admin.Negocio.EnvoltorioProfesorCupo.ObtenerProfesorYCupos(envProfe.Id, envoltorio.Comuna.Id, envoltorio.ProductoCodigo.CantidadClases, semana.FechaInicioSemana);
                                        if (profCpo != null && profCpo.CuposProfesor != null && profCpo.CuposProfesor.Count > 0)
                                        {
                                            semana.DiasDisponibles = profCpo.CuposProfesor.Count();
                                            semana.DiasAgendados = envoltorio.CuposTomados.FindAll(p => p.FechaHoraInicio >= semana.FechaInicioSemana && p.FechaHoraTermino <= semana.FechaTerminoSemana).Count;
                                            semana.ClaseBoton = "col-xs-2 text-center pull-right fg-white bg-gray";
                                            semana.PuedeAgendar = 0;
                                        }

                                    }
                                    //ojo acá... no mostramos el repeater ya que en esta ocasión el cliente solo puede reagendar
                                    litMensajeAgradecimiento.Visible = true;
                                    litMensajeAgradecimiento.Text = "Muchas gracias por confiar en Sin Alitas. Proximamente su profesor se pondrá en contacto con usted.";
                                    rptSemanas.Visible = false;

                                }
                                else
                                {
                                    foreach (SinAlitas.Admin.Entidad.Semanas semana in semanas)
                                    {
                                        SinAlitas.Admin.Entidad.EnvoltorioProfesorCupo profCpo = SinAlitas.Admin.Negocio.EnvoltorioProfesorCupo.ObtenerProfesorYCupos(envProfe.Id, envoltorio.Comuna.Id, envoltorio.ProductoCodigo.CantidadClases, semana.FechaInicioSemana);
                                        if (profCpo != null)
                                        {
                                            semana.DiasDisponibles = profCpo.CuposProfesor.Count();
                                        }
                                        
                                        semana.DiasAgendados = envoltorio.CuposTomados.FindAll(p => p.FechaHoraInicio >= semana.FechaInicioSemana && p.FechaHoraTermino <= semana.FechaTerminoSemana).Count;

                                        semana.ClaseBoton = "col-xs-2 text-center pull-right fg-white bg-primary";
                                        semana.PuedeAgendar = 1;


                                    }
                                }
                            }
                            rptSemanas.DataSource = semanas;
                            rptSemanas.DataBind();
                            //ahora los cupos tomados
                            if (envoltorio.CuposTomados != null && envoltorio.CuposTomados.Count > 0)
                            {
                                List<SinAlitas.Admin.Entidad.CupoClienteMostrar> listaMostrar = new List<SinAlitas.Admin.Entidad.CupoClienteMostrar>();
                                foreach (SinAlitas.Admin.Entidad.Cupo cp in envoltorio.CuposTomados)
                                {
                                    SinAlitas.Admin.Entidad.CupoClienteMostrar cpoM = new SinAlitas.Admin.Entidad.CupoClienteMostrar();
                                    cpoM.ClieId = cp.ClieId;
                                    cpoM.Activo = cp.ClieId;
                                    cpoM.Descripcion = cp.Descripcion;
                                    cpoM.EstadoCupo = cp.EstadoCupo;
                                    cpoM.FechaHoraInicio = cp.FechaHoraInicio;
                                    cpoM.FechaHoraRegistro = cp.FechaHoraRegistro;
                                    cpoM.FechaHoraTermino = cp.FechaHoraTermino;
                                    cpoM.FechaStrInicio = SinAlitas.Admin.Entidad.Utiles.EntregaFechaLetras(cp.FechaHoraInicio) + " " + cp.FechaHoraInicio.ToShortTimeString() + " - " + cp.FechaHoraTermino.ToShortTimeString();
                                    cpoM.Id = cp.Id;
                                    cpoM.NodId = cp.NodId;
                                    cpoM.PcoId = cp.PcoId;
                                    cpoM.ProfId = cp.ProfId;
                                    cpoM.SghId = cp.SghId;
                                    SinAlitas.Admin.Entidad.Cliente cliente = SinAlitas.Admin.Negocio.Cliente.ObtenerClientePorId(cp.ClieId);
                                    cpoM.NombreCliente = cliente.Nombres + " " + cliente.PrimerApellido + " " + cliente.SegundoApellido;
                                    cpoM.Estado = SinAlitas.Admin.Entidad.Utiles.RetornaEstadoCupo(cp.EstadoCupo);
                                    if (cp.EstadoCupo == 3)
                                        cuposTerminados++;
                                    if (cp.FechaHoraInicio <= DateTime.Now)
                                        cpoM.ClaseIcono = "pull-right fa fa-2x hidden fa-trash-o no-padding-right";
                                    else
                                        cpoM.ClaseIcono = "pull-right fa fa-2x fa-trash-o no-padding-right";
                                    listaMostrar.Add(cpoM);

                                }
                                if (listaMostrar != null && listaMostrar.Count > 0)
                                {
                                    rptClasesAgendadas.DataSource = listaMostrar;
                                    rptClasesAgendadas.DataBind();
                                }
                                //solo para pruebas **************************
                                //cuposTerminados = cuposTomados;
                                //********************************************
                                if (cuposTerminados == cuposTomados)
                                {
                                    btnCalificar.ClientVisible = true;
                                }
                            }

                        }
                        else
                        {
                            Response.Redirect("~/SeleccionHorasCliente.aspx?PCO_ID=" + pcoId.ToString());
                        }
                    }
                    else
                    {
                        Response.Redirect("~/SeleccionHorasCliente.aspx?PCO_ID=" + pcoId.ToString());
                    }
                }
                else
                {
                    //mostrar mensaje y bloquear
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "UD HA SELECCIONADO UN PROFESOR DISTINTO AL CUAL YA ESTÁ ASIGNADO A SU PACK, VUELVA A LA PÁGINA ANTERIOR Y SELECCIONE A " + envProfe.Nombres + " " + envProfe.PrimerApellido);
                    rptClasesAgendadas.Visible = false;
                    rptSemanas.Visible = false;
                }
            }
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {

        int pcoId = int.Parse(Request.QueryString["PCO_ID"]);
        //VOLVEMOS A NULL ESTA VARIABLE
        if (Session["PRIMERA_FECHA"] !=  null)
            Session["PRIMERA_FECHA"] = null;
        SinAlitas.Admin.Entidad.EnvoltorioClientePackProducto envoltorio = SinAlitas.Admin.Negocio.EnvoltorioClientePackProducto.Obtener(pcoId);
        if (envoltorio.CuposTomados != null && envoltorio.CuposTomados.Count > 0)
        {
            if (envoltorio.CuposTomados.Count == envoltorio.ProductoCodigo.CantidadClases)
                Response.Redirect("~/buscarpack.aspx");
            else
                Response.Redirect("~/SeleccionHorasCliente.aspx?PCO_ID=" + pcoId.ToString());
        }
        else
            Response.Redirect("~/SeleccionHorasCliente.aspx?PCO_ID=" + pcoId.ToString());
    }
}