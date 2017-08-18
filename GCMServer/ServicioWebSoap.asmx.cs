using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace GCMServer
{
    /// <summary>
    /// Summary description for ServicioWebSoap
    /// </summary>
    [WebService(Namespace = "http://cpas.cl/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ServicioWebSoap : System.Web.Services.WebService
    {

        [WebMethod]
        public int RegistroCliente(string usuario, string codigoCliente)
        {
            SinAlitas.Admin.Entidad.NotificacionCliente notificacion = SinAlitas.Admin.Negocio.NotificacionCliente.Obtener(usuario);
            int res = 0;
            if (notificacion != null && notificacion.Id > 0)
            {
                //actualizo el codigo
                notificacion.CodigoCliente = codigoCliente;
                SinAlitas.Admin.Negocio.NotificacionCliente.Actualizar(notificacion);
                res = 1;

            }
            else
            {
                notificacion.CodigoCliente = codigoCliente;
                notificacion.NombreUsuario = usuario;
                SinAlitas.Admin.Negocio.NotificacionCliente.Insetar(notificacion);
            }

            return res;
        }

        [WebMethod]
        public string ObtenerUsuario(string usuario, string clave)
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
}
