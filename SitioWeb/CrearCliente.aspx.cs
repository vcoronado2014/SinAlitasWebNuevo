using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CrearCliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //VOLVEMOS A NULL ESTA VARIABLE
        if (Session["PRIMERA_FECHA"] != null)
            Session["PRIMERA_FECHA"] = null;
        SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
        if (Session["USUARIO_AUTENTICADO"] != null)
        {
            envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
            if (envProfesor != null && envProfesor.Profesor.Id > 0)
            {
                litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;
                //Encabezado.TextoEncabezado = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;


            }
            else
                Response.Redirect("~/login.aspx");
        }
        else
            Response.Redirect("~/login.aspx");

    }
    private bool Validar(int idComuna)
    {
        bool retorno = true;
        string email = txtCorreo.Text;
        string nombres = txtNombres.Text;
        string apellidoPaterno = txtApellidoPaterno.Text;
        int region = int.Parse(cmbRegion.Value.ToString());
        int comuna = idComuna;
        string direccion = txtDireccion.Text;
        string celular = txtCelular.Text;


        if(!SinAlitas.Admin.Entidad.Utiles.EmailIsValid(email))
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Email inválido");
            retorno = false;
        }
        if (nombres.Length == 0)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Nombre Requerido");
            retorno = false;
        }
        if (apellidoPaterno.Length == 0)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Primer Apellido Requerido");
            retorno = false;
        }
        if (direccion.Length == 0)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Dirección Requerida");
            retorno = false;
        }
        if (region <= 0)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Región Requerida");
            retorno = false;
        }
        if (comuna <= 0)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Comuna Requerida");
            retorno = false;
        }
        if (celular.Length != 9)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "El Celular debe contener 8 dígitos.");
            retorno = false;
        }
        if (celular.Length > 0)
        {
            foreach(Char s in celular)
            {
                if (Char.IsLetter(s))
                {
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "El Celular debe contener sólo numeros.");
                    retorno = false;
                    break;
                }
            }
        }
        return retorno;
    }
    private void Desactivar()
    {
        btnGuardar.ClientEnabled = false;
        btnCancelar.Text = "Volver";

    }
    protected void pnlGeneral_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        string[] param = e.Parameter.Split('|');
        if (param[0].ToString().ToUpper() == "GUARDAR")
        {

            int idComuna = 0;
            if (param[1] != "null")
                idComuna =  int.Parse(param[1].ToString());
            if (Validar(idComuna))
            {

                int idNodo = 0;
                int idPais = 0;
                SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor = new SinAlitas.Admin.Entidad.EnvoltorioProfesor();
                if (Session["USUARIO_AUTENTICADO"] != null)
                {
                    envProfesor = Session["USUARIO_AUTENTICADO"] as SinAlitas.Admin.Entidad.EnvoltorioProfesor;
                    if (envProfesor != null && envProfesor.Profesor.Id > 0)
                    {
                        idNodo = envProfesor.Nodo.Id;
                        idPais = envProfesor.Pais.Id;
                    }
                }

                string email = txtCorreo.Text;
                string nombres = txtNombres.Text;
                string apellidoPaterno = txtApellidoPaterno.Text;
                int region = int.Parse(cmbRegion.Value.ToString());
                int comuna = idComuna;
                string direccion = txtDireccion.Text;
                string celular = txtCelular.Text;
                string apellidoMaterno = txtApellidoMaterno.Text;
                string otroFono = txtOtroFono.Text;

                SinAlitas.Admin.Entidad.Cliente cliente = new SinAlitas.Admin.Entidad.Cliente();
                cliente.Activo = 1;
                cliente.Codigo = "";
                cliente.ComId = idComuna;
                cliente.Direccion = direccion;
                cliente.Eliminado = 0;
                cliente.Email = email;
                cliente.Fotografia = "";
                cliente.NodId = idNodo;
                cliente.Nombres = nombres.ToUpper();
                cliente.NombreUsuario = nombres;
                cliente.PaiId = idPais;
                cliente.Password = "123456";
                cliente.PrimerApellido = apellidoPaterno.ToUpper();
                cliente.RegId = region;
                cliente.Rut = "";
                cliente.SegundoApellido = apellidoMaterno.ToUpper();
                cliente.Sexo = "No Informado";
                cliente.TelefonosContacto = celular + ";" + otroFono;

                SinAlitas.Admin.Entidad.Cliente cteBuscar = SinAlitas.Admin.Negocio.Cliente.ObtenerClientePorNombres(cliente.Nombres, cliente.PrimerApellido);

                try {

                    if (cteBuscar.Id > 0)
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Este cliente ya existe con esos nombres y apellidos, no se puede guardar.");
                    else
                    {

                        int idNuevo = SinAlitas.Admin.Negocio.Cliente.Insetar(cliente);
                        if (idNuevo > 0)
                        {
                            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Cliente Guardado con éxito.");
                            Desactivar();
                        }
                        else
                            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Ocurrió un error al guardar cliente, contacte al Administrador");
                    }
                }
                catch(Exception ex)
                {
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, ex.Message);
                }
                //SinAlitas.Admin.Negocio.Cliente.in
            }
        }
    }

    protected void cmbComuna_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter.Length > 0)
        {
            odsComunas.SelectParameters[0].DefaultValue = e.Parameter;
            odsComunas.DataBind();
            cmbComuna.DataBind();
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InicioSupervisor.aspx");
    }
}