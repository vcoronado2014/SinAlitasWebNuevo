<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MostrarOchoDias.aspx.cs" Inherits="MostrarOchoDias" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="CONTROLES/MensajeBoostrap.ascx" tagname="MensajeBoostrap" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado" />
    <title>Agendar</title>
    <link rel="shortcut icon" href="images/IconoMiFamilia.png" />
    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/estilocliente.css" rel="stylesheet" type="text/css"/>
    <link href="css/coro.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
                <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <!-- contenido de la pagina -->
        <ul class="chat">
            <li class="left clearfix">
                <span class="chat-img pull-left">
                    <i class="fa fa-3x fa-info-circle img-circle" style="margin-left: 10px;"></i>
                </span>
                <div class="chat-body clearfix">
                    <p>
                        Seleccione la clase que desea volver a tomar y presiones Aceptar, solo puede seleccionar una del listado. Si desea cancelar simplemente cierre la ventana.
                    </p>
                    
                </div>
            </li>
        </ul>
        <dx:ASPxCallbackPanel ID="pnlPrincipal" ClientInstanceName="pnlPrincipal" runat="server" Width="100%" OnCallback="pnlPrincipal_Callback">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <div class="col-xs-12">
                        <!-- contenido del repeat -->

                        <dx:ASPxRadioButtonList ID="ASPxRadioButtonList1" runat="server" DataSourceID="odsListado" TextField="TextoMostrar" ValueField="Cupo.Id" Width="100%">
                        </dx:ASPxRadioButtonList>
                        <asp:ObjectDataSource ID="odsListado" runat="server" SelectMethod="ListaProximosCuposDisponiblesDetalle" TypeName="SinAlitas.Admin.Negocio.Cupo">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="nodId" QueryStringField="NOD_ID" Type="Int32" />
                                <asp:QueryStringParameter Name="profId" QueryStringField="PROF_ID" Type="Int32" />
                                <asp:Parameter DefaultValue="8" Name="cantidadCupos" Type="Int32" />
                                <asp:QueryStringParameter Name="cupoIdReagendar" QueryStringField="CUPO_ID_REAGENDAR" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>

                    </div>
                        <!-- mensaje -->
                        <div class="col-xs-12">

                            <uc1:MensajeBoostrap ID="MensajeBoostrap1" runat="server" />

                        </div>
                    <div class="col-xs-12 col-md-6 pull-right">

                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Width="100%" Native="true" CssClass="btn btn-primary" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	pnlPrincipal.PerformCallback('guardar');
}" />
                        </dx:ASPxButton>

                    </div>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>




    </div>
    </form>

</body>
</html>
