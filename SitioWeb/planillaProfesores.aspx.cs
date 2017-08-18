using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class planillaProfesores : System.Web.UI.Page
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
                //vamos a armar la planilla
                //nombre profesor  10:00-10:45 11:15-12:00 12:30-13:15 14:45-15:30 16:00-16:45 17:15-18:00 18:30-19:15
                //---------------  ----------- ----------- ----------- ----------- ----------- ----------- -----------
                //Nicolas Nuñez    3-pack1     4-pack2                             5-pack3      21-pack1
                #region comentado
                //int hoy = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now);
                //int diaDos = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now.AddDays(1));
                //int diaTres = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now.AddDays(2));
                //int diaCuatro = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now.AddDays(3));
                //int diaCinco = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now.AddDays(4));
                //int diaSeis = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now.AddDays(5));
                //int diaSiete = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(DateTime.Now.AddDays(6));
                //List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosUno = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(hoy);
                //List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosDos = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaDos);
                //List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosTres = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaTres);
                //List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosCuatro = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaCuatro);
                //List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosCinco = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaCinco);
                //List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosSeis = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaSeis);
                //List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosSiete = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaSiete);


                ////ahora que tenemos un listado de profesores con sus packs y segmentos armamos la nueva lista
                //List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaUno = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
                //List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaDos = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
                //List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaTres = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
                //List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaCuatro = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
                //List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaCinco = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
                //List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaSeis = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
                //List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaSiete = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();

                //List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaCompleta = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
                //#region primer dia
                //if (resultadosUno != null && resultadosUno.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosUno)
                //    {
                //        SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                //        planilla.IdProfesor = resul.Id;
                //        planilla.NombreProfesor = resul.Nombres;
                //        planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy);
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 10:00"))
                //        {
                //            planilla.SegmentoUno = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 11:15"))
                //        {
                //            planilla.SegmentoDos = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 12:30"))
                //        {
                //            planilla.SegmentoTres = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 14:45"))
                //        {
                //            planilla.SegmentoCuatro = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 16:00"))
                //        {
                //            planilla.SegmentoCinco = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 17:15"))
                //        {
                //            planilla.SegmentoSeis = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 18:30"))
                //        {
                //            planilla.SegmentoSiete = resul.CodigoCliente;
                //        }
                //        listaPlanillaUno.Add(planilla);
                //    }
                //}
                //#endregion
                //#region segundo dia
                //if (resultadosDos != null && resultadosDos.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosDos)
                //    {
                //        SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                //        planilla.IdProfesor = resul.Id;
                //        planilla.NombreProfesor = resul.Nombres;
                //        planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos);
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 10:00"))
                //        {
                //            planilla.SegmentoUno = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 11:15"))
                //        {
                //            planilla.SegmentoDos = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 12:30"))
                //        {
                //            planilla.SegmentoTres = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 14:45"))
                //        {
                //            planilla.SegmentoCuatro = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 16:00"))
                //        {
                //            planilla.SegmentoCinco = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 17:15"))
                //        {
                //            planilla.SegmentoSeis = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 18:30"))
                //        {
                //            planilla.SegmentoSiete = resul.CodigoCliente;
                //        }
                //        listaPlanillaDos.Add(planilla);
                //    }
                //}
                //#endregion
                //#region tercer dia
                //if (resultadosTres != null && resultadosTres.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosTres)
                //    {
                //        SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                //        planilla.IdProfesor = resul.Id;
                //        planilla.NombreProfesor = resul.Nombres;
                //        planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres);
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 10:00"))
                //        {
                //            planilla.SegmentoUno = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 11:15"))
                //        {
                //            planilla.SegmentoDos = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 12:30"))
                //        {
                //            planilla.SegmentoTres = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 14:45"))
                //        {
                //            planilla.SegmentoCuatro = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 16:00"))
                //        {
                //            planilla.SegmentoCinco = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 17:15"))
                //        {
                //            planilla.SegmentoSeis = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 18:30"))
                //        {
                //            planilla.SegmentoSiete = resul.CodigoCliente;
                //        }
                //        listaPlanillaTres.Add(planilla);
                //    }
                //}
                //#endregion
                //#region cuarto dia
                //if (resultadosCuatro != null && resultadosCuatro.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosCuatro)
                //    {
                //        SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                //        planilla.IdProfesor = resul.Id;
                //        planilla.NombreProfesor = resul.Nombres;
                //        planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro);
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 10:00"))
                //        {
                //            planilla.SegmentoUno = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 11:15"))
                //        {
                //            planilla.SegmentoDos = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 12:30"))
                //        {
                //            planilla.SegmentoTres = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 14:45"))
                //        {
                //            planilla.SegmentoCuatro = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 16:00"))
                //        {
                //            planilla.SegmentoCinco = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 17:15"))
                //        {
                //            planilla.SegmentoSeis = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 18:30"))
                //        {
                //            planilla.SegmentoSiete = resul.CodigoCliente;
                //        }
                //        listaPlanillaCuatro.Add(planilla);
                //    }
                //}
                //#endregion
                //#region quinto dia
                //if (resultadosCinco != null && resultadosCinco.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosCinco)
                //    {
                //        SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                //        planilla.IdProfesor = resul.Id;
                //        planilla.NombreProfesor = resul.Nombres;
                //        planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco);
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 10:00"))
                //        {
                //            planilla.SegmentoUno = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 11:15"))
                //        {
                //            planilla.SegmentoDos = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 12:30"))
                //        {
                //            planilla.SegmentoTres = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 14:45"))
                //        {
                //            planilla.SegmentoCuatro = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 16:00"))
                //        {
                //            planilla.SegmentoCinco = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 17:15"))
                //        {
                //            planilla.SegmentoSeis = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 18:30"))
                //        {
                //            planilla.SegmentoSiete = resul.CodigoCliente;
                //        }
                //        listaPlanillaCinco.Add(planilla);
                //    }
                //}
                //#endregion
                //#region sexto dia
                //if (resultadosSeis != null && resultadosSeis.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosSeis)
                //    {
                //        SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                //        planilla.IdProfesor = resul.Id;
                //        planilla.NombreProfesor = resul.Nombres;
                //        planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis);
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 10:00"))
                //        {
                //            planilla.SegmentoUno = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 11:15"))
                //        {
                //            planilla.SegmentoDos = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 12:30"))
                //        {
                //            planilla.SegmentoTres = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 14:45"))
                //        {
                //            planilla.SegmentoCuatro = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 16:00"))
                //        {
                //            planilla.SegmentoCinco = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 17:15"))
                //        {
                //            planilla.SegmentoSeis = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 18:30"))
                //        {
                //            planilla.SegmentoSiete = resul.CodigoCliente;
                //        }
                //        listaPlanillaSeis.Add(planilla);
                //    }
                //}
                //#endregion
                //#region septimo dia
                //if (resultadosSiete != null && resultadosSiete.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosSiete)
                //    {
                //        SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                //        planilla.IdProfesor = resul.Id;
                //        planilla.NombreProfesor = resul.Nombres;
                //        planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete);
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 10:00"))
                //        {
                //            planilla.SegmentoUno = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 11:15"))
                //        {
                //            planilla.SegmentoDos = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 12:30"))
                //        {
                //            planilla.SegmentoTres = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 14:45"))
                //        {
                //            planilla.SegmentoCuatro = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 16:00"))
                //        {
                //            planilla.SegmentoCinco = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 17:15"))
                //        {
                //            planilla.SegmentoSeis = resul.CodigoCliente;
                //        }
                //        if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 18:30"))
                //        {
                //            planilla.SegmentoSiete = resul.CodigoCliente;
                //        }
                //        listaPlanillaSiete.Add(planilla);
                //    }
                //}
                //#endregion

                //listaPlanillaCompleta.AddRange(listaPlanillaUno);
                //listaPlanillaCompleta.AddRange(listaPlanillaDos);
                //listaPlanillaCompleta.AddRange(listaPlanillaTres);
                //listaPlanillaCompleta.AddRange(listaPlanillaCuatro);
                //listaPlanillaCompleta.AddRange(listaPlanillaCinco);
                //listaPlanillaCompleta.AddRange(listaPlanillaSeis);
                //listaPlanillaCompleta.AddRange(listaPlanillaSiete);

                //List<SinAlitas.Admin.Entidad.ItemProfesor> listaFinal = new List<SinAlitas.Admin.Entidad.ItemProfesor>();

                //var agrupdas = listaPlanillaCompleta.GroupBy(p => p.NombreProfesor);
                //if (agrupdas != null)
                //{
                //    foreach (var group in agrupdas)
                //    {
                //        SinAlitas.Admin.Entidad.ItemProfesor plan = new SinAlitas.Admin.Entidad.ItemProfesor();
                //        plan.NombreProfesor = group.Key;
                //        plan.Detalle = new List<SinAlitas.Admin.Entidad.ItemDetalle>();
                //        //Console.WriteLine("Group {0}", group.Key);
                //        List<SinAlitas.Admin.Entidad.PlanillaProfesor> items = group.ToList();

                //        var groupFechas = items.GroupBy(p => p.Fecha);

                //        foreach (var groupF in groupFechas)
                //        {
                //            SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                //            detalle.Fecha = groupF.Key;
                //            List<SinAlitas.Admin.Entidad.PlanillaProfesor> fechitas = groupF.ToList();

                //            if (fechitas != null && fechitas.Count > 0)
                //            {
                //                SinAlitas.Admin.Entidad.PlanillaProfesor plan1 = fechitas.Find(p => p.SegmentoUno != null);
                //                detalle.SegmentoUno = plan1 == null ? "" : plan1.SegmentoUno;

                //                SinAlitas.Admin.Entidad.PlanillaProfesor plan2 = fechitas.Find(p => p.SegmentoDos != null);
                //                detalle.SegmentoDos = plan2 == null ? "" : plan2.SegmentoDos;

                //                SinAlitas.Admin.Entidad.PlanillaProfesor plan3 = fechitas.Find(p => p.SegmentoTres != null);
                //                detalle.SegmentoTres = plan3 == null ? "" : plan3.SegmentoTres;

                //                SinAlitas.Admin.Entidad.PlanillaProfesor plan4 = fechitas.Find(p => p.SegmentoCuatro != null);
                //                detalle.SegmentoCuatro = plan4 == null ? "" : plan4.SegmentoCuatro;

                //                SinAlitas.Admin.Entidad.PlanillaProfesor plan5 = fechitas.Find(p => p.SegmentoCinco != null);
                //                detalle.SegmentoCinco = plan5 == null ? "" : plan5.SegmentoCinco;

                //                SinAlitas.Admin.Entidad.PlanillaProfesor plan6 = fechitas.Find(p => p.SegmentoSeis != null);
                //                detalle.SegmentoSeis = plan6 == null ? "" : plan6.SegmentoSeis;

                //                SinAlitas.Admin.Entidad.PlanillaProfesor plan7 = fechitas.Find(p => p.SegmentoSiete != null);
                //                detalle.SegmentoSiete = plan7 == null ? "" : plan7.SegmentoSiete;

                //            }

                //            plan.Detalle.Add(detalle);
                //        }

                //        listaFinal.Add(plan);
                //    }
                //}
                ////Ahora procesamos la lista final
                //if (listaFinal != null && listaFinal.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ItemProfesor prof in listaFinal)
                //    {
                //        if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy)))
                //        {
                //            SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                //            detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy);
                //            prof.Detalle.Add(detalle);
                //        }
                //        if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos)))
                //        {
                //            SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                //            detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos);
                //            prof.Detalle.Add(detalle);
                //        }
                //        if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres)))
                //        {
                //            SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                //            detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres);
                //            prof.Detalle.Add(detalle);
                //        }
                //        if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro)))
                //        {
                //            SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                //            detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro);
                //            prof.Detalle.Add(detalle);
                //        }
                //        if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco)))
                //        {
                //            SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                //            detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco);
                //            prof.Detalle.Add(detalle);
                //        }
                //        if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis)))
                //        {
                //            SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                //            detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis);
                //            prof.Detalle.Add(detalle);
                //        }
                //        if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete)))
                //        {
                //            SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                //            detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete);
                //            prof.Detalle.Add(detalle);
                //        }
                //    }
                //}
                //if (listaFinal != null && listaFinal.Count > 0)
                //{
                //    foreach (SinAlitas.Admin.Entidad.ItemProfesor prof in listaFinal)
                //    {
                //        if (prof.Detalle != null && prof.Detalle.Count > 0)
                //        {
                //            prof.Detalle = prof.Detalle.OrderBy(p => p.Fecha).ToList();
                //        }
                //    }
                //}

                //litContenido.Text = ArmarContenido(listaFinal, hoy, diaDos, diaTres, diaCuatro, diaCinco, diaSeis, diaSiete);

                #endregion
                if (!Page.IsPostBack)
                {
                    dtFechaInicio.Date = DateTime.Now;
                    Consultar(DateTime.Now);
                }
            }
        }
        else
        {
            Response.Redirect("~/login.aspx");
        }
        

    }
    private void Consultar(DateTime fechaInicio)
    {
        int hoy = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(fechaInicio);
        int diaDos = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(fechaInicio.AddDays(1));
        int diaTres = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(fechaInicio.AddDays(2));
        int diaCuatro = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(fechaInicio.AddDays(3));
        int diaCinco = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(fechaInicio.AddDays(4));
        int diaSeis = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(fechaInicio.AddDays(5));
        int diaSiete = SinAlitas.Admin.Entidad.Utiles.RetornaFechaEntera(fechaInicio.AddDays(6));
        List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosUno = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(hoy);
        List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosDos = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaDos);
        List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosTres = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaTres);
        List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosCuatro = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaCuatro);
        List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosCinco = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaCinco);
        List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosSeis = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaSeis);
        List<SinAlitas.Admin.Entidad.ResultadosProfesor> resultadosSiete = SinAlitas.Admin.Negocio.PlanillaProfesor.ObtenerMatriz(diaSiete);


        //ahora que tenemos un listado de profesores con sus packs y segmentos armamos la nueva lista
        List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaUno = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
        List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaDos = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
        List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaTres = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
        List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaCuatro = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
        List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaCinco = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
        List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaSeis = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
        List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaSiete = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();

        List<SinAlitas.Admin.Entidad.PlanillaProfesor> listaPlanillaCompleta = new List<SinAlitas.Admin.Entidad.PlanillaProfesor>();
        #region primer dia
        if (resultadosUno != null && resultadosUno.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosUno)
            {
                SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                planilla.IdProfesor = resul.Id;
                planilla.NombreProfesor = resul.Nombres;
                planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy);
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 10:00"))
                {
                    planilla.SegmentoUno = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 11:15"))
                {
                    planilla.SegmentoDos = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 12:30"))
                {
                    planilla.SegmentoTres = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 14:45"))
                {
                    planilla.SegmentoCuatro = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 16:00"))
                {
                    planilla.SegmentoCinco = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 17:15"))
                {
                    planilla.SegmentoSeis = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy).ToShortDateString() + " 18:30"))
                {
                    planilla.SegmentoSiete = resul.CodigoCliente;
                }
                listaPlanillaUno.Add(planilla);
            }
        }
        #endregion
        #region segundo dia
        if (resultadosDos != null && resultadosDos.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosDos)
            {
                SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                planilla.IdProfesor = resul.Id;
                planilla.NombreProfesor = resul.Nombres;
                planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos);
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 10:00"))
                {
                    planilla.SegmentoUno = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 11:15"))
                {
                    planilla.SegmentoDos = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 12:30"))
                {
                    planilla.SegmentoTres = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 14:45"))
                {
                    planilla.SegmentoCuatro = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 16:00"))
                {
                    planilla.SegmentoCinco = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 17:15"))
                {
                    planilla.SegmentoSeis = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos).ToShortDateString() + " 18:30"))
                {
                    planilla.SegmentoSiete = resul.CodigoCliente;
                }
                listaPlanillaDos.Add(planilla);
            }
        }
        #endregion
        #region tercer dia
        if (resultadosTres != null && resultadosTres.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosTres)
            {
                SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                planilla.IdProfesor = resul.Id;
                planilla.NombreProfesor = resul.Nombres;
                planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres);
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 10:00"))
                {
                    planilla.SegmentoUno = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 11:15"))
                {
                    planilla.SegmentoDos = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 12:30"))
                {
                    planilla.SegmentoTres = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 14:45"))
                {
                    planilla.SegmentoCuatro = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 16:00"))
                {
                    planilla.SegmentoCinco = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 17:15"))
                {
                    planilla.SegmentoSeis = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres).ToShortDateString() + " 18:30"))
                {
                    planilla.SegmentoSiete = resul.CodigoCliente;
                }
                listaPlanillaTres.Add(planilla);
            }
        }
        #endregion
        #region cuarto dia
        if (resultadosCuatro != null && resultadosCuatro.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosCuatro)
            {
                SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                planilla.IdProfesor = resul.Id;
                planilla.NombreProfesor = resul.Nombres;
                planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro);
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 10:00"))
                {
                    planilla.SegmentoUno = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 11:15"))
                {
                    planilla.SegmentoDos = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 12:30"))
                {
                    planilla.SegmentoTres = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 14:45"))
                {
                    planilla.SegmentoCuatro = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 16:00"))
                {
                    planilla.SegmentoCinco = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 17:15"))
                {
                    planilla.SegmentoSeis = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro).ToShortDateString() + " 18:30"))
                {
                    planilla.SegmentoSiete = resul.CodigoCliente;
                }
                listaPlanillaCuatro.Add(planilla);
            }
        }
        #endregion
        #region quinto dia
        if (resultadosCinco != null && resultadosCinco.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosCinco)
            {
                SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                planilla.IdProfesor = resul.Id;
                planilla.NombreProfesor = resul.Nombres;
                planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco);
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 10:00"))
                {
                    planilla.SegmentoUno = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 11:15"))
                {
                    planilla.SegmentoDos = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 12:30"))
                {
                    planilla.SegmentoTres = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 14:45"))
                {
                    planilla.SegmentoCuatro = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 16:00"))
                {
                    planilla.SegmentoCinco = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 17:15"))
                {
                    planilla.SegmentoSeis = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco).ToShortDateString() + " 18:30"))
                {
                    planilla.SegmentoSiete = resul.CodigoCliente;
                }
                listaPlanillaCinco.Add(planilla);
            }
        }
        #endregion
        #region sexto dia
        if (resultadosSeis != null && resultadosSeis.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosSeis)
            {
                SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                planilla.IdProfesor = resul.Id;
                planilla.NombreProfesor = resul.Nombres;
                planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis);
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 10:00"))
                {
                    planilla.SegmentoUno = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 11:15"))
                {
                    planilla.SegmentoDos = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 12:30"))
                {
                    planilla.SegmentoTres = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 14:45"))
                {
                    planilla.SegmentoCuatro = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 16:00"))
                {
                    planilla.SegmentoCinco = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 17:15"))
                {
                    planilla.SegmentoSeis = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis).ToShortDateString() + " 18:30"))
                {
                    planilla.SegmentoSiete = resul.CodigoCliente;
                }
                listaPlanillaSeis.Add(planilla);
            }
        }
        #endregion
        #region septimo dia
        if (resultadosSiete != null && resultadosSiete.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ResultadosProfesor resul in resultadosSiete)
            {
                SinAlitas.Admin.Entidad.PlanillaProfesor planilla = new SinAlitas.Admin.Entidad.PlanillaProfesor();
                planilla.IdProfesor = resul.Id;
                planilla.NombreProfesor = resul.Nombres;
                planilla.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete);
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 10:00"))
                {
                    planilla.SegmentoUno = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 11:15"))
                {
                    planilla.SegmentoDos = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 12:30"))
                {
                    planilla.SegmentoTres = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 14:45"))
                {
                    planilla.SegmentoCuatro = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 16:00"))
                {
                    planilla.SegmentoCinco = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 17:15"))
                {
                    planilla.SegmentoSeis = resul.CodigoCliente;
                }
                if (resul.FechaHoraInicio == Convert.ToDateTime(SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete).ToShortDateString() + " 18:30"))
                {
                    planilla.SegmentoSiete = resul.CodigoCliente;
                }
                listaPlanillaSiete.Add(planilla);
            }
        }
        #endregion

        listaPlanillaCompleta.AddRange(listaPlanillaUno);
        listaPlanillaCompleta.AddRange(listaPlanillaDos);
        listaPlanillaCompleta.AddRange(listaPlanillaTres);
        listaPlanillaCompleta.AddRange(listaPlanillaCuatro);
        listaPlanillaCompleta.AddRange(listaPlanillaCinco);
        listaPlanillaCompleta.AddRange(listaPlanillaSeis);
        listaPlanillaCompleta.AddRange(listaPlanillaSiete);

        List<SinAlitas.Admin.Entidad.ItemProfesor> listaFinal = new List<SinAlitas.Admin.Entidad.ItemProfesor>();

        var agrupdas = listaPlanillaCompleta.GroupBy(p => p.NombreProfesor);
        if (agrupdas != null)
        {
            foreach (var group in agrupdas)
            {
                SinAlitas.Admin.Entidad.ItemProfesor plan = new SinAlitas.Admin.Entidad.ItemProfesor();
                plan.NombreProfesor = group.Key;
                plan.Detalle = new List<SinAlitas.Admin.Entidad.ItemDetalle>();
                //Console.WriteLine("Group {0}", group.Key);
                List<SinAlitas.Admin.Entidad.PlanillaProfesor> items = group.ToList();

                var groupFechas = items.GroupBy(p => p.Fecha);

                foreach (var groupF in groupFechas)
                {
                    SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                    detalle.Fecha = groupF.Key;
                    List<SinAlitas.Admin.Entidad.PlanillaProfesor> fechitas = groupF.ToList();

                    if (fechitas != null && fechitas.Count > 0)
                    {
                        SinAlitas.Admin.Entidad.PlanillaProfesor plan1 = fechitas.Find(p => p.SegmentoUno != null);
                        detalle.SegmentoUno = plan1 == null ? "" : plan1.SegmentoUno;

                        SinAlitas.Admin.Entidad.PlanillaProfesor plan2 = fechitas.Find(p => p.SegmentoDos != null);
                        detalle.SegmentoDos = plan2 == null ? "" : plan2.SegmentoDos;

                        SinAlitas.Admin.Entidad.PlanillaProfesor plan3 = fechitas.Find(p => p.SegmentoTres != null);
                        detalle.SegmentoTres = plan3 == null ? "" : plan3.SegmentoTres;

                        SinAlitas.Admin.Entidad.PlanillaProfesor plan4 = fechitas.Find(p => p.SegmentoCuatro != null);
                        detalle.SegmentoCuatro = plan4 == null ? "" : plan4.SegmentoCuatro;

                        SinAlitas.Admin.Entidad.PlanillaProfesor plan5 = fechitas.Find(p => p.SegmentoCinco != null);
                        detalle.SegmentoCinco = plan5 == null ? "" : plan5.SegmentoCinco;

                        SinAlitas.Admin.Entidad.PlanillaProfesor plan6 = fechitas.Find(p => p.SegmentoSeis != null);
                        detalle.SegmentoSeis = plan6 == null ? "" : plan6.SegmentoSeis;

                        SinAlitas.Admin.Entidad.PlanillaProfesor plan7 = fechitas.Find(p => p.SegmentoSiete != null);
                        detalle.SegmentoSiete = plan7 == null ? "" : plan7.SegmentoSiete;

                    }

                    plan.Detalle.Add(detalle);
                }

                listaFinal.Add(plan);
            }
        }
        //Ahora procesamos la lista final
        if (listaFinal != null && listaFinal.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ItemProfesor prof in listaFinal)
            {
                if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy)))
                {
                    SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                    detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(hoy);
                    prof.Detalle.Add(detalle);
                }
                if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos)))
                {
                    SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                    detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaDos);
                    prof.Detalle.Add(detalle);
                }
                if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres)))
                {
                    SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                    detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaTres);
                    prof.Detalle.Add(detalle);
                }
                if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro)))
                {
                    SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                    detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCuatro);
                    prof.Detalle.Add(detalle);
                }
                if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco)))
                {
                    SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                    detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaCinco);
                    prof.Detalle.Add(detalle);
                }
                if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis)))
                {
                    SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                    detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSeis);
                    prof.Detalle.Add(detalle);
                }
                if (!prof.Detalle.Exists(p => p.Fecha == SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete)))
                {
                    SinAlitas.Admin.Entidad.ItemDetalle detalle = new SinAlitas.Admin.Entidad.ItemDetalle();
                    detalle.Fecha = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(diaSiete);
                    prof.Detalle.Add(detalle);
                }
            }
        }
        if (listaFinal != null && listaFinal.Count > 0)
        {
            foreach (SinAlitas.Admin.Entidad.ItemProfesor prof in listaFinal)
            {
                if (prof.Detalle != null && prof.Detalle.Count > 0)
                {
                    prof.Detalle = prof.Detalle.OrderBy(p => p.Fecha).ToList();
                }
            }
        }

        litContenido.Text = ArmarContenido(listaFinal, hoy, diaDos, diaTres, diaCuatro, diaCinco, diaSeis, diaSiete);
    }
    private string ConstruyeLineasFechas()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class='col-xs-12 itemFechas'>");
        sb.Append("<div class='col-xs-5'>Horarios</div>");
        sb.Append("<div class='col-xs-1 text-center font-muypequeno'>10:00-10:45</div>");
        sb.Append("<div class='col-xs-1 text-center font-muypequeno'>11:15-12:00</div>");
        sb.Append("<div class='col-xs-1 text-center font-muypequeno'>12:30-13:15</div>");
        sb.Append("<div class='col-xs-1 text-center font-muypequeno'>14:45-15:30</div>");
        sb.Append("<div class='col-xs-1 text-center font-muypequeno'>16:00-16:45</div>");
        sb.Append("<div class='col-xs-1 text-center font-muypequeno'>17:15-18:00</div>");
        sb.Append("<div class='col-xs-1 text-center font-muypequeno'>18:30-19:15</div>");
        sb.Append("</div>");

        return sb.ToString();
    }
    private string ArmarContenido(List<SinAlitas.Admin.Entidad.ItemProfesor> item, int fechaUno, int fechaDos, int fechaTres, int fechaCuatro, int fechaCinco, int fechaSeis, int fechaSiete)
    {
        /*
            <div class="col-xs-5">Nombre Profesor</div>
            <div class="col-xs-1 text-center font-muypequeno">10:00-10:45</div>
            <div class="col-xs-1 text-center font-muypequeno">11:15-12:00</div>
            <div class="col-xs-1 text-center font-muypequeno">12:30-13:15</div>
            <div class="col-xs-1 text-center font-muypequeno">14:45-15:30</div>
            <div class="col-xs-1 text-center font-muypequeno">16:00-16:45</div>
            <div class="col-xs-1 text-center font-muypequeno">17:15-18:00</div>
            <div class="col-xs-1 text-center font-muypequeno">18:30-19:15</div>
        */
        StringBuilder sb = new StringBuilder();
        if (item != null && item.Count > 0)
        {
            #region fecha uno
            DateTime fechaUnoDate = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(fechaUno);
            sb.Append("<div class='col-xs-12 no-padding'>");
            sb.Append("<div class='col-xs-5'></div>");
            sb.AppendFormat("<div class='col-xs-7 text-center itemFecha'>{0}</div>", fechaUnoDate.ToShortDateString());
            sb.Append("</div>");
            sb.Append(ConstruyeLineasFechas());

            foreach (SinAlitas.Admin.Entidad.ItemProfesor itm in item)
            {

                sb.Append("<div class='col-xs-12 no-padding border-item-planilla itemProfesor'>");
                sb.AppendFormat("<div class='col-xs-5'>{0}</div>", itm.NombreProfesor);
                if (itm.Detalle != null && itm.Detalle.Count > 0)
                {
                    //cada detalle es un dia
                    //para pruebas vamos a tomar el primer dia
                    SinAlitas.Admin.Entidad.ItemDetalle primerdia = itm.Detalle.Find(p=>p.Fecha == fechaUnoDate);
                    if (primerdia != null)
                    {
                        if (primerdia.SegmentoUno == null || primerdia.SegmentoUno == "")
                        {
                            primerdia.SegmentoUno = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoUno);
                        }
                        else
                        {
                            if (primerdia.SegmentoUno == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoUno);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoUno);
                        }

                        if (primerdia.SegmentoDos == null || primerdia.SegmentoDos == "")
                        {
                            primerdia.SegmentoDos = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoDos);
                        }
                        else
                        {
                            if (primerdia.SegmentoDos == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoDos);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoDos);
                            
                        }

                        if (primerdia.SegmentoTres == null || primerdia.SegmentoTres == "")
                        {
                            primerdia.SegmentoTres = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoTres);
                        }
                        else
                        {
                            if (primerdia.SegmentoTres == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoTres);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoTres);
                        }

                        if (primerdia.SegmentoCuatro == null || primerdia.SegmentoCuatro == "")
                        {
                            primerdia.SegmentoCuatro = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCuatro);
                        }
                        else
                        {
                            if (primerdia.SegmentoCuatro == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCuatro);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCuatro);
                        }

                        if (primerdia.SegmentoCinco == null || primerdia.SegmentoCinco == "")
                        {
                            primerdia.SegmentoCinco = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCinco);
                        }
                        else
                        {
                            if (primerdia.SegmentoCinco == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCinco);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCinco);
                        }

                        if (primerdia.SegmentoSeis == null || primerdia.SegmentoSeis == "")
                        {
                            primerdia.SegmentoSeis = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSeis);
                        }
                        else
                        {
                            if (primerdia.SegmentoSeis == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSeis);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSeis);
                        }

                        if (primerdia.SegmentoSiete == null || primerdia.SegmentoSiete == "")
                        {
                            primerdia.SegmentoSiete = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSiete);
                        }
                        else
                        {
                            if (primerdia.SegmentoSiete == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSiete);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSiete);
                        }

                    }
                }
                sb.Append("</div>");
            }
            #endregion

            #region fecha dos
            DateTime fechaDosDate = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(fechaDos);
            sb.Append("<div class='col-xs-12 no-padding'>");
            sb.Append("<div class='col-xs-5'></div>");
            sb.AppendFormat("<div class='col-xs-7 text-center itemFecha'>{0}</div>", fechaDosDate.ToShortDateString());
            sb.Append("</div>");
            sb.Append(ConstruyeLineasFechas());

            foreach (SinAlitas.Admin.Entidad.ItemProfesor itm in item)
            {

                sb.Append("<div class='col-xs-12 border-item-planilla no-padding itemProfesor'>");
                sb.AppendFormat("<div class='col-xs-5'>{0}</div>", itm.NombreProfesor);
                if (itm.Detalle != null && itm.Detalle.Count > 0)
                {
                    //cada detalle es un dia
                    //para pruebas vamos a tomar el primer dia
                    SinAlitas.Admin.Entidad.ItemDetalle primerdia = itm.Detalle.Find(p => p.Fecha == fechaDosDate);
                    if (primerdia != null)
                    {
                        if (primerdia.SegmentoUno == null || primerdia.SegmentoUno == "")
                        {
                            primerdia.SegmentoUno = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoUno);
                        }
                        else
                        {
                            if (primerdia.SegmentoUno == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoUno);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoUno);
                        }

                        if (primerdia.SegmentoDos == null || primerdia.SegmentoDos == "")
                        {
                            primerdia.SegmentoDos = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoDos);
                        }
                        else
                        {
                            if (primerdia.SegmentoDos == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoDos);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoDos);

                        }

                        if (primerdia.SegmentoTres == null || primerdia.SegmentoTres == "")
                        {
                            primerdia.SegmentoTres = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoTres);
                        }
                        else
                        {
                            if (primerdia.SegmentoTres == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoTres);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoTres);
                        }

                        if (primerdia.SegmentoCuatro == null || primerdia.SegmentoCuatro == "")
                        {
                            primerdia.SegmentoCuatro = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCuatro);
                        }
                        else
                        {
                            if (primerdia.SegmentoCuatro == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCuatro);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCuatro);
                        }

                        if (primerdia.SegmentoCinco == null || primerdia.SegmentoCinco == "")
                        {
                            primerdia.SegmentoCinco = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCinco);
                        }
                        else
                        {
                            if (primerdia.SegmentoCinco == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCinco);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCinco);
                        }

                        if (primerdia.SegmentoSeis == null || primerdia.SegmentoSeis == "")
                        {
                            primerdia.SegmentoSeis = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSeis);
                        }
                        else
                        {
                            if (primerdia.SegmentoSeis == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSeis);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSeis);
                        }

                        if (primerdia.SegmentoSiete == null || primerdia.SegmentoSiete == "")
                        {
                            primerdia.SegmentoSiete = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSiete);
                        }
                        else
                        {
                            if (primerdia.SegmentoSiete == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSiete);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSiete);
                        }

                    }
                }
                sb.Append("</div>");
            }
            #endregion

            #region fecha tres
            DateTime fechaTresDate = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(fechaTres);
            sb.Append("<div class='col-xs-12 no-padding'>");
            sb.Append("<div class='col-xs-5'></div>");
            sb.AppendFormat("<div class='col-xs-7 text-center itemFecha'>{0}</div>", fechaTresDate.ToShortDateString());
            sb.Append("</div>");
            sb.Append(ConstruyeLineasFechas());

            foreach (SinAlitas.Admin.Entidad.ItemProfesor itm in item)
            {

                sb.Append("<div class='col-xs-12 border-item-planilla no-padding itemProfesor'>");
                sb.AppendFormat("<div class='col-xs-5'>{0}</div>", itm.NombreProfesor);
                if (itm.Detalle != null && itm.Detalle.Count > 0)
                {
                    //cada detalle es un dia
                    //para pruebas vamos a tomar el primer dia
                    SinAlitas.Admin.Entidad.ItemDetalle primerdia = itm.Detalle.Find(p => p.Fecha == fechaTresDate);
                    if (primerdia != null)
                    {
                        if (primerdia.SegmentoUno == null || primerdia.SegmentoUno == "")
                        {
                            primerdia.SegmentoUno = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoUno);
                        }
                        else
                        {
                            if (primerdia.SegmentoUno == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoUno);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoUno);
                        }

                        if (primerdia.SegmentoDos == null || primerdia.SegmentoDos == "")
                        {
                            primerdia.SegmentoDos = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoDos);
                        }
                        else
                        {
                            if (primerdia.SegmentoDos == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoDos);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoDos);

                        }

                        if (primerdia.SegmentoTres == null || primerdia.SegmentoTres == "")
                        {
                            primerdia.SegmentoTres = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoTres);
                        }
                        else
                        {
                            if (primerdia.SegmentoTres == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoTres);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoTres);
                        }

                        if (primerdia.SegmentoCuatro == null || primerdia.SegmentoCuatro == "")
                        {
                            primerdia.SegmentoCuatro = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCuatro);
                        }
                        else
                        {
                            if (primerdia.SegmentoCuatro == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCuatro);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCuatro);
                        }

                        if (primerdia.SegmentoCinco == null || primerdia.SegmentoCinco == "")
                        {
                            primerdia.SegmentoCinco = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCinco);
                        }
                        else
                        {
                            if (primerdia.SegmentoCinco == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCinco);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCinco);
                        }

                        if (primerdia.SegmentoSeis == null || primerdia.SegmentoSeis == "")
                        {
                            primerdia.SegmentoSeis = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSeis);
                        }
                        else
                        {
                            if (primerdia.SegmentoSeis == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSeis);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSeis);
                        }

                        if (primerdia.SegmentoSiete == null || primerdia.SegmentoSiete == "")
                        {
                            primerdia.SegmentoSiete = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSiete);
                        }
                        else
                        {
                            if (primerdia.SegmentoSiete == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSiete);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSiete);
                        }

                    }
                }
                sb.Append("</div>");
            }
            #endregion

            #region fecha cuatro
            DateTime fechaCuatroDate = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(fechaCuatro);
            sb.Append("<div class='col-xs-12 no-padding'>");
            sb.Append("<div class='col-xs-5'></div>");
            sb.AppendFormat("<div class='col-xs-7 text-center itemFecha'>{0}</div>", fechaCuatroDate.ToShortDateString());
            sb.Append("</div>");
            sb.Append(ConstruyeLineasFechas());

            foreach (SinAlitas.Admin.Entidad.ItemProfesor itm in item)
            {

                sb.Append("<div class='col-xs-12 border-item-planilla no-padding itemProfesor'>");
                sb.AppendFormat("<div class='col-xs-5'>{0}</div>", itm.NombreProfesor);
                if (itm.Detalle != null && itm.Detalle.Count > 0)
                {
                    //cada detalle es un dia
                    //para pruebas vamos a tomar el primer dia
                    SinAlitas.Admin.Entidad.ItemDetalle primerdia = itm.Detalle.Find(p => p.Fecha == fechaCuatroDate);
                    if (primerdia != null)
                    {
                        if (primerdia.SegmentoUno == null || primerdia.SegmentoUno == "")
                        {
                            primerdia.SegmentoUno = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoUno);
                        }
                        else
                        {
                            if (primerdia.SegmentoUno == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoUno);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoUno);
                        }

                        if (primerdia.SegmentoDos == null || primerdia.SegmentoDos == "")
                        {
                            primerdia.SegmentoDos = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoDos);
                        }
                        else
                        {
                            if (primerdia.SegmentoDos == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoDos);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoDos);

                        }

                        if (primerdia.SegmentoTres == null || primerdia.SegmentoTres == "")
                        {
                            primerdia.SegmentoTres = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoTres);
                        }
                        else
                        {
                            if (primerdia.SegmentoTres == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoTres);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoTres);
                        }

                        if (primerdia.SegmentoCuatro == null || primerdia.SegmentoCuatro == "")
                        {
                            primerdia.SegmentoCuatro = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCuatro);
                        }
                        else
                        {
                            if (primerdia.SegmentoCuatro == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCuatro);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCuatro);
                        }

                        if (primerdia.SegmentoCinco == null || primerdia.SegmentoCinco == "")
                        {
                            primerdia.SegmentoCinco = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCinco);
                        }
                        else
                        {
                            if (primerdia.SegmentoCinco == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCinco);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCinco);
                        }

                        if (primerdia.SegmentoSeis == null || primerdia.SegmentoSeis == "")
                        {
                            primerdia.SegmentoSeis = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSeis);
                        }
                        else
                        {
                            if (primerdia.SegmentoSeis == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSeis);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSeis);
                        }

                        if (primerdia.SegmentoSiete == null || primerdia.SegmentoSiete == "")
                        {
                            primerdia.SegmentoSiete = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSiete);
                        }
                        else
                        {
                            if (primerdia.SegmentoSiete == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSiete);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSiete);
                        }

                    }
                }
                sb.Append("</div>");
            }
            #endregion

            #region fecha CINCO
            DateTime fechaCincoDate = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(fechaCinco);
            sb.Append("<div class='col-xs-12 no-padding'>");
            sb.Append("<div class='col-xs-5'></div>");
            sb.AppendFormat("<div class='col-xs-7 text-center itemFecha'>{0}</div>", fechaCincoDate.ToShortDateString());
            sb.Append("</div>");
            sb.Append(ConstruyeLineasFechas());

            foreach (SinAlitas.Admin.Entidad.ItemProfesor itm in item)
            {

                sb.Append("<div class='col-xs-12 border-item-planilla no-padding itemProfesor'>");
                sb.AppendFormat("<div class='col-xs-5'>{0}</div>", itm.NombreProfesor);
                if (itm.Detalle != null && itm.Detalle.Count > 0)
                {
                    //cada detalle es un dia
                    //para pruebas vamos a tomar el primer dia
                    SinAlitas.Admin.Entidad.ItemDetalle primerdia = itm.Detalle.Find(p => p.Fecha == fechaCincoDate);
                    if (primerdia != null)
                    {
                        if (primerdia.SegmentoUno == null || primerdia.SegmentoUno == "")
                        {
                            primerdia.SegmentoUno = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoUno);
                        }
                        else
                        {
                            if (primerdia.SegmentoUno == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoUno);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoUno);
                        }

                        if (primerdia.SegmentoDos == null || primerdia.SegmentoDos == "")
                        {
                            primerdia.SegmentoDos = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoDos);
                        }
                        else
                        {
                            if (primerdia.SegmentoDos == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoDos);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoDos);

                        }

                        if (primerdia.SegmentoTres == null || primerdia.SegmentoTres == "")
                        {
                            primerdia.SegmentoTres = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoTres);
                        }
                        else
                        {
                            if (primerdia.SegmentoTres == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoTres);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoTres);
                        }

                        if (primerdia.SegmentoCuatro == null || primerdia.SegmentoCuatro == "")
                        {
                            primerdia.SegmentoCuatro = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCuatro);
                        }
                        else
                        {
                            if (primerdia.SegmentoCuatro == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCuatro);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCuatro);
                        }

                        if (primerdia.SegmentoCinco == null || primerdia.SegmentoCinco == "")
                        {
                            primerdia.SegmentoCinco = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCinco);
                        }
                        else
                        {
                            if (primerdia.SegmentoCinco == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCinco);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCinco);
                        }

                        if (primerdia.SegmentoSeis == null || primerdia.SegmentoSeis == "")
                        {
                            primerdia.SegmentoSeis = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSeis);
                        }
                        else
                        {
                            if (primerdia.SegmentoSeis == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSeis);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSeis);
                        }

                        if (primerdia.SegmentoSiete == null || primerdia.SegmentoSiete == "")
                        {
                            primerdia.SegmentoSiete = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSiete);
                        }
                        else
                        {
                            if (primerdia.SegmentoSiete == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSiete);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSiete);
                        }

                    }
                }
                sb.Append("</div>");
            }
            #endregion

            #region fecha seis
            DateTime fechaSeisDate = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(fechaSeis);
            sb.Append("<div class='col-xs-12 no-padding'>");
            sb.Append("<div class='col-xs-5'></div>");
            sb.AppendFormat("<div class='col-xs-7 text-center itemFecha'>{0}</div>", fechaSeisDate.ToShortDateString());
            sb.Append("</div>");
            sb.Append(ConstruyeLineasFechas());

            foreach (SinAlitas.Admin.Entidad.ItemProfesor itm in item)
            {

                sb.Append("<div class='col-xs-12 border-item-planilla no-padding itemProfesor'>");
                sb.AppendFormat("<div class='col-xs-5'>{0}</div>", itm.NombreProfesor);
                if (itm.Detalle != null && itm.Detalle.Count > 0)
                {
                    //cada detalle es un dia
                    //para pruebas vamos a tomar el primer dia
                    SinAlitas.Admin.Entidad.ItemDetalle primerdia = itm.Detalle.Find(p => p.Fecha == fechaSeisDate);
                    if (primerdia != null)
                    {
                        if (primerdia.SegmentoUno == null || primerdia.SegmentoUno == "")
                        {
                            primerdia.SegmentoUno = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoUno);
                        }
                        else
                        {
                            if (primerdia.SegmentoUno == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoUno);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoUno);
                        }

                        if (primerdia.SegmentoDos == null || primerdia.SegmentoDos == "")
                        {
                            primerdia.SegmentoDos = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoDos);
                        }
                        else
                        {
                            if (primerdia.SegmentoDos == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoDos);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoDos);

                        }

                        if (primerdia.SegmentoTres == null || primerdia.SegmentoTres == "")
                        {
                            primerdia.SegmentoTres = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoTres);
                        }
                        else
                        {
                            if (primerdia.SegmentoTres == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoTres);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoTres);
                        }

                        if (primerdia.SegmentoCuatro == null || primerdia.SegmentoCuatro == "")
                        {
                            primerdia.SegmentoCuatro = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCuatro);
                        }
                        else
                        {
                            if (primerdia.SegmentoCuatro == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCuatro);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCuatro);
                        }

                        if (primerdia.SegmentoCinco == null || primerdia.SegmentoCinco == "")
                        {
                            primerdia.SegmentoCinco = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCinco);
                        }
                        else
                        {
                            if (primerdia.SegmentoCinco == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCinco);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCinco);
                        }

                        if (primerdia.SegmentoSeis == null || primerdia.SegmentoSeis == "")
                        {
                            primerdia.SegmentoSeis = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSeis);
                        }
                        else
                        {
                            if (primerdia.SegmentoSeis == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSeis);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSeis);
                        }

                        if (primerdia.SegmentoSiete == null || primerdia.SegmentoSiete == "")
                        {
                            primerdia.SegmentoSiete = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSiete);
                        }
                        else
                        {
                            if (primerdia.SegmentoSiete == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSiete);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSiete);
                        }

                    }
                }
                sb.Append("</div>");
            }
            #endregion

            #region fecha siete
            DateTime fechaSieteDate = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(fechaSiete);
            sb.Append("<div class='col-xs-12 no-padding'>");
            sb.Append("<div class='col-xs-5'></div>");
            sb.AppendFormat("<div class='col-xs-7 text-center itemFecha'>{0}</div>", fechaSieteDate.ToShortDateString());
            sb.Append("</div>");
            sb.Append(ConstruyeLineasFechas());

            foreach (SinAlitas.Admin.Entidad.ItemProfesor itm in item)
            {

                sb.Append("<div class='col-xs-12 border-item-planilla no-padding itemProfesor'>");
                sb.AppendFormat("<div class='col-xs-5'>{0}</div>", itm.NombreProfesor);
                if (itm.Detalle != null && itm.Detalle.Count > 0)
                {
                    //cada detalle es un dia
                    //para pruebas vamos a tomar el primer dia
                    SinAlitas.Admin.Entidad.ItemDetalle primerdia = itm.Detalle.Find(p => p.Fecha == fechaSieteDate);
                    if (primerdia != null)
                    {
                        if (primerdia.SegmentoUno == null || primerdia.SegmentoUno == "")
                        {
                            primerdia.SegmentoUno = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoUno);
                        }
                        else
                        {
                            if (primerdia.SegmentoUno == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoUno);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoUno);
                        }

                        if (primerdia.SegmentoDos == null || primerdia.SegmentoDos == "")
                        {
                            primerdia.SegmentoDos = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoDos);
                        }
                        else
                        {
                            if (primerdia.SegmentoDos == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoDos);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoDos);

                        }

                        if (primerdia.SegmentoTres == null || primerdia.SegmentoTres == "")
                        {
                            primerdia.SegmentoTres = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoTres);
                        }
                        else
                        {
                            if (primerdia.SegmentoTres == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoTres);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoTres);
                        }

                        if (primerdia.SegmentoCuatro == null || primerdia.SegmentoCuatro == "")
                        {
                            primerdia.SegmentoCuatro = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCuatro);
                        }
                        else
                        {
                            if (primerdia.SegmentoCuatro == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCuatro);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCuatro);
                        }

                        if (primerdia.SegmentoCinco == null || primerdia.SegmentoCinco == "")
                        {
                            primerdia.SegmentoCinco = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoCinco);
                        }
                        else
                        {
                            if (primerdia.SegmentoCinco == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoCinco);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoCinco);
                        }

                        if (primerdia.SegmentoSeis == null || primerdia.SegmentoSeis == "")
                        {
                            primerdia.SegmentoSeis = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSeis);
                        }
                        else
                        {
                            if (primerdia.SegmentoSeis == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSeis);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSeis);
                        }

                        if (primerdia.SegmentoSiete == null || primerdia.SegmentoSiete == "")
                        {
                            primerdia.SegmentoSiete = "---";
                            sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoAzul'>{0}</div>", primerdia.SegmentoSiete);
                        }
                        else
                        {
                            if (primerdia.SegmentoSiete == "Disponible")
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoVerde'>{0}</div>", primerdia.SegmentoSiete);
                            else
                                sb.AppendFormat("<div class='col-xs-1 text-center font-muypequeno fondoRojo'>{0}</div>", primerdia.SegmentoSiete);
                        }

                    }
                }
                sb.Append("</div>");
            }
            #endregion

        }


        return sb.ToString();

    }


    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        DateTime fechaInicio = dtFechaInicio.Date;
        try
        {
            Consultar(fechaInicio);
        }
        catch(Exception ex)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, ex.Message);
        }


    }
}