using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class ReporteClases : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
                    case 3://Profesor
                        Response.Redirect("~/ContenidoProfesor.aspx");
                        break;
                }


            }
            else
                Response.Redirect("~/Login.aspx");
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            {
                litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;

                List<SinAlitas.Admin.Entidad.ReporteClases> lista = SinAlitas.Admin.Negocio.ReporteClases.ObtenerReporteClases();

                if (lista != null && lista.Count > 0)
                {
                    StringBuilder sb = new StringBuilder();
                    var grouped = lista.GroupBy(p => p.NombreProfesor);
                    foreach(var group in grouped)
                    {
                        sb.AppendFormat("<div class='col-xs-12 text-center itemFecha'>{0}</div>", group.Key);
                        //encabezado profesor
                        sb.Append("<div class='col-xs-12 visible-md visible-lg no-padding primeraLineaReporte'>");
                        sb.Append("<div class='col-md-2 text-center font-muypequeno'>Fecha Creación</div>");
                        sb.Append("<div class='col-md-4 text-center font-muypequeno'>Nombre Cliente</div>");
                        sb.Append("<div class='col-md-2 text-center font-muypequeno'>Código</div>");
                        sb.Append("<div class='col-md-1 text-center font-muypequeno'>Pdte.</div>");
                        sb.Append("<div class='col-md-1 text-center font-muypequeno'>Cerr.</div>");
                        sb.Append("<div class='col-md-1 text-center font-muypequeno'>Prog.</div>");
                        sb.Append("<div class='col-md-1 text-center font-muypequeno'>Pagado</div>");
                        sb.Append("</div>");

                        List<SinAlitas.Admin.Entidad.ReporteClases> items = group.ToList();
                        foreach(SinAlitas.Admin.Entidad.ReporteClases clase in items)
                        {
                            //para los items en modo medium hacia arriba
                            sb.Append("<div class='col-xs-12 visible-md visible-lg no-padding border-bottom-burlywood itemsReporte'>");
                            sb.AppendFormat("<div class='col-md-2 text-center'><i class='glyphicon glyphicon-calendar'></i> {0}</div>", clase.FechaCreacion.ToShortDateString());
                            sb.AppendFormat("<div class='col-md-4'>{0}</div>", clase.Nombre);
                            sb.AppendFormat("<div class='col-md-2 text-center'>{0}</div>", clase.CodigoCliente);
                            if (clase.Pendientes > 0)
                                sb.AppendFormat("<div class='col-md-1 text-center destacadoSalmon'>{0}</div>", clase.Pendientes.ToString());
                            else
                                sb.AppendFormat("<div class='col-md-1 text-center'>{0}</div>", clase.Pendientes.ToString());
                            sb.AppendFormat("<div class='col-md-1 text-center'>{0}</div>", clase.Cerradas.ToString());
                            sb.AppendFormat("<div class='col-md-1 text-center'>{0}</div>", clase.Programadas.ToString());


                            if (clase.EstaPagado == "PACK NO PAGADO")
                                sb.Append("<div class='col-md-1 text-center'><i class='glyphicon glyphicon-remove'></i></div>");
                            else
                                sb.Append("<div class='col-md-1 text-center'><i class='glyphicon glyphicon-ok'></i></div>");

                            sb.Append("</div>");
                            //modo telefono

                            sb.Append("<div class='col-xs-12 visible-xs visible-sm no-padding border-bottom-burlywood'>");
                            sb.Append("<div class='col-xs-4 text-center font-muypequeno no-padding'>");
                            sb.Append("<div class='col-xs-12 no-padding font-muypequeno bg-info'>Fecha</div>");
                            sb.AppendFormat("<i class='glyphicon glyphicon-calendar'></i> {0}</div>", clase.FechaCreacion.ToShortDateString());
                            sb.Append("<div class='col-xs-5 font-muypequeno no-padding'>");
                            sb.AppendFormat("<div class='col-xs-12 no-padding font-muypequeno bg-info'>Nombre</div>{0}</div>", clase.Nombre);
                            sb.Append("<div class='col-xs-3 text-center font-muypequeno no-padding'>");
                            sb.AppendFormat("<div class='col-xs-12 no-padding font-muypequeno bg-info'>Código</div>{0}</div>", clase.CodigoCliente);
                            sb.Append("<div class='col-xs-3 text-center font-muypequeno no-padding'>");
                            sb.AppendFormat("<div class='col-xs-12 no-padding font-muypequeno bg-info'>Pdte.</div>{0}</div>", clase.Pendientes.ToString());
                            sb.Append("<div class='col-xs-3 text-center font-muypequeno no-padding'>");
                            sb.AppendFormat("<div class='col-xs-12 no-padding font-muypequeno bg-info'>Cerr.</div>{0}</div>", clase.Cerradas.ToString());
                            sb.Append("<div class='col-xs-3 text-center font-muypequeno no-padding'>");
                            sb.AppendFormat("<div class='col-xs-12 no-padding font-muypequeno bg-info'>Prog.</div>{0}</div>", clase.Programadas.ToString());
                            sb.Append("<div class='col-xs-3 text-center font-muypequeno no-padding'>");
                            if (clase.EstaPagado == "PACK NO PAGADO")
                                sb.Append("<div class='col-xs-12 no-padding font-muypequeno bg-info'>Pagado</div><i class='glyphicon glyphicon-remove fg-rosa'></i></div>");
                            else
                                sb.Append("<div class='col-xs-12 no-padding font-muypequeno bg-info'>Pagado</div><i class='glyphicon glyphicon-ok fg-rosa'></i></div>");
                            sb.Append("</div>");

                        }

                    }

                    litContenido.Text = sb.ToString();

                }



            }

        }
    }
}