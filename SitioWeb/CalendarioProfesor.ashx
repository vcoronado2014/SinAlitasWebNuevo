<%@ WebHandler Language="C#" Class="CalendarioProfesor" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class CalendarioProfesor : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string nodId = context.Request.Form["nodId"];
        string profId = context.Request.Form["profId"];
        string fecha  = context.Request.Form["fecha"];
        string opcion  = context.Request.Form["opcion"];
        string respuesta = "";

        DateTime fechaConsultar = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(int.Parse(fecha));


        // simulate Microsoft XSS protection
        int mes = fechaConsultar.Month;
        int anno = fechaConsultar.Year;
        
        if (opcion == "habilitar")
            respuesta = SinAlitas.Admin.Negocio.SegmentoHorario.GuardarSegmentoCompleto(int.Parse(nodId), int.Parse(profId), int.Parse(fecha));
        else if (opcion == "eliminar")
            respuesta = SinAlitas.Admin.Negocio.SegmentoHorario.BorrarSegmentoCompleto(int.Parse(nodId), int.Parse(profId), int.Parse(fecha));

        var wrapper = new { d = mes , e = respuesta, f = anno };
        context.Response.Write(JsonConvert.SerializeObject(wrapper));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}