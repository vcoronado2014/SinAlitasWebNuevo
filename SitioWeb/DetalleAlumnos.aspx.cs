using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetalleAlumnos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            List<SinAlitas.Admin.Entidad.FichaAlumno> listaAlumnos = new List<SinAlitas.Admin.Entidad.FichaAlumno>();
            List<SinAlitas.Admin.Entidad.FichaAlumno> listaAlumnosDevolver = new List<SinAlitas.Admin.Entidad.FichaAlumno>();
            if (Request.QueryString["PCO_ID"] != null)
            {
                int pcoId = int.Parse(Request.QueryString["PCO_ID"]);
                if (pcoId > 0)
                {
                    List<SinAlitas.Admin.Entidad.FichaPack> fichasPack =  SinAlitas.Admin.Negocio.FichaPack.ObtenerFichasPack(pcoId);
                    if (fichasPack != null && fichasPack.Count > 0)
                    {
                        foreach(SinAlitas.Admin.Entidad.FichaPack fic in fichasPack)
                        {
                            SinAlitas.Admin.Entidad.EnvoltorioAlumno ficha = SinAlitas.Admin.Negocio.FichaAlumno.ObtenerAlumnoPorId(fic.IdAlumno);
                            listaAlumnos.Add(ficha);

                        }
                    }
                }
                if (listaAlumnos != null && listaAlumnos.Count > 0)
                {
                    var alumnos = listaAlumnos.Select(p => p.NombreCompleto).Distinct().ToList();
                    if (alumnos != null && alumnos.Count > 0)
                    {
                        foreach(string s in alumnos)
                        {
                            listaAlumnosDevolver.Add(listaAlumnos.FirstOrDefault(p => p.NombreCompleto == s));
                        }
                    }
                }
                if (listaAlumnosDevolver != null && listaAlumnosDevolver.Count > 0)
                {
                    rptTareas.DataSource = listaAlumnosDevolver;
                    rptTareas.DataBind();
                }
            }
        }
    }

}