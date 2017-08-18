<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportePagoProfesores.aspx.cs" Inherits="ReportePagoProfesores" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="CONTROLES/MensajeBoostrap.ascx" tagname="MensajeBoostrap" tagprefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

   <head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado,Juan Morán" />
    <title>Reporte Pagos</title>
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
       <style type="text/css">
           .huge {
    font-size: 1em;
}
       </style>
</head>
<body style="padding-bottom:60px; padding-top:60px;">
    <form id="form1" runat="server">
    <div class="container" style="padding-left:0; padding-right:0;">
         <!-- este es el menu inferior con las opciones del profesor -->
        <nav class="navbar navbar-principal-supervisor navbar-fixed-bottom">
            <div class="col-xs-12 container-footer">
                <%--<div class="col-xs-1"></div>--%>
                <div id="iconoHome"  data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Cliente"  class="col-xs-2 col-md-1  font-nav-bar fa fa-user-plus height-50 text-center cursor-pointer" aria-hidden="true">
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
                <div id="iconoOcho" data-toggle="tooltip" data-placement="top" data-original-title="No disponible"  class="col-xs-2 col-md-1 fa fa-ban font-nav-bar height-50  text-center cursor-pointer active-navbar-supervisor" aria-hidden="true" onclick="PaginaMostrar('ocho')">
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
                            <h3>Clases Profesores</h3>
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
            <dx:ASPxCallbackPanel ID="pnlPrincipal" ClientInstanceName="pnlPrincipal" runat="server" Width="100%" OnCallback="pnlPrincipal_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <!-- FILTROS DE BUSQUEDA -->
                        <div class="col-xs-12 panel">
                            <div class="col-xs-12 col-md-5">
                                Fecha Inicio:
                                <dx:ASPxDateEdit ID="dtFechaInicio"  Width="100%" ClientInstanceName ="dtFechaInicio" Theme="Mulberry" runat="server"></dx:ASPxDateEdit>
                            </div>
                            <div class="col-xs-12 col-md-5">
                                Fecha Término:
                                <dx:ASPxDateEdit ID="dtFechaTermino"  Width="100%" ClientInstanceName ="dtFechaTermino" Theme="Mulberry" runat="server"></dx:ASPxDateEdit>
                            </div>
                            <div class="col-xs-12 col-md-2">
                                Cantidad de Clases:
                                <dx:ASPxComboBox ID="cmbCantidadClases" SelectedIndex="0" runat="server" ClientInstanceName="cmbCantidadClases" Height="30px" Theme="Mulberry" Native="true" Width="100%" ValueType="System.String">
                                    <Items>
                                        <dx:ListEditItem Text="0" Value="0" />
                                        <dx:ListEditItem Text="1" Value="1" />
                                        <dx:ListEditItem Text="2" Value="2" />
                                        <dx:ListEditItem Text="3" Value="3" />
                                        <dx:ListEditItem Text="4" Value="4" />
                                        <dx:ListEditItem Text="5" Value="5" />
                                        <dx:ListEditItem Text="6" Value="6" />
                                        <dx:ListEditItem Text="7" Value="7" />
                                        <dx:ListEditItem Text="8" Value="8" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </div>
                            <div class="col-xs-12 padding-top-bottom-10">
                                <div class="col-xs-6">
                                    &nbsp
                                </div>
                                <div class="col-xs-6">
                                    <!-- boton -->
                                    <dx:ASPxButton runat="server" Text="Buscar" ID="btnGuardar" AutoPostBack="false" CssClass="btn btn-success" Native="true" Width="100%">
                                        <ClientSideEvents Click="function(s, e) {
                        pnlPrincipal.PerformCallback('BUSCAR');	
}" />
                                    </dx:ASPxButton>
                                </div>
                            </div>
                        </div>
                        <!-- MENSAJE -->
                        <uc1:MensajeBoostrap ID="MensajeBoostrap1" runat="server" />



<%--                        <div class="col-xs-12 border-bottom-burlywood fg-white" style="background: burlywood;">
                            <!-- nombre profesor -->
                            <h5>Nombre Profesor</h5>
                            <!-- ahora los elementos -->
                            <div class="col-xs-12" style="background:cadetblue;">
                                <div class="col-xs-12 fg-white">
                                    <div class="col-xs-12 col-md-6">
                                        <span>Nombre Cliente</span>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <span>PACK1-4</span>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-coral">
                                        Cerradas
                                    </div>
                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-gray">
                                        Pendientes
                                    </div>
                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-rosa">
                                        Total
                                    </div>
                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-primary">
                                        Pagado
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="col-xs-3 huge text-center fg-white bg-coral">
                                        1
                                    </div>
                                    <div class="col-xs-3 huge text-center fg-white bg-gray">
                                        8
                                    </div>
                                    <div class="col-xs-3 huge text-center fg-white bg-rosa">
                                        9
                                    </div>
                                    <div class="col-xs-3 huge text-center fg-white bg-primary">
                                        Si
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12" style="background:cadetblue;">
                                <div class="col-xs-12 fg-white">
                                    <div class="col-xs-6">
                                        <span>Nombre Cliente</span>
                                    </div>
                                    <div class="col-xs-6">
                                        <span>PACK1-4</span>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-coral">
                                        Cerradas
                                    </div>
                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-gray">
                                        Pendientes
                                    </div>
                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-rosa">
                                        Total
                                    </div>
                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-primary">
                                        Pagado
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <div class="col-xs-3 huge text-center fg-white bg-coral">
                                        1
                                    </div>
                                    <div class="col-xs-3 huge text-center fg-white bg-gray">
                                        8
                                    </div>
                                    <div class="col-xs-3 huge text-center fg-white bg-rosa">
                                        9
                                    </div>
                                    <div class="col-xs-3 huge text-center fg-white bg-primary">
                                        Si
                                    </div>
                                </div>
                            </div>

                        </div>--%>



                        <asp:Repeater ID="rptClases" runat="server" OnItemDataBound="rptClases_ItemDataBound">
                            <ItemTemplate>
                                <div class="col-xs-12 border-bottom-burlywood fg-white" style="background: antiquewhite;">
                                    <!-- nombre profesor -->
                                    <h5 style="color:cadetblue;"><%# Eval("Profesor.Nombres", "{0}")%> <%# Eval("Profesor.PrimerApellido", "{0}")%> <%# Eval("Profesor.SegundoApellido", "{0}")%></h5>
                                    <asp:Repeater ID="rptItems" runat="server">
                                        <ItemTemplate>
                                            <div class="col-xs-12" style="background: white;">
                                                <div class="col-xs-12 fg-tratamiento">
                                                    <div class="col-xs-12 col-md-6">
                                                        <span><%# Eval("NombreCliente", "{0}")%></span>
                                                    </div>
                                                    <div class="col-xs-12 col-md-6">
                                                        <span><%# Eval("CodigoPack", "{0}")%></span>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-coral">
                                                        Cerradas
                                                    </div>
                                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-gray">
                                                        Pendientes
                                                    </div>
                                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-rosa">
                                                        Total
                                                    </div>
                                                    <div class="col-xs-3 font-muypequeno text-center fg-white bg-primary">
                                                        Pagado
                                                    </div>
                                                </div>
                                                <div class="col-xs-12">
                                                    <div class="col-xs-3 huge text-center fg-white bg-coral">
                                                        <%# Eval("ClasesCerradas", "{0}")%>
                                                    </div>
                                                    <div class="col-xs-3 huge text-center fg-white bg-gray">
                                                        <%# Eval("ClasesPendientes", "{0}")%>
                                                    </div>
                                                    <div class="col-xs-3 huge text-center fg-white bg-rosa">
                                                        <%# Eval("TotalClases", "{0}")%>
                                                    </div>
                                                    <div class="col-xs-3 huge text-center fg-white bg-primary">
                                                        <%# Eval("EstaPagado", "{0}")%>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>



                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

        </section>
    
    </div>
    </form>
</body>
</html>
