using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace GCMServer
{
    /// <summary>
    /// Summary description for ConsultaUsuario
    /// </summary>
    public class ConsultaUsuario : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string usuario = context.Request["usuario"];
            string clave = context.Request["clave"];

            context.Response.ContentType = "application/json";

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(ObtenerUsuario(usuario, clave));

            context.Response.Write(sb.ToString());
        }
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

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}