<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mantenedorProfesores.aspx.cs" Inherits="mantenedorProfesores" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="description" content="."/>
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development"/>
    <meta name="author" content="Victor Coronado"/>
    <title>Profesores</title>
    <%--<link rel="stylesheet" href="css/foundation.min.css" />--%>
    <link rel="stylesheet" href="css/foundation.css" />
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
<body style="padding:0;">
    <form id="form1" runat="server">
        <div class="contained">
            <!-- info usuario -->
            <div class="small-12 columns panel-sencillo bg-dark-cyan" style="margin-top:0;">
                <span class="fg-white">Víctor Coronado, Administrador</span>
            </div>
            <h1>Titulo</h1>
            <!-- formulario -->
            <div class="small-12 medium-2 columns">
                <span class="label info">Rut</span>
            </div>
            <div class="small-12 medium-4 columns">
                <dx:ASPxTextBox ID="txtRut" runat="server" Width="100%" Native="true"></dx:ASPxTextBox>
            </div>

            <div class="small-12 medium-2 columns">
                <span class="label info">Nombres</span>
            </div>
            <div class="small-12 medium-4 columns">
                <dx:ASPxTextBox ID="txtNombres" runat="server" Width="100%" Native="true"></dx:ASPxTextBox>
            </div>

            <div class="small-12 medium-2 columns">
                <span class="label info">Primer Apellido</span>
            </div>
            <div class="small-12 medium-4 columns">
                <dx:ASPxTextBox ID="txtPrimerApellido" runat="server" Width="100%" Native="true"></dx:ASPxTextBox>
            </div>

            <div class="small-12 medium-2 columns">
                <span class="label info">Segundo Apellido</span>
            </div>
            <div class="small-12 medium-4 columns">
                <dx:ASPxTextBox ID="txtSegundoApellido" runat="server" Width="100%" Native="true"></dx:ASPxTextBox>
            </div>

            <div class="small-12 medium-2 columns">
                <span class="label info">Codigo</span>
            </div>
            <div class="small-12 medium-4 columns">
                <dx:ASPxTextBox ID="txtCodigo" runat="server" Width="100%" Native="true"></dx:ASPxTextBox>
            </div>

            <div class="small-12 medium-2 columns">
                <span class="label info">Región</span>
            </div>
            <div class="small-12 medium-4 columns">
                <dx:ASPxComboBox ID="cmbRegion" runat="server" ValueType="System.String" Width="100%" Native="true"></dx:ASPxComboBox>
            </div>

            <div class="small-12 medium-2 columns">
                <span class="label info">Comuna</span>
            </div>
            <div class="small-12 medium-4 columns">
                <dx:ASPxComboBox ID="cmbComuna" runat="server" ValueType="System.String" Width="100%" Native="true"></dx:ASPxComboBox>
            </div>

            
            <div class="small-12 medium-2 columns">
                <span class="label info">Dirección</span>
            </div>
            <div class="small-12 medium-4 columns">
                <dx:ASPxTextBox ID="txtDireccion" runat="server" Width="100%" Native="true"></dx:ASPxTextBox>
            </div>
        </div>
    </form>
</body>
</html>
