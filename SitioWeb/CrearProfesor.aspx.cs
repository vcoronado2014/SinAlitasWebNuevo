using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CrearProfesor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
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

                    //PARA PRUEBAS
                    //litContenidoTabla.Text = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerComunasProfesor(2);


                    //ahora podemos listar los Profesores
                    if (Request.QueryString["ES_NUEVO"] != null)
                    {
                        //CREANDO PROFESOR
                        SetearProfesor(true, 0);
                    }
                    if (Request.QueryString["ES_MODIFICADO"] != null && Request.QueryString["ID_PROFESOR"] != null)
                    {
                        //CREANDO PROFESOR
                        int idProfesor = int.Parse(Request.QueryString["ID_PROFESOR"]);
                        Session["ID_PROFESOR"] = idProfesor;
                        //traemos y seteamos los campos
                        SetearProfesor(false, idProfesor);

                    }


                }
                else
                    Response.Redirect("~/Login.aspx");
                if (envProfesor != null && envProfesor.Profesor.Id > 0)
                {
                    //pnlProfesor.ClientVisible = true;
                    litNombreUsuario.Text = envProfesor.Profesor.Nombres + " " + envProfesor.Profesor.PrimerApellido + " " + envProfesor.Profesor.SegundoApellido;

                }
                else
                    Response.Redirect("~/login.aspx");
            }
            else
                Response.Redirect("~/login.aspx");
        }
    }
    private void SetearProfesor(bool esNuevo, int idProfesor)
    {
        if (esNuevo == false)
        {
            txtRut.ClientEnabled = false;
            SinAlitas.Admin.Entidad.Profesor profesor = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPorIdSP(idProfesor);
            if (profesor != null && profesor.Id > 0)
            {
                txtRut.Text = profesor.Rut;
                txtNombres.Text = profesor.Nombres;
                txtPrimerApellido.Text = profesor.PrimerApellido;
                txtSegundorApellido.Text = profesor.SegundoApellido;
                txtEmail.Text = profesor.Email;
                txtTelefono.Text = profesor.TelefonosContacto;

            }
            ActualizarGrillaAsociadas(profesor.ComIdAsignada);
            ActualizarGrillaNOAsociadas(profesor.ComIdAsignada);
            //litContenidoTablaAsociada.Text = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerComunasProfesorAsociadas(profesor.ComIdAsignada);
            //litContenidoTablaNOAsociada.Text = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerComunasProfesorNOAsignadas(profesor.ComIdAsignada);
        }
        else
        {
            ActualizarGrillaAsociadas("");
            ActualizarGrillaNOAsociadas("*");
            //si es nuevo nos traemos todas las comunas
            //litContenidoTablaAsociada.Text = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerComunasProfesorAsociadas("");
            //litContenidoTablaNOAsociada.Text = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerComunasProfesorNOAsignadas("*");
        }
    }
    private void ActualizarGrillaAsociadas(string idsComunas)
    {
        odsComunasAsociadas.SelectParameters[0].DefaultValue = idsComunas;
        odsComunasAsociadas.DataBind();
        grillaAsociadas.DataBind();
    }
    private void ActualizarGrillaNOAsociadas(string idsComunas)
    {
        odsNoAsociadas.SelectParameters[0].DefaultValue = idsComunas;
        odsNoAsociadas.DataBind();
        grillaNoAsociadas.DataBind();
    }
    private bool ValidaRequeridos()
    {
        bool retorno = true;

        if (txtRut.Text == string.Empty)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Rut Requerido");
            retorno = false;
        }
        if (txtNombres.Text == string.Empty)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Nombre Requerido");
            retorno = false;
        }
        if (txtPrimerApellido.Text == string.Empty)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Apellido Requerido");
            retorno = false;
        }
        if (txtEmail.Text == string.Empty)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Email Requerido");
            retorno = false;
        }
        if (txtTelefono.Text == string.Empty)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Teléfono Requerido");
            retorno = false;
        }
        if (!txtEmail.Text.Contains("@"))
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Email mal formado");
            retorno = false;
        }
        if (!txtEmail.Text.Contains("."))
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Email mal formado");
            retorno = false;
        }
        if (!txtRut.Text.Contains("-"))
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Rut debe contener un guión");
            retorno = false;
        }

        return retorno;
    }
    protected void pnlPrincipal_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null)
        {

            if (e.Parameter == "GUARDAR")
            {
                int idProfesor = 0;
                if (Session["ID_PROFESOR"] != null)
                    idProfesor =  int.Parse(Session["ID_PROFESOR"].ToString());

                if (idProfesor > 0)
                {
                    SinAlitas.Admin.Entidad.Profesor profe = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPorIdSP(idProfesor);
                    profe.Id = idProfesor;
                    profe.Rut = txtRut.Text;
                    profe.Nombres = txtNombres.Text;
                    profe.PrimerApellido = txtPrimerApellido.Text;
                    profe.SegundoApellido = txtSegundorApellido.Text;
                    profe.Sexo = cmbSexo.Text;
                    profe.TelefonosContacto = txtTelefono.Text;
                    profe.Email = txtEmail.Text;
                    if (ValidaRequeridos())
                    {

                        string guardado = SinAlitas.Admin.Negocio.CrudProfesores.GuardarProfesor(profe);
                        ActualizarGrillaAsociadas(profe.ComIdAsignada);
                        ActualizarGrillaNOAsociadas(profe.ComIdAsignada);
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, guardado);
                    }

                }
                else
                {
                    //ANTES VAMOS A VERIFICAR QUE EL RUT NO EXISTA
                    SinAlitas.Admin.Entidad.Profesor profeBuscar = SinAlitas.Admin.Negocio.CrudProfesores.ObtenerProfesorPorRut(txtRut.Text);
                    if (profeBuscar.Id > 0)
                    {
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Alerta, "Este rut ya existe, intente con otro!!!");
                    }
                    else
                    {
                        SinAlitas.Admin.Entidad.Profesor profe = new SinAlitas.Admin.Entidad.Profesor();

                        profe.Id = 0;
                        profe.Rut = txtRut.Text;
                        profe.Nombres = txtNombres.Text;
                        profe.PrimerApellido = txtPrimerApellido.Text;
                        profe.SegundoApellido = txtSegundorApellido.Text;
                        profe.Sexo = cmbSexo.Text;
                        profe.TelefonosContacto = txtTelefono.Text;
                        profe.Email = txtEmail.Text;
                        //los basicos
                        profe.Activo = 1;
                        profe.Eliminado = 0;
                        profe.Banco = "";
                        profe.ComId = 13;
                        profe.Codigo = "";
                        profe.Direccion = "";
                        profe.FechaNacimiento = Convert.ToDateTime("01-01-1990");
                        profe.Fotografia = "";
                        profe.NodId = 1;
                        profe.PaiId = 1;
                        profe.RegId = 13;
                        profe.RolId = 3;
                        profe.TipoCuenta = 0;
                        profe.Password = profe.Rut;
                        profe.NombreUsuario = profe.Rut;
                        profe.ComIdAsignada = "";
                        profe.NumeroCuenta = "";
                        if (ValidaRequeridos())
                        {
                            int id = SinAlitas.Admin.Negocio.CrudProfesores.GuardarNuevoProfesor(profe);
                            Session["ID_PROFESOR"] = id;
                            txtRut.ClientEnabled = false;
                            //Request.QueryString["ID_PROFESOR"] = id.ToString();
                            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Guardado con éxito.");
                        }
                    }
                }
            }
            else
            {
                
                bool exito = false;
                string[] param = e.Parameter.Split(';');
                string opcion = param[0];
                int idComuna = int.Parse(param[1]);
                int idProfesor = 0;
                if (Session["ID_PROFESOR"] != null)
                {
                    idProfesor = int.Parse(Session["ID_PROFESOR"].ToString());
                    if (opcion == "agrega")
                    {
                        exito = SinAlitas.Admin.Negocio.CrudProfesores.ModificarComunasProfesor(true, idProfesor, idComuna);
                    }
                    else
                    {
                        exito = SinAlitas.Admin.Negocio.CrudProfesores.ModificarComunasProfesor(false, idProfesor, idComuna);
                    }
                    if (exito)
                    {
                        SinAlitas.Admin.Entidad.Profesor profe = SinAlitas.Admin.Negocio.Profesor.ObtenerProfesorPorIdSP(idProfesor);
                        ActualizarGrillaAsociadas(profe.ComIdAsignada);
                        ActualizarGrillaNOAsociadas(profe.ComIdAsignada);
                        MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "guardado con éxito");
                    }
                }
                else
                {
                    MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Debe guardar al Profesor antes de asociar una comuna.");
                }

            }
        }
    }

    //protected void btnCancelar_Click(object sender, EventArgs e)
    //{
    //    if (Session["ID_PROFESOR"] != null)
    //        Session["ID_PROFESOR"] = null;

    //    Response.Redirect("~/ListarProfesores.aspx");
    //}

    protected void btnVolver_Click(object sender, EventArgs e)
    {
        if (Session["ID_PROFESOR"] != null)
            Session["ID_PROFESOR"] = null;

        Response.Redirect("~/ListarProfesores.aspx");
    }
}