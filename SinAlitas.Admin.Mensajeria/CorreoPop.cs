using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SinAlitas.Admin.Mensajeria
{
    public class CorreoPop
    {
        private static System.Net.Mail.MailMessage ConstruyeMensaje(List<string> correos, string mensaje)
        {
            System.Net.Mail.MailMessage sms = new System.Net.Mail.MailMessage();
            sms.Subject = "Sin Alitas";
            //recorremos la lista de usuarios de la institución
            if (correos != null && correos.Count > 0)
            {
                foreach (string s in correos)
                {
                    sms.To.Add(s);
                }
            }
            sms.From = new System.Net.Mail.MailAddress("sinalitas@cpas.cl", "Sin Alitas");
            sms.IsBodyHtml = true;

            string htmlMensaje = mensaje;

            sms.Body = htmlMensaje;

            return sms;

        }
        public static void EnviarCorreo(List<string> correos, string mensaje)
        {
            ServidorCorreo cr = new ServidorCorreo();
            System.Net.Mail.MailMessage sms = ConstruyeMensaje(correos, mensaje);
            var task = System.Threading.Tasks.Task.Factory.StartNew(() => cr.Enviar(sms));
            //cr.Enviar(sms);

        }

        public static string RetornaMensajeCrearCodigoCliente(string codigo)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Estimado Cliente:\r\n");
            sb.AppendFormat("Ha sido generado un pack de clases para usted, el código es {0}, guarde su código ya que posteriormente necesitará ingresarlo, cualquier duda o consulta puede comunicarse con el Supervisor(a)", codigo);
            sb.Append(PieSinAlitas());
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCanceladaPorElCliente(string nombreCliente, string fechaHora)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Estimado Profesor:\r\n");
            sb.AppendFormat("Nuestro cliente {0} ha cancelado la clase del día {1} previa coordinación anterior, cualquier duda o consulta puede comunicarse con el Supervisor(a)", nombreCliente, fechaHora);
            sb.Append(PieSinAlitas());
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCanceladaPorElProfesor(string nombreProfesor, string fechaHora)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Estimado Cliente:\r\n");
            sb.AppendFormat("El profesor {0} ha cancelado la clase del día {1} previa coordinación con Usted, cualquier duda o consulta puede comunicarse con el Supervisor(a)", nombreProfesor, fechaHora);
            sb.Append(PieSinAlitas());
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCreadaParaElCliente(string nombreprofesor, string fechaHora)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Estimado Cliente:\r\n");
            sb.AppendFormat("Usted ha agendado una clase con el profesor {0} para el día {1}, cualquier duda o consulta puede comunicarse con el Supervisor(a)", nombreprofesor, fechaHora);
            sb.Append(PieSinAlitas());
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCreadaParaElCliente(Entidad.EnvoltorioClientePackProducto prodCodigo, string nombreProfesor)
        {
            StringBuilder sb = new StringBuilder();
            DateTime fechaHoraActual = DateTime.Now;
            Entidad.Producto producto = Negocio.Producto.ObtenerProductoPorId(prodCodigo.ProductoCodigo.ProId);

            sb.Append("<html>");
            if (fechaHoraActual.Hour < 12)
                sb.Append("Buenos días estimado(a) " + prodCodigo.Cliente.Nombres + " " + prodCodigo.Cliente.PrimerApellido + "<br/>");
            else
                sb.Append("Buenas tardes estimado(a) " + prodCodigo.Cliente.Nombres + " " + prodCodigo.Cliente.PrimerApellido + "<br/>");

            sb.Append("Usted ha agendado con éxito las clases de natación a domicilio que le brindará SinAlitas, le informamos las características de los servicios solicitados:<br/>");
            sb.AppendFormat("Tipo de Pack: {0}<br/>", producto.Nombre);
            sb.AppendFormat("Valor por Pack: {0}<br/>", prodCodigo.ProductoCodigo.TotalPack.ToString());
            sb.AppendFormat("Profesor: {0}<br/>", nombreProfesor);
            sb.Append("Clases:<br/>");
            if (prodCodigo.CuposTomados != null && prodCodigo.CuposTomados.Count > 0)
            {
                foreach (Entidad.Cupo cp in prodCodigo.CuposTomados)
                {
                    sb.AppendFormat("{0} bloque {1}<br/>", cp.FechaHoraInicio.ToShortDateString(), cp.FechaHoraInicio.ToShortTimeString() + " " + cp.FechaHoraTermino.ToShortTimeString());
                }
            }

            sb.Append("</html>");
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCreadaParaElProfesor(string nombreCliente, string fechaHora, string domicilio)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Estimado Profesor:\r\n");
            sb.AppendFormat("Nuestro cliente {0} ha creado una clase con usted para el día {1} en {2}", nombreCliente, fechaHora, domicilio);
            sb.Append(PieSinAlitas());
            return sb.ToString();

        }
        public static string RetornaMensajeClaseCreadaParaElProfesor(Entidad.Cupo primerCupo)
        {
            StringBuilder sb = new StringBuilder();
            DateTime fechaHoraActual = DateTime.Now;
            sb.Append("<html>");
            sb.Append("Estimado Profesor<br/>");
            sb.AppendFormat("Le informamos que se le ha asignado un nuevo cliente, su primera clase es el día {0} en el bloque {1}.<br/>", primerCupo.FechaHoraInicio.ToShortDateString(), primerCupo.FechaHoraInicio.ToShortTimeString() + " - " + primerCupo.FechaHoraTermino.ToShortTimeString());
            sb.Append("<br/>");
            sb.Append("Lo invitiamos a revisar la informacion de esta cliente para que realice la llamada telefonica previamente.");


            sb.Append("</html>");
            return sb.ToString();

        }
        public static string RetornaMensajeCorreoAgendamientoProfe(string cantidadClases, DateTime fecha)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("Estimado Profesor:\r\n");
            sb.AppendFormat("Usted ha disponibilizado {0} clases ara el día {1}\r\n", cantidadClases, fecha.ToShortDateString());
            sb.Append(PieSinAlitas());
            return sb.ToString();
        }
        public static string RetornaMensajeClaseCanceladaPorElCliente(Entidad.Profesor profesor, Entidad.Cliente cliente, Entidad.Cupo cupoAntiguo, Entidad.Cupo cupoNuevo)
        {
            StringBuilder sb = new StringBuilder();
            DateTime fechaHoraActual = DateTime.Now;
            sb.Append("<html>");
            if (fechaHoraActual.Hour < 12)
                sb.Append("Buenos días estimado " + profesor.Nombres + " " + profesor.PrimerApellido + "<br/>");
            else
                sb.Append("Buenas tardes estimado " + profesor.Nombres + " " + profesor.PrimerApellido + "<br/>");

            sb.AppendFormat("Le informamos que el cliente(a) {0}, reagendó su clase correspondiente al día {1} bloque {2}.<br/>", cliente.Nombres + " " + cliente.PrimerApellido, cupoAntiguo.FechaHoraInicio.ToShortDateString(), cupoAntiguo.FechaHoraInicio.ToShortTimeString() + " - " + cupoAntiguo.FechaHoraTermino.ToShortTimeString());
            sb.Append("<br/>");
            sb.AppendFormat("La modificación se realizó para el día {0} en el bloque {1}.", cupoNuevo.FechaHoraInicio.ToShortDateString(), cupoNuevo.FechaHoraInicio.ToShortTimeString() + " - " + cupoNuevo.FechaHoraTermino.ToShortTimeString());


            sb.Append("</html>");
            return sb.ToString();
        }
        public static string RetornaMensajeClaseCanceladaPorElProfesor(Entidad.Cupo cupoAntiguo)
        {
            StringBuilder sb = new StringBuilder();
            DateTime fechaHoraActual = DateTime.Now;
            sb.Append("<html>");
            sb.Append("Estimada(o) Clienta(e) <br/>");
            sb.AppendFormat("Le informamos que nuestro Profesor mantuvo un inconveniente para realizar la clase  correspondiente al día {0} en el bloque {1}, invitamos a Usted a reagendar la clase que tiene pendiente en los horarios disponibles de nuestro profesional<br/>", cupoAntiguo.FechaHoraInicio.ToShortDateString(), cupoAntiguo.FechaHoraInicio.ToShortTimeString() + " - " + cupoAntiguo.FechaHoraTermino.ToShortTimeString());
            sb.Append("<br/>");
            sb.Append("Muchas gracias y disculpe las molestias.");


            sb.Append("</html>");
            return sb.ToString();
        }
        public static string PieSinAlitas()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Información proporcionada por el Sistema de Mensajería de SinAlitas.cl\r\n");
            sb.Append("Cualquier duda o consulta comuníquese con el Supervisor(a)\r\n");
            return sb.ToString();
        }




    }

}
