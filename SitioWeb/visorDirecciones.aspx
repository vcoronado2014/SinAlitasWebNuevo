<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visorDirecciones.aspx.cs" Inherits="visorDirecciones" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register assembly="GMaps" namespace="Subgurim.Controles" tagprefix="cc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">

<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado" />
    <title>Dirección</title>
    <link rel="stylesheet" href="css/foundation.min.css" />
    <link rel="stylesheet" href="css/foundation-icons.css" />
    <link rel="stylesheet" href="css/personalizado.css" />
    <script src="js/vendor/modernizr.js"></script>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/foundation.min.js"></script>
    <script src="js/foundation/foundation.accordion.js"></script>
    <script src="js/foundation/foundation.tooltip.js"></script>
    <style type="text/css">
        v\:* {
            behavior: url(#default#VML);
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="contained">
 
            <div class="small-12 columns" style="padding-top:0.8rem; padding-bottom:0.6rem;">
                <div class="small-2 columns">
                    <dx:ASPxHyperLink ID="hlVolver" runat="server" Text="Volver" ImageUrl="~/img/atras.png" ImageWidth="30px">
                        <Border BorderStyle="None" />
                    </dx:ASPxHyperLink>
                </div>
                <span class="small-10 columns titulo">Mapa
                </span>

            </div>
            <dx:ASPxPanel ID="pnlResultados" runat="server" Width="100%" ClientVisible="false">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <asp:Repeater ID="rptResultados" runat="server">
                                <ItemTemplate>
                                <!-- contenido del repeater -->
                                    <div class="small-12 columns panel sombra-panel">
                                        <dx:ASPxHyperLink ID="hlResult" runat="server" Text='<%# Eval("Nombre", "{0}")%>' NavigateUrl='<%# String.Format("visorDirecciones.aspx?DIRECCION_CONSULTAR={0}", DataBinder.Eval(Container.DataItem, "Nombre")) %>'>
                                            
                                        </dx:ASPxHyperLink>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
            <div class="small-12 columns">

                <cc1:GMap ID="GMap1" runat="server" enableHookMouseWheelToZoom="True" Height="500px" Language="es" Width="100%" enableGKeyboardHandler="True" enableGoogleBar="True" enableGTrafficOverlay="True" enableRotation="True" enableServerEvents="True" enableTransitOverlay="True" />

            </div>
        </div>
    </form>
</body>
</html>
