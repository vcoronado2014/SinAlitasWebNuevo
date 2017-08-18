<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
    <title>Principal</title>
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
        <div class="small-12 columns" style="padding-top:10%;"></div>
        <div class="small-12 medium-6 columns">
            <dx:ASPxButton ID="btnCliente" runat="server" Text="Cliente" Native="true" CssClass="button" Width="100%" OnClick="btnCliente_Click"></dx:ASPxButton>
        </div>
        <div class="small-12 medium-6 columns">
            <dx:ASPxButton ID="btnProfesor" runat="server" Text="Profesor" Native="true" CssClass="button" Width="100%" OnClick="btnProfesor_Click"></dx:ASPxButton>
        </div>

    </div>
    </form>
</body>
</html>
