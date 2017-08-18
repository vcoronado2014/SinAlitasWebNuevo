<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BuscarPack.aspx.cs" Inherits="BuscarPack" %>

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
    <title>Buscar Código</title>
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
            if (numero == 'uno') {
                url = "InicioSupervisor.aspx";

                location.href = url;
            }
            if (numero == 'tres') {
                url = "CrearCliente.aspx";

                location.href = url;
            }
            if (numero == 'cuatro') {
                url = "TareasProfesorRealizadas.aspx";

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
        function Limpiar()
        {
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
        function onClickCrearCodigo()
        {
            var url = "CreaCodigo1.aspx?ID_CLIENTE=";
            if (lblClieIdSeleccionado.GetText() == '')
            {
                alert('No puede crear código si no ha seleccionado un Cliente.');
            }
            else
            {
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
                <div id="iconoHome"  data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Cliente"  class="col-xs-2 col-md-1  font-nav-bar fa fa-user-plus height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">
                </div>

                <div id="iconoCitas" data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Pack" class="col-xs-2 col-md-1 glyphicon glyphicon-search active-navbar-supervisor font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">
                </div>
                <div id="iconoMedicamentos"  data-toggle="tooltip" data-placement="top" data-original-title="Crear Cliente" class="col-xs-2 col-md-1 glyphicon glyphicon-new-window font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">
                </div>

                <div id="iconoCancelarClases" data-toggle="tooltip" data-placement="top" data-original-title="Cancelar Clases" class="col-xs-2 col-md-1 fa fa-trash-o font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">
                </div>
                <div id="iconoAlertas" data-toggle="tooltip" data-placement="top" data-original-title="Reporte de Profesores"  class="col-xs-2 col-md-1 fa fa-database font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')">
                </div>
                <div id="iconoPlanillas" data-toggle="tooltip" data-placement="top" data-original-title="Disponibilidad de Profesores" class="col-xs-2 col-md-1 glyphicon glyphicon-equalizer font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('seis')" >
                </div>
                <!-- nuevos items -->
                <!-- falta crear profesor -->
                <div id="iconoListarProfesor" data-toggle="tooltip" data-placement="top" data-original-title="Editar Profesores" class="col-xs-2 col-md-1 fa fa-group font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('siete')">
                </div>
                <div id="iconoOcho" data-toggle="tooltip" data-placement="top" data-original-title="No disponible" class="col-xs-2 col-md-1 fa fa-ban font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('ocho')">
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
                        <div class="col-xs-2 glyphicon glyphicon-search font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Búsqueda Pack</h3>
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
            <div class="col-xs-12 col-md-6">
                <div class="col-xs-12">
                    <label>
                        Seleccione el Estado
                                    <dx:ASPxComboBox ID="cmbEstado" runat="server" Native="True" Width="100%" SelectedIndex="0">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	            //cmbComuna.PerformCallback(s.GetValue());
}" />
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="Todos" Value="0" />
                                            <dx:ListEditItem Text="Creado por El Supervisor" Value="1" />
                                            <dx:ListEditItem Text="Aceptado por el Cliente" Value="2" />
                                            <dx:ListEditItem Text="En Curso" Value="3" />
                                            <dx:ListEditItem Text="Terminado" Value="4" />
                                        </Items>
                                    </dx:ASPxComboBox>
                    </label>
                </div>
                <div class="col-xs-12">
                    <label>
                        Por Código Cliente
                                <dx:ASPxTextBox ID="txtCodigo" Native="true" runat="server" Width="100%" ClientInstanceName="txtCodigo">
                                </dx:ASPxTextBox>
                    </label>
                </div>
            </div>


            <div class="col-xs-12 col-md-6">
                <!-- botones -->
                <div class="col-xs-6">
                    <dx:ASPxButton runat="server" Text="Cancelar" ID="btnCancelar" CssClass="btn btn-warning" Native="true" Width="100%" OnClick="btnCancelar_Click"></dx:ASPxButton>

                </div>
                <div class="col-xs-6">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Native="True" CssClass="btn btn-primary"  Width="100%" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
	grilla.PerformCallback(cmbEstado.GetValue() + '|' + txtCodigo.GetText());
}" />
                    </dx:ASPxButton>
                </div>
            </div>

            <div class="col-xs-12 col-md-6">
            <dx:ASPxGridView ID="grillaResultados" runat="server" AutoGenerateColumns="False" ClientInstanceName="grilla" DataSourceID="odsBusqueda" EnableTheming="True" OnCustomCallback="grillaResultados_CustomCallback" Theme="Moderno" Width="100%" KeyFieldName="Id" OnCommandButtonInitialize="grillaResultados_CommandButtonInitialize">
                    <ClientSideEvents SelectionChanged="function(s, e) {
	//s.GetSelectedFieldValues(&quot;NombreFormateado;Id&quot;,GetSelectedFieldValuesCallback); 
}" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings GridLines="None" ShowColumnHeaders="False" />
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                    <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                    <SettingsText CommandEdit="Pagar" />
                    <Columns>
                        <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" Width="10%">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Texto" VisibleIndex="2" Width="90%">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="EstaPagado" ToolTip="Esta Pagado" Visible="False" VisibleIndex="3">
                            <EditFormSettings Visible="True" />
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataHyperLinkColumn FieldName="UrlAbrir" Name="Ver" VisibleIndex="4">
                            <PropertiesHyperLinkEdit Text="Abrir">
                            </PropertiesHyperLinkEdit>
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataHyperLinkColumn>
                    </Columns>
                    <Paddings Padding="0px" />
                    <Border BorderStyle="None" />
                </dx:ASPxGridView>
        </div>

            <asp:ObjectDataSource ID="odsBusqueda" runat="server" SelectMethod="ObtenerProductoCodigoGrilla" TypeName="SinAlitas.Admin.Negocio.ProductoCodigo" UpdateMethod="Pagar">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cmbEstado" DefaultValue="100" Name="estado" PropertyName="Value" Type="Int32" />
                    <asp:ControlParameter ControlID="txtCodigo" DefaultValue="" Name="codigo" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="Texto" Type="String" />
                    <asp:Parameter Name="EstaPagado" Type="Boolean" />
                </UpdateParameters>
            </asp:ObjectDataSource>

        </section>
        
    </div>
    </form>
</body>
</html>
