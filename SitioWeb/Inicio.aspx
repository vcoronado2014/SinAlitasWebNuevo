<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="Inicio" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/CONTROLES/Encabezado.ascx" TagPrefix="uc1" TagName="Encabezado" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="description" content="."/>
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development"/>
    <meta name="author" content="Victor Coronado"/>
    <title>Inicio</title>
    <link rel="stylesheet" href="css/foundation.min.css" />
    <link rel="stylesheet" href="css/foundation-icons.css" />
    <link rel="stylesheet" href="css/personalizado.css" />
    <script src="js/vendor/modernizr.js"></script>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/foundation.min.js"></script>
    <script src="js/foundation/foundation.accordion.js"></script>
    

    <script type="text/javascript">
        $(document).ready(function () {
            console.log("ready!");
            $(document).foundation({
                accordion: {
                    // specify the class used for accordion panels
                    content_class: 'content',
                    // specify the class used for active (or open) accordion panels
                    active_class: 'active',
                    // allow multiple accordion panels to be active at the same time
                    multi_expand: true,
                    // allow accordion panels to be closed by clicking on their headers
                    // setting to false only closes accordion panels when another is opened
                    toggleable: true
                }
            });
                $('#myAccordion').on('toggled', function (event, accordion) {
                    console.log(accordion);
                    var flecha = $('#flecha');
                    if (accordion[0].className == 'content') {
                        flecha.removeClass('fi-arrow-up');
                        flecha.addClass('fi-arrow-down');
                        //alert('flecha abajo');
                    }
                    else
                    {
                        flecha.removeClass('fi-arrow-down');
                        flecha.addClass('fi-arrow-up');
                        //alert('flecha arriba');
                    }
                });
        });



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contained">
            <!-- info usuario -->
            <uc1:encabezado runat="server" id="Encabezado" />


            <ul class="accordion bg-dark-cyan" id="myAccordion" data-accordion="">
                <li class="accordion-navigation">

                    <a href="#cat1">
                        <span class="small-2 medium-1 columns margin-bottom-0 bg-belize-hole text-center size-18 fg-white left">
                            <asp:Literal ID="litCantidadNotificaciones" runat="server"></asp:Literal></span>
                        <span class="small-8 columns size-18 fg-white fi-mail"> Notificaciones </span>
                        <i class="small-1 columns fi-arrow-down size-18 fg-white" id="flecha"></i>

                    </a>


                    <div id="cat1" class="content" style="padding: 0;">
                        <!-- notificaciones -->
                        <div class="small-12 columns panel-sencillo bg-pomegranate">
                            <div class="small-12 columns margin-bottom-0 bg-pomegranate">
                                <span class="size-14 fg-white text-justify">
                                    <asp:Literal ID="litTextoNotificaciones" runat="server"></asp:Literal></span>
                            </div>

                        </div>


                    </div>
                </li>

            </ul>
            <!-- ahora depende del rol logueado los iconos que debiera mostrar hay que ver cuales son compartidos entre el profe y el cliente -->
            <dx:ASPxPanel ID="pnlAdministrador" runat="server" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div class="small-6 large-3 columns fi-torsos-female-male size-48 text-center bg-turquesa fg-white pointer">
                            <br />
                            <span class="size-14 top-text">Profesores</span>
                        </div>
                        <div class="small-6 large-3 columns fi-torsos-male-female size-48 text-center bg-esmeralda fg-white pointer">
                            <br />
                            <span class="size-14 top-text">Clientes</span>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
            <dx:ASPxPanel ID="pnlProfesor" runat="server" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <a href="calendarioprofe.aspx" class="small-6 large-3 columns fi-calendar size-48 text-center bg-carrot fg-white pointer">
                            <br />
                            <span class="size-14 top-text">Calendario</span>
                        </a>
                        <a href="TareasProfesor.aspx" class="small-6 large-3 columns fi-list-thumbnails size-48 text-center bg-peter-river fg-white pointer">
                            <br />
                            <span class="size-14 top-text">Tareas</span>
                        </a>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
        </div>
    </form>
</body>
    
    <script src="js/vendor/fastclick.js"></script>
</html>
