using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreaCodigo1 : System.Web.UI.Page
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
            }
        }

        if (Request.QueryString["ID_CLIENTE"] != null)
        {
            int id = int.Parse(Request.QueryString["ID_CLIENTE"].ToString());
            lblIdClienteOculto.Text = id.ToString();
            //SinAlitas.Admin.Entidad.Cliente cliente = SinAlitas.Admin.Negocio.Cliente.ObtenerClientePorId(id);

        }
        else
        {
            Response.Redirect("~/InicioCliente.aspx");
        }
    }
    private void CalculaTotalesyCodigo(string nombrePack, int clieId, int cantidadClases, int alumnosAsisten)
    {
        //el descuento máximo es de 10.000 pesos
        string codigo = SinAlitas.Admin.Negocio.Global.RetornaCodigoCliente(nombrePack, clieId, cantidadClases, alumnosAsisten);
        //ahora calculamos el valor total
        txtCodigoCliente.Text = codigo;
        int valorOriginal = 0;
        if (lblValorpackOculto.Text != "")
            valorOriginal = int.Parse(lblValorpackOculto.Text);

        int valorDescuento = 0;
        if (txtDescuento.Text != "")
            valorDescuento = int.Parse(txtDescuento.Text);

        int valorTotal = 0;
        int totalDescuento = 0;
        try
        {
            if (valorDescuento > 0)
                totalDescuento = valorDescuento;

            valorTotal = valorOriginal - totalDescuento;

            txtTotalPack.Text = valorTotal.ToString();
        }
        catch
        {

        }


    }

    private void SetearValoresPack(int id)
    {
        SinAlitas.Admin.Entidad.EnvoltorioProductoCodigo producto = SinAlitas.Admin.Negocio.Global.RetornaEnvoltorioMostrar(id);
        lblNombrePackMostrar.Text = producto.Nombre;
        lblDescripcionPackMostrar.Text = producto.Descripcion;
        //cargamos los datos en el combo

        if (cmbCantidadAlumnos.Items != null && cmbCantidadAlumnos.Items.Count > 0)
        {
            int inicio = producto.CantidadAlumnos + 1;
            int termino = cmbCantidadAlumnos.Items.Count;
            //cmbCantidadAlumnos.Items.RemoveAt()
            for (int i = inicio; i <= termino; i++)
            {
                //cmbCantidadAlumnos.Items.RemoveAt(i);
                DevExpress.Web.ListEditItem item = cmbCantidadAlumnos.Items.FindByText(i.ToString());
                if (item != null)
                {
                    cmbCantidadAlumnos.Items.Remove(item);
                }

            }
        }

        int cantidadClases = 0;
        int topeClases = producto.TopeClases;
        int valorClase = producto.ValorClase;
        int precioFinal = 0;

        if (cmbCantidadClases.Text != "")
            cantidadClases = int.Parse(cmbCantidadClases.Text);

        if (cantidadClases > 0 && cantidadClases != topeClases)
        {
            precioFinal = valorClase * cantidadClases;
        }
        else
        {
            //estos siempre son por cantidad de clases
            if (producto.Id == 3 || producto.Id == 4)
                precioFinal = valorClase * cantidadClases;
            else
                precioFinal = producto.Precio;
        }

        string precio = String.Format("{0:C0}", precioFinal);
        lblValorDelPack.Text = precio;
        lblValorpackOculto.Text = precioFinal.ToString();

        txtTotalPack.Text = precioFinal.ToString();
    }
    private void Desactivar()
    {
        btnGuardar.ClientEnabled = false;
        btnCancelar.Text = "Volver";

    }
    private void Guardar()
    {
        int id = int.Parse(Request.QueryString["ID_CLIENTE"].ToString());
        string codigoCliente = txtCodigoCliente.Text;
        int proId = int.Parse(cmbPacks.Value.ToString());
        int cantidadClases = int.Parse(cmbCantidadClases.Text);
        int porcentajeDesc = int.Parse(txtDescuento.Text);
        int totalPack = int.Parse(txtTotalPack.Text);
        int cantidadAlumnos = int.Parse(cmbCantidadAlumnos.Text);
        //estado creado
        int estado = 1;
        //antes validamos algunas cosas
        if (proId == 0)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "No ha seleccionado producto.");
            return;
        }
        if (id == 0)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "No hay Cliente.");
            return;
        }

        SinAlitas.Admin.Entidad.ProductoCodigo prodCod = new SinAlitas.Admin.Entidad.ProductoCodigo();
        prodCod.CantidadAlumnos = cantidadAlumnos;
        prodCod.CantidadClases = cantidadClases;
        prodCod.ClieId = id;
        prodCod.CodigoCliente = codigoCliente;
        prodCod.Estado = estado;
        prodCod.PorcentajeDescuento = porcentajeDesc;
        prodCod.ProId = proId;
        prodCod.TotalPack = totalPack;
        prodCod.Activo = 1;
        prodCod.Eliminado = 0;

        try
        {
            int nuevoId = SinAlitas.Admin.Negocio.ProductoCodigo.Insetar(prodCod);
            if (nuevoId > 0)
            {
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Guardado con éxito.");
                Desactivar();
                //envio de mensajes
                SinAlitas.Admin.Entidad.Cliente cliente = SinAlitas.Admin.Negocio.Cliente.ObtenerClientePorId(prodCod.ClieId);
                if (cliente != null && cliente.Email != "")
                {
                    if (SinAlitas.Admin.Mensajeria.Utiles.ENVIA_CORREOS_CLIENTE() == "1")
                    {
                        //correo al cliente
                        string mensaje = SinAlitas.Admin.Mensajeria.CorreoPop.RetornaMensajeCrearCodigoCliente(codigoCliente);
                        List<string> correos = new List<string>();
                        correos.Add(cliente.Email);
                        SinAlitas.Admin.Mensajeria.CorreoPop.EnviarCorreo(correos, mensaje);
                    }
                    if (SinAlitas.Admin.Mensajeria.Utiles.ENVIA_SMS() == "1")
                    {
                        if (cliente.TelefonosContacto != "")
                        {
                            string celular = cliente.TelefonosContacto.Replace("+", "").Trim().Replace(" ", "");
                            string mensaje = SinAlitas.Admin.Mensajeria.MensajesSMS.RetornaMensajeCrearCodigoCliente(codigoCliente);
                            SinAlitas.Admin.Mensajeria.MensajesSMS.Enviar(celular, mensaje);

                        }
                    }
                }
            }
            else
                MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, "Error al guardar.");
        }
        catch(Exception ex)
        {
            MensajeBoostrap1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Error, ex.Message);
        }

    }
    protected void pnlGeneral_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        if (e.Parameter != null && e.Parameter.Length > 0)
        {
            string[] param = e.Parameter.Split('|');
            if (param[0].ToString().ToUpper() == "BUSCAR_DATOS_PACK")
            {
                int cantidadAlumnos = 0;
                if (cmbCantidadAlumnos.Text != "")
                    cantidadAlumnos = int.Parse(cmbCantidadAlumnos.Text);
                int cantidadClases = 0;
                if (cmbCantidadClases.Text != "")
                    cantidadClases = int.Parse(cmbCantidadClases.Text);

                int id = int.Parse(param[1].ToString());
                SetearValoresPack(id);
                CalculaTotalesyCodigo(lblNombrePackMostrar.Text, int.Parse(lblIdClienteOculto.Text), cantidadClases, cantidadAlumnos);
            }
            else if (param[0].ToString().ToUpper() == "CONSTRUIR_CODIGO")
            {
                int cantidadAlumnos = 0;
                if (cmbCantidadAlumnos.Text != "")
                    cantidadAlumnos = int.Parse(cmbCantidadAlumnos.Text);
                int cantidadClases = 0;
                if (cmbCantidadClases.Text != "")
                    cantidadClases = int.Parse(cmbCantidadClases.Text);

                int id = int.Parse(param[1].ToString());
                SetearValoresPack(id);
                CalculaTotalesyCodigo(lblNombrePackMostrar.Text, int.Parse(lblIdClienteOculto.Text), cantidadClases, cantidadAlumnos);

            }
            else if (param[0].ToString().ToUpper() == "GUARDAR")
            {
                //enviamos a guardar los parametros
                Guardar();
                //Mensaje1.MostrarMensaje(SinAlitas.Admin.Entidad.EnumEstadoMensaje.Correcto, "Guardado con éxito.");
                //Desactivar();
            }
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InicioSupervisor.aspx");
    }
}