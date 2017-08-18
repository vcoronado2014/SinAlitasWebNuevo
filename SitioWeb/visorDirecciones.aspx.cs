using Subgurim.Controles;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class visorDirecciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            List<SinAlitas.Admin.Entidad.Direcciones> direcciones = new List<SinAlitas.Admin.Entidad.Direcciones>();
            hlVolver.NavigateUrl = "tareasprofesor.aspx";
            string query = "Pasaje cordon roma 0621 Puente Alto";
            if (Request.QueryString["DIRECCION_CONSULTAR"] != null)
            {
                query = Request.QueryString["DIRECCION_CONSULTAR"].ToString();
            }
            //GMap1.
            // centramos en Paraguay el mapa al iniciar
            string key = ConfigurationManager.AppSettings.Get("googlemaps.subgurim.net");
            
            GeoCode busqueda = GMap.geoCodeRequest(query, key);
            GLatLng latlng = null;

            if (busqueda != null && busqueda.Placemarks != null)
            {
                if (busqueda.Placemarks.Count > 0)
                {
                    foreach(GeoCodePlacemark geo in busqueda.Placemarks)
                    {
                        SinAlitas.Admin.Entidad.Direcciones dirNueva = new SinAlitas.Admin.Entidad.Direcciones();
                        dirNueva.Nombre = query;
                        dirNueva.Latitud = geo.coordinates.lat;
                        dirNueva.Longitud = geo.coordinates.lng;
                        direcciones.Add(dirNueva);
                    }

                    latlng = new GLatLng(busqueda.Placemarks[0].coordinates.lat, busqueda.Placemarks[0].coordinates.lng);
                }
            }
            if (direcciones != null && direcciones.Count > 0)
            {
                if (direcciones.Count == 1)
                {
                    latlng = new GLatLng(direcciones[0].Latitud, direcciones[0].Longitud);
                    // centramos el mapa en las coordenadas
                    GMap1.setCenter(latlng, 15);
                    GInfoWindow window = new GInfoWindow(latlng, "<div class='small-10 columns'><b>Info:</b> " + direcciones[0].Nombre + "</div>");
                    GMap1.Add(window);
                }
                else
                {
                    //existe más de una por lo tanto hay que mostrar las opciones
                    //pnlResultados.ClientVisible = true;
                    //rptResultados.DataSource = direcciones;
                    //rptResultados.DataBind();
                    latlng = new GLatLng(direcciones[0].Latitud, direcciones[0].Longitud);
                    // centramos el mapa en las coordenadas
                    GMap1.setCenter(latlng, 15);
                    GInfoWindow window = new GInfoWindow(latlng, "<div class='small-10 columns'><b>Info:</b> " + direcciones[0].Nombre + "</div>");
                    GMap1.Add(window);

                }
            }
            else
            {
                // centramos el mapa en las coordenadas
                GMap1.setCenter(latlng, 15);
                GInfoWindow window = new GInfoWindow(latlng, "<b>Info:</b> No existe.");
                GMap1.Add(window);
            }
            

        }
    }
}