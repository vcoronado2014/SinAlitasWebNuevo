using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //List<SinAlitas.Admin.Entidad.FichaAlumno> fic = SinAlitas.Admin.Negocio.FichaAlumno.ObtenerFichasPorCliente(10);

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        SinAlitas.Admin.Entidad.EnvoltorioProfesor envProfesor =
            SinAlitas.Admin.Negocio.Profesor.ObtenerEnvoltorioProfesorPorUsuarioPassword(UserName.Text, Password.Text);

        SinAlitas.Admin.Entidad.EnvoltorioCliente cliente =
            SinAlitas.Admin.Negocio.Cliente.ObtenerEnvoltorioClientePorUsuarioPassword(UserName.Text, Password.Text);

        if (envProfesor != null && envProfesor.Profesor.Id > 0)
        {
            Session["USUARIO_AUTENTICADO"] = envProfesor;
            //acá tomamos el rol y lo evaluamos para ver a que página lo enviamos
            if (envProfesor.Rol.Id > 0)
            {
                switch(envProfesor.Rol.Id)
                {
                    case 1: //Super Administrador
                        break;
                    case 2://Supervisor
                        Response.Redirect("~/InicioSupervisor.aspx");
                        break;
                    case 3: //Profesor}
                        //Response.Redirect("~/Inicio.aspx");
                        Response.Redirect("~/ContenidoProfesor.aspx");
                        break;
                }

                
            }
            else
                Response.Redirect("~/Login.aspx");
        }
        else if(cliente != null && cliente.Cliente.Id > 0)
        {
            //redirect a la pagina de inicio de cliente
            Session["USUARIO_AUTENTICADO"] = cliente;
            Response.Redirect("~/InicioCliente.aspx");
        }
        else
        {
            //error no existe usuario
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/InicioCliente.aspx");
    }
}