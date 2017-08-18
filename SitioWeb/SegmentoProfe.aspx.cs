using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;

public partial class SegmentoProfe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
        if (Session["USUARIO_AUTENTICADO"] != null)
        {
            envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            {
                litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                //Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                if (Request.QueryString["FECHA"] != null && Request.QueryString["NOD_ID"] != null && Request.QueryString["PROF_ID"] != null)
                {
                    //LA FECHA ES ENTERA, HAY QUE CAMBIARLA
                    DateTime fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(int.Parse(Request.QueryString["FECHA"].ToString()));
                    //int nodId = int.Parse(Request.QueryString["NOD_ID"]);
                    //int profId = int.Parse(Request.QueryString["PROF_ID"]);
                    int mesId = fecha.Month;
                    lblIdMes.Text = mesId.ToString();
                    int annoId = fecha.Year;
                    lblIdAnno.Text = annoId.ToString();
                    //ActualizarSegmentos(fecha, nodId, profId);
                    litFecha.Text = SinAlitas.Admin.Entidad.Utiles.EntregaFechaLetras(fecha);
                    //hlVolver.NavigateUrl = "CalendarioProfe.aspx?ID_MES=" + mesId.ToString();
                }
                if (Request.QueryString["BLOQUEAR"] != null)
                {
                    int bloquear = int.Parse(Request.QueryString["BLOQUEAR"]);
                    if (bloquear == 1)
                    {
                        //acá hay que bloquear el repeater
                        btnGuardar.ClientVisible = false;

                    }
                }
            }
            else
                Response.Redirect("~/login.aspx");
        }
        else
            Response.Redirect("~/login.aspx");



    }
    //private void ActualizarSegmentos(DateTime fecha, int nodId, int profId)
    //{
    //    bool esBloqueado = false;
    //    if (Request.QueryString["BLOQUEAR"] != null)
    //        if (Request.QueryString["BLOQUEAR"] == "1")
    //            esBloqueado = true;

    //    List<SinAlitas.Admin.Entidad.SegmentoMostrar> segmentos = SinAlitas.Admin.Negocio.SegmentoHorario.BuscarSegmentoPorFecha(fecha, nodId, profId, esBloqueado);

    //    Repeater1.DataSource = segmentos;
    //    Repeater1.DataBind();

    //    //ASPxDataView1.DataSource = segmentos;
    //    //ASPxDataView1.DataBind();
    //}
    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null && e.Parameter.Length > 0)
        {
            StringBuilder sb = new StringBuilder();
            if (e.Parameter == "guardar")
            {
                //recorremos los elementos del dataview
                int cantidadRegistros = 0;
                int cantidadSeleccionados = 0;
                List<SinAlitas.Admin.Entidad.SegmentoMostrar> listaProcesar = new List<SinAlitas.Admin.Entidad.SegmentoMostrar>();
                if (ASPxDataView1.Items != null && ASPxDataView1.Items.Count > 0)
                {
                    cantidadRegistros = ASPxDataView1.Items.Count;
                
                    foreach (DevExpress.Web.DataViewItem item in ASPxDataView1.Items)
                    {
                        //item.DataItem
                        SinAlitas.Admin.Entidad.SegmentoMostrar entidad = item.DataItem as SinAlitas.Admin.Entidad.SegmentoMostrar;
                        DevExpress.Web.ASPxCheckBox control = item.FindControl("chkSeleccione") as DevExpress.Web.ASPxCheckBox;
                        if (control != null)
                        {
                            //procesar
                            entidad.EsSeleccionado = control.Checked;
                            if (entidad.EsSeleccionado)
                                cantidadSeleccionados++;
                        }
                        listaProcesar.Add(entidad);
                    }
                }
                //lo primero es evaluar la cantidad de seleccionados
                if (cantidadSeleccionados == 0)
                {
                    //mostrar mensaje que debe seleccionar al menos un elemento
                    Mensaje1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Debe Seleccionar al menos un elemento.");

                }
                else
                {
                    //procesar la lista
                    if (listaProcesar.Count > 0)
                    {
                        foreach(SinAlitas.Admin.Entidad.SegmentoMostrar seg in listaProcesar)
                        {
                            //evaluamos cada elemento para determinar que debemos hacer
                            if (seg.EsSeleccionado)
                            {
                                //si es seleccionado significa que debe agregarse un cupo
                                //pero antes debemos verificar si el cupo ya existe o no
                                //para ver si hacemos algo
                                //1. si el cupo es seleccionado y no tiene id se debe guardar
                                if (seg.CpoId == 0)
                                {

                                    DateTime fechaHoraInicio = Convert.ToDateTime(seg.Fecha.ToShortDateString() + " " + seg.HoraInicio);
                                    DateTime fechaHoraTermino = Convert.ToDateTime(seg.Fecha.ToShortDateString() + " " + seg.HoraTermino);

                                    //antes vamos a verificar si existe para ese segmento antes de crear
                                    SinAlitas.Admin.Entidad.Cupo cupoExsitente = SinAlitas.Admin.Negocio.Cupo.ObtenerCupo(seg.NodId, seg.ProfId, seg.SghId, fechaHoraInicio);
                                    if (cupoExsitente != null && cupoExsitente.Id > 0)
                                    {
                                        cupoExsitente.Activo = 1;
                                        cupoExsitente.ClieId = 0;
                                        cupoExsitente.Descripcion = string.Empty;
                                        cupoExsitente.Eliminado = 0;
                                        cupoExsitente.EstadoCupo = 1;
                                        cupoExsitente.FechaHoraInicio = fechaHoraInicio;
                                        cupoExsitente.FechaHoraRegistro = DateTime.Now;
                                        cupoExsitente.FechaHoraTermino = fechaHoraTermino;
                                        cupoExsitente.NodId = seg.NodId;
                                        cupoExsitente.ProfId = seg.ProfId;
                                        cupoExsitente.SghId = seg.SghId;

                                        int id = SinAlitas.Admin.Negocio.Cupo.Actualizar(cupoExsitente);
                                        sb.AppendFormat("Cupo Nro. {0} para el día {1} entre las {2} - {3} guardado con éxito.", id.ToString(), fechaHoraInicio.ToShortDateString(), fechaHoraInicio.ToShortTimeString(), fechaHoraTermino.ToShortTimeString());
                                        sb.Append("\r\n");
                                    }
                                    else
                                    {
                                        SinAlitas.Admin.Entidad.Cupo cupo = new SinAlitas.Admin.Entidad.Cupo();
                                        cupo.Activo = 1;
                                        cupo.ClieId = 0;
                                        cupo.Descripcion = string.Empty;
                                        cupo.Eliminado = 0;
                                        cupo.EstadoCupo = 1;
                                        cupo.FechaHoraInicio = fechaHoraInicio;
                                        cupo.FechaHoraRegistro = DateTime.Now;
                                        cupo.FechaHoraTermino = fechaHoraTermino;
                                        cupo.NodId = seg.NodId;
                                        cupo.ProfId = seg.ProfId;
                                        cupo.SghId = seg.SghId;

                                        int id = SinAlitas.Admin.Negocio.Cupo.Insetar(cupo);
                                        sb.AppendFormat("Cupo Nro. {0} para el día {1} entre las {2} - {3} guardado con éxito.", id.ToString(), fechaHoraInicio.ToShortDateString(), fechaHoraInicio.ToShortTimeString(), fechaHoraTermino.ToShortTimeString());
                                        sb.Append("\r\n");
                                    }
                                }

                            }
                            else
                            {
                                //si no esta seleccionado y tiene un cupo hay que eliminarlo
                                if (seg.CpoId > 0)
                                {
                                    SinAlitas.Admin.Entidad.Cupo cupo = SinAlitas.Admin.Negocio.Cupo.ObtenerCupoPorId(seg.CpoId);
                                    //SinAlitas.Admin.Negocio.Cupo.ListarCuposEliminar()
                                    if (cupo != null && cupo.Id > 0)
                                    {
                                        //vamos a eliminar el duplicado
                                        
                                        List<SinAlitas.Admin.Entidad.Cupo> listaDuplicados =
                                            SinAlitas.Admin.Negocio.Cupo.ListarCuposEliminar(cupo.ProfId, cupo.SghId, SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(cupo.FechaHoraInicio), cupo.Id);

                                        if (listaDuplicados != null && listaDuplicados.Count > 0)
                                        {
                                            foreach (SinAlitas.Admin.Entidad.Cupo cpEl in listaDuplicados)
                                            {
                                                SinAlitas.Admin.Negocio.Cupo.Eliminar(cpEl);
                                            }
                                        }
                                        int idEliminar =  SinAlitas.Admin.Negocio.Cupo.Eliminar(cupo);
                                        if (idEliminar >= 0)
                                        {
                                            DateTime fechaHoraInicio = Convert.ToDateTime(seg.Fecha.ToShortDateString() + " " + seg.HoraInicio);
                                            DateTime fechaHoraTermino = Convert.ToDateTime(seg.Fecha.ToShortDateString() + " " + seg.HoraTermino);
                                            sb.AppendFormat("Cupo para el día {0} entre las {1} - {2} eliminado con éxito.", fechaHoraInicio.ToShortDateString(), fechaHoraInicio.ToShortTimeString(), fechaHoraTermino.ToShortTimeString());
                                            sb.Append("\r\n");
                                        }
                                    }
                                }
                            }
                        }
                        if (sb != null && sb.ToString().Length > 0)
                        {
                            Mensaje1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, sb.ToString());
                        }
                    }
                    else
                    {
                        //mostrar mensaje que no hay elementos para procesar
                        Mensaje1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Debe Seleccionar al menos un elemento.");
                    }
                }
            }
            

            //int idMes = int.Parse(e.Parameter);
            //ActualizarAgenda(1, idMes, 1);

        }
    }

}