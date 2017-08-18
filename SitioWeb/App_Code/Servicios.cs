using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for Servicios
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class Servicios : System.Web.Services.WebService
{

    [WebMethod]
    public string Validar(string usuario, string clave)
    {
        string retorno = string.Empty;
        SinAlitas.Admin.Entidad.Profesor us = null;
        SinAlitas.Admin.Entidad.UsuarioAps usuarioRet = new SinAlitas.Admin.Entidad.UsuarioAps();
        try
        {
            us = new SinAlitas.Admin.Entidad.Profesor();
            us = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPorUsuarioPassword(usuario, clave);
            if (us != null && us.Id > 0)
            {

                usuarioRet.ApellidoMaterno = us.SegundoApellido;
                usuarioRet.ApellidoPaterno = us.PrimerApellido;
               // usuarioRet.Direccion = us.Direccion;
                //usuarioRet.FechaDeNacimiento = us.FechaNacimiento;
                usuarioRet.Id = us.Id;
                usuarioRet.IdRyf = 0;
                usuarioRet.NodId = us.NodId;
                usuarioRet.Nombres = us.Nombres;
                usuarioRet.Rut = us.Rut;
                usuarioRet.RolId = us.RolId;

                JavaScriptSerializer js = new JavaScriptSerializer();
                retorno = js.Serialize(usuarioRet);
            }
            else
            {
                retorno = "Usuario no existe.";

            }

        }
        catch (Exception ex)
        {
            retorno = ex.Message;
        }

        return retorno;
    }

}
