<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InicioSupervisor.aspx.cs" Inherits="InicioSupervisor" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/CONTROLES/Encabezado.ascx" TagPrefix="uc1" TagName="Encabezado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado,Juan Morán" />
    <title>Supervisor</title>
    <link rel="shortcut icon" href="images/IconoMiFamilia.png"/>
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

    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        function PaginaMostrar(numero) {
            var url = "";
            if (numero == 'dos') {
                url = "BuscarPack.aspx";

                location.href = url;
            }
            if (numero == 'tres') {
                url = "CrearCliente.aspx";

                location.href = url;
            }
            if (numero == 'cuatro') {
                url = "OpcionesProfesor.aspx";

                location.href = url;
            }
            if (numero == 'cinco') {
                url = "ReporteClases.aspx";

                location.href = url;
            }
            if (numero == 'seis') {
                url = "planillaProfesores.aspx";

                location.href = url;
            }
            if (numero == 'siete') {
                url = "ListarProfesores.aspx";

                location.href = url;
            }
            if (numero == 'ocho') {
                alert('No disponible por el momento');
                //url = "ListarProfesores.aspx";

                //location.href = url;
            }
            if (numero == 'nueve') {
                alert('No disponible por el momento');
                //url = "ListarProfesores.aspx";

                //location.href = url;
            }
            if (numero == 'diez') {
                alert('No disponible por el momento');
                //url = "ListarProfesores.aspx";

                //location.href = url;
            }
            if (numero == 'once') {
                alert('No disponible por el momento');
                //url = "ListarProfesores.aspx";

                //location.href = url;
            }
            if (numero == 'doce') {
                alert('No disponible por el momento');
                //url = "ListarProfesores.aspx";

                //location.href = url;
            }
        }
        function Limpiar() {
            txtNombreBuscar.SetText('');
            txtApellidoBuscar.SetText('');
            lblClieIdSeleccionado.SetText('');
            lblClienteSeleccionado.SetText('');

            grilla.PerformCallback();
        }
        function GetSelectedFieldValuesCallback(values) {
            //selList.BeginUpdate();
            try {
                //selList.ClearItems();
                //for (var i = 0; i < values.length; i++) {
                //selList.AddItem(values[i]);
                //}
                //alert(values);
                lblClienteSeleccionado.SetText(values[0][0]);
                lblClieIdSeleccionado.SetText(values[0][1]);
            } finally {
                //selList.EndUpdate();
                //lblClienteSeleccionado.SetText('');
            }
            //document.getElementById("selCount").innerHTML = grid.GetSelectedRowCount();
        }
        function onClickCrearCodigo() {
            //alert(lblClieIdSeleccionado.GetText());
            var url = "CreaCodigo1.aspx?ID_CLIENTE=";
            if (lblClieIdSeleccionado.GetText() == '' || lblClieIdSeleccionado.GetText() == '0') {
                alert('No puede crear código si no ha seleccionado un Cliente.');
            }
            else {
                url = url + lblClieIdSeleccionado.GetText();
                location.href = url;
                //location.reload(true);
                //window.open(url);
            }
        }
    </script>
</head>
<body style="padding-bottom:60px; padding-top:60px;">
    <form id="form1" runat="server">
    <div class="container" style="padding-left:0; padding-right:0;">
        <!-- este es el menu inferior con las opciones del profesor -->
        <nav class="navbar navbar-principal-supervisor navbar-fixed-bottom">
            <div class="col-xs-12 container-footer">
                <%--<div class="col-xs-1"></div>--%>
                <div id="iconoHome"  data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Cliente"  class="col-xs-2 col-md-1  font-nav-bar fa fa-user-plus active-navbar-supervisor height-50 text-center cursor-pointer" aria-hidden="true">
                </div>

                <div id="iconoCitas" data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Pack" class="col-xs-2 col-md-1 glyphicon glyphicon-search  font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">
                </div>
                <div id="iconoMedicamentos"  data-toggle="tooltip" data-placement="top" data-original-title="Crear Cliente"  class="col-xs-2 col-md-1 glyphicon glyphicon-new-window font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">
                </div>
                <div id="iconoCancelarClases" data-toggle="tooltip" data-placement="top" data-original-title="Cancelar Clases"  class="col-xs-2 col-md-1 fa fa-trash-o font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">
                </div>
                <div id="iconoAlertas" data-toggle="tooltip" data-placement="top" data-original-title="Reporte de Profesores"  class="col-xs-2 col-md-1 fa fa-database font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')" >
                </div>
                <div id="iconoPlanillas" data-toggle="tooltip" data-placement="top" data-original-title="Disponibilidad de Profesores"  class="col-xs-2 col-md-1 glyphicon glyphicon-equalizer font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('seis')" >
                </div>
                <!-- nuevos items -->
                <!-- falta crear profesor -->
                <div id="iconoListarProfesor" data-toggle="tooltip" data-placement="top" data-original-title="Editar Profesores"  class="col-xs-2 col-md-1 fa fa-group font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('siete')">
                </div>
                <div id="iconoOcho" data-toggle="tooltip" data-placement="top" data-original-title="No disponible"  class="col-xs-2 col-md-1 fa fa-ban font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('ocho')">
                </div>
                <div id="iconoNueve" data-toggle="tooltip" data-placement="top" data-original-title="No disponible" class="col-xs-2 col-md-1 fa fa-ban font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('nueve')">
                </div>
                <div id="iconoDiez" data-toggle="tooltip" data-placement="top" data-original-title="No disponible" class="col-xs-2 col-md-1 fa fa-ban font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('diez')">
                </div>
                <div id="iconoOnce" data-toggle="tooltip" data-placement="top" data-original-title="No disponible" class="col-xs-2 col-md-1 fa fa-ban font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('once')">
                </div>
                <div id="iconoDoce" data-toggle="tooltip" data-placement="top" data-original-title="No disponible" class="col-xs-2 col-md-1 fa fa-ban font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('doce')">
                </div>
            </div>
        </nav>

        <section id="uno">
            <header class="titulo-header">
                <nav class="navbar navbar-default-supervisor navbar-fixed-top bg-rosa">
                    <div class="container">
                        <div class="col-xs-2 fa fa-user-plus font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Búsqueda Cliente</h3>
                            <%--<h5>Profesor</h5>--%>
                            <h5>
                                <asp:Literal ID="litNombreUsuario" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                </nav>

            </header>
        </section>

        <!-- contenido -->
        <section>
            <asp:Literal ID="litAlerta" runat="server"></asp:Literal>
            <div class="col-xs-12 panel">
                <div class="col-xs-3 col-md-2">
                    <dx:ASPxLabel ID="lblNombre" runat="server" Text="Nombre"></dx:ASPxLabel>
                </div>
                <div class="col-xs-9 col-md-4">
                    <dx:ASPxTextBox ID="txtNombreBuscar" ClientInstanceName="txtNombreBuscar" runat="server" Width="100%" Native="true">
                        <ValidationSettings ErrorDisplayMode="None" Display="None">
                            <RequiredField IsRequired="True" ErrorText="El Nombre es requerido" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="col-xs-3 col-md-2">
                    <dx:ASPxLabel ID="lblApellidoBuscar" runat="server" Text="Apellido"></dx:ASPxLabel>
                </div>
                <div class="col-xs-9 col-md-4">
                    <dx:ASPxTextBox ID="txtApellidoBuscar" ClientInstanceName="txtApellidoBuscar" runat="server" Width="100%" Native="true">
                        <ValidationSettings ErrorDisplayMode="None" Display="None">
                            <RequiredField IsRequired="True" ErrorText="El Primer Apellido es requerido." />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="col-xs-12 text-center">
                    <dx:ASPxValidationSummary ID="ASPxValidationSummary1" CssClass="col-xs-12 col-md-10" runat="server" VerticalAlign="Middle" Width="100%" BackColor="Transparent">
                        <Paddings Padding="0px" />
                        <ErrorStyle>
                            <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px" />
                        </ErrorStyle>
                        <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px" />
                    </dx:ASPxValidationSummary>
                </div>
            </div>

            <div class="col-xs-12" style="padding-left: 2px;">
<%--                <div class="col-xs-3" style="padding: 0;">
                    <dx:ASPxButton runat="server" Text="Volver" ID="btnCancelar" CssClass="btn btn-success" Native="true" Width="100%" CausesValidation="False" OnClick="btnCancelar_Click"></dx:ASPxButton>
                </div>--%>
                <div class="col-xs-4">
                    <dx:ASPxButton Width="100%" ID="btnCrearCliente" runat="server" Text="Crear" Native="True" CssClass="btn btn-info" CausesValidation="False" OnClick="btnCrearCliente_Click"></dx:ASPxButton>
                </div>
                <div class="col-xs-4">
                    <dx:ASPxButton Width="100%" ID="btnLimpiar" runat="server" Text="Limpiar" Native="True" CssClass="btn btn-warning" AutoPostBack="False" CausesValidation="False">
                        <ClientSideEvents Click="function(s, e) {
	Limpiar();
}" />
                    </dx:ASPxButton>
                </div>
                <div class="col-xs-4">
                    <dx:ASPxButton Width="100%" ID="btnBuscar" runat="server" Text="Buscar" Native="True" CssClass="btn btn-primary" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
	grilla.PerformCallback();
}" />
                    </dx:ASPxButton>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="col-xs-12 destacado-azul"> 
                    <p class="font-pequeno">
                        Si el Cliente fué encontrado, seleccionelo del listado y luego presione el botón siguiente. Si no es así presione el botón Crear Cliente.
                    </p>
                </div>
                <dx:ASPxGridView ID="grillaResultados" runat="server" AutoGenerateColumns="False" ClientInstanceName="grilla" DataSourceID="ObjectDataSource1" EnableTheming="True" OnCustomCallback="grillaResultados_CustomCallback" Theme="Moderno" Width="100%" KeyFieldName="Id">
                    <ClientSideEvents SelectionChanged="function(s, e) {
	s.GetSelectedFieldValues(&quot;NombreFormateado;Id&quot;,GetSelectedFieldValuesCallback); 
}" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings GridLines="None" ShowColumnHeaders="False" />
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NombreFormateado" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Comuna" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Styles>
                        <AlternatingRow BackColor="#99CCFF">
                        </AlternatingRow>
                        <FocusedRow BackColor="#666666">
                        </FocusedRow>
                    </Styles>
                    <Paddings Padding="0px" />
                    <Border BorderStyle="None" />
                </dx:ASPxGridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ObtenerClientesPorNombreYApellidoLiviano" TypeName="SinAlitas.Admin.Negocio.Cliente">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblNombre" Name="nombre" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtApellidoBuscar" Name="apellidoPaterno" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="col-xs-12 destacado-burlywood">
                    <div class="col-xs-10">
                        <p class="font-pequeno text-justify">
                            Cliente Seleccionado:
                            <dx:ASPxLabel ID="lblClienteSeleccionado" runat="server" Text="" ClientInstanceName="lblClienteSeleccionado"></dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblClieIdSeleccionado" runat="server" Text="" ClientInstanceName="lblClieIdSeleccionado" ClientVisible ="false"></dx:ASPxLabel>
                        </p>
                    </div>
                    <div class="col-xs-10">
                        <dx:ASPxButton ID="btnCrearCodigo" runat="server" Text="Crear Código" Native="True" CssClass="btn btn-info fg-white" CausesValidation="False" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	onClickCrearCodigo();
}" />

                        </dx:ASPxButton>
                    </div>
                </div>
            </div>

        </section>


        <%--<ul class="accordion bg-dark-cyan" id="myAccordion" data-accordion="">
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

            </ul>--%>

<%--        <dx:ASPxPanel ID="pnlProfesor" runat="server" Width="100%">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <a href="CrearCodigo.aspx" class="small-6 large-3 columns fi-clipboard-pencil size-48 text-center bg-carrot fg-white pointer">
                        <br />
                        <span class="size-14 top-text">Crear código</span>
                    </a>
                    <a href="BuscarPack.aspx" class="small-6 large-3 columns fi-list-thumbnails size-48 text-center bg-peter-river fg-white pointer">
                        <br />
                        <span class="size-14 top-text">Buscar Pack</span>
                    </a>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>--%>
    
    </div>
    </form>
</body>
</html>
