<%@ WebHandler Language="C#" Class="CrearModificarProfesor" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class CrearModificarProfesor : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        System.Configuration.ConnectionStringSettings setCnsWebLun = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["MSUsuarioLunConectionString"];
        context.Response.ContentType = "text/plain";

        string profId = context.Request.Form["profId"];
        string opcion  = context.Request.Form["opcion"];
        string respuesta = "";

        //DateTime fechaConsultar = SinAlitas.Admin.Entidad.Utiles.RetornaFecha(int.Parse(fecha));
        SinAlitas.Admin.Entidad.Profesor profesor = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPorIdSPEliminado(int.Parse(profId));
        var wrapper = new { d= 0, e = respuesta };
        //antes de todo ver si existe el profesor
        bool puede = true;
        if (profesor != null && profesor.Id > 0)
        {
            if (opcion=="activar")
            {
                profesor.Activo = 1;
                profesor.Eliminado = 0;
            }
            else
            {
                //antes de eliminar debemos validar si tiene o no clases pendientes.
                if (SinAlitas.Admin.Negocio.CrudProfesores.ObtenerCuposPendientes(profesor.Id).Count > 0)
                {
                    puede = false;
                    respuesta = "El Profesor todavía tiene cupos tomados con clientes, no puede borrar.";
                }
                else
                {
                    profesor.Activo = 0;
                    profesor.Eliminado = 1;
                }
            }
            if (puede)
            {
                VCFramework.Negocio.Factory.Factory fac = new VCFramework.Negocio.Factory.Factory();
                fac.Update<SinAlitas.Admin.Entidad.Profesor>(profesor, setCnsWebLun);
                respuesta = "Profesor modificado con éxito";
            }
            wrapper = new { d = profesor.Id , e = respuesta };

        }
        else
        {
            respuesta = "Error, el profesor no existe, no se puede realizar la operación.";
            wrapper = new { d = 0 , e = respuesta };
        }


        context.Response.Write(JsonConvert.SerializeObject(wrapper));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}