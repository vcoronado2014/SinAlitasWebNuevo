<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreaCodigo1.aspx.cs" Inherits="CreaCodigo1" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="CONTROLES/Mensaje.ascx" tagname="Mensaje" tagprefix="uc1" %>

<%@ Register src="CONTROLES/MensajeBoostrap.ascx" tagname="MensajeBoostrap" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado,Juan Morán" />
    <title>Código</title>
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
            if (numero == 'uno') {
                url = "InicioSupervisor.aspx";

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
        function ValidaDescuento(objDescuento)
        {
            if (objDescuento.GetText() != '') {
                if (parseInt(objDescuento.GetText()) > 10000) {
                    alert("El descuento no puede ser superior a $10.000");
                    objDescuento.SetText('0');

                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                alert('Valor inválido.');
                objDescuento.SetText('0');
                return false;
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
                <div id="iconoHome"  data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Cliente" class="col-xs-2 fa fa-user-plus font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">
                </div>

                <div id="iconoCitas"  data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Pack"  class="col-xs-2 col-md-1 glyphicon glyphicon-search  font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">
                </div>
                <div id="iconoMedicamentos" data-toggle="tooltip" data-placement="top" data-original-title="Crear Cliente" class="col-xs-2 col-md-1 glyphicon glyphicon-new-window font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">
                </div>
                <div id="iconoCancelarClases" data-toggle="tooltip" data-placement="top" data-original-title="Cancelar Clases" class="col-xs-2 col-md-1 fa fa-trash-o font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">
                </div>
                <div id="iconoAlertas" data-toggle="tooltip" data-placement="top" data-original-title="Reporte de Profesores" class="col-xs-2 col-md-1 fa fa-database font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')" >
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


        <dx:ASPxCallbackPanel ID="pnlGeneral" ClientInstanceName="pnlGeneral" runat="server" Width="100%" OnCallback="pnlGeneral_Callback">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <!-- CONTENIDO DEL PANEL -->
                    <section id="uno">
                        <header class="titulo-header">
                            <nav class="navbar navbar-default-supervisor navbar-fixed-top bg-rosa">
                                <div class="container">
                                    <div class="col-xs-2 glyphicon glyphicon-search font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                                    </div>
                                    <div class="col-xs-10 titulo-header">
                                        <h3>Crear Código</h3>
                                        <%--<h5>Profesor</h5>--%>
                                        <h5>
                                            <asp:Literal ID="litNombreUsuario" runat="server"></asp:Literal></h5>
                                    </div>
                                </div>
                            </nav>

                        </header>
                        <!-- contenido -->
                        <section>
                            <div class="col-xs-12 panel" style="padding-top: 2px; padding-left: 2px; padding-right: 0; margin-bottom: 2px;">
                                <div class="col-xs-12">
                                    <span class="label label-primary">Datos del Cliente</span>
                                    <dx:ASPxLabel ID="lblIdClienteOculto" ClientInstanceName="lblIdClienteOculto" ClientVisible="false" runat="server" Text=""></dx:ASPxLabel>
                                </div>
                                <hr />
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsCliente">
                                    <ItemTemplate>
                                        <div class="col-xs-12 col-md-6">
                                            <i class="fa fa-user"></i><span class="font-mediano"><strong> <%# Eval("NombreFormateado", "{0}")%></strong></span>
                                        </div>
                                        <div class="col-xs-12 col-md-6">
                                            <i class="fa fa-map"></i><span class="font-pequeno"> <%# Eval("Direccion", "{0}")%></></span>
                                        </div>
                                        <div class="col-xs-12 col-md-6">
                                            <i class="fa fa-arrow-circle-o-right"></i><span class="font-pequeno"> <%# Eval("Region", "{0}")%></></span>
                                        </div>
                                        <div class="col-xs-12 col-md-6">
                                            <i class="fa fa-arrow-circle-o-right"></i><span class="font-pequeno"> <%# Eval("Comuna", "{0}")%></></span>
                                        </div>
                                        <div class="col-xs-12 col-md-6">
                                            <i class="fa fa-mail-forward"></i><span class="font-pequeno"> <%# Eval("Correo", "{0}")%></></span>
                                        </div>
                                        <div class="col-xs-12 col-md-6">
                                            <i class="fa fa-phone"></i><span class="font-pequeno"> <%# Eval("Celular", "{0}")%></></span>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:ObjectDataSource ID="odsCliente" runat="server" SelectMethod="RetornaClienteFormateado" TypeName="SinAlitas.Admin.Negocio.Cliente">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="ID_CLIENTE" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>

                            <div class="col-xs-12" style="padding-top: 0; padding-left: 2px; padding-right: 0; margin: 0;">
                                <div class="col-xs-12 col-md-6 destacado-oro">
                                    <span class="font-pequeno">Seleccione el Pack que el Cliente desea Contratar.</span>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <dx:ASPxComboBox ID="cmbPacks" ClientInstanceName="cmbPacks" Width="100%" Native="true" runat="server" ValueType="System.String" DataSourceID="odsProductos" TextField="Nombre" ValueField="Id">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
pnlGeneral.PerformCallback('BUSCAR_DATOS_PACK|' + s.GetValue());	
}" />
                                    </dx:ASPxComboBox>
                                    <asp:ObjectDataSource ID="odsProductos" runat="server" SelectMethod="ObtenerProductos" TypeName="SinAlitas.Admin.Negocio.Producto"></asp:ObjectDataSource>
                                </div>
                                <div class="col-xs-12 panel" style="padding-top: 0; padding-left: 2px; padding-right: 0; margin-bottom: 2px;">
                                    <div class="col-xs-12">
                                        <span class="label label-warning">Datos del Pack</span>
                                    </div>
                                    <hr />
                                    <div class="col-xs-12 col-md-6">
                                        <i class="fa fa-arrow-circle-o-right"></i><strong>
                                            <dx:ASPxLabel ID="lblNombrePackMostrar" CssClass="font-mediano" runat="server" Text=""></dx:ASPxLabel>
                                        </strong>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <i class="fa fa-arrow-circle-o-right"></i><strong>
                                            <dx:ASPxLabel ID="lblDescripcionPackMostrar" CssClass="font-mediano" runat="server" Text=""></dx:ASPxLabel>
                                        </strong>
                                    </div>

                                    <div class="col-xs-6">
                                        <label>
                                            Cantidad Clases
                                                <dx:ASPxComboBox ID="cmbCantidadClases" Native="true" Width="100%" runat="server" ValueType="System.String">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	pnlGeneral.PerformCallback('CONSTRUIR_CODIGO|' + cmbPacks.GetValue());	

}" />
                                                    <Items>
                                                        <dx:ListEditItem Text="4" Value="4" />
                                                        <dx:ListEditItem Text="5" Value="5" />
                                                        <dx:ListEditItem Text="6" Value="6" />
                                                        <dx:ListEditItem Text="7" Value="7" />
                                                        <dx:ListEditItem Text="8" Value="8" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                        </label>
                                    </div>
                                    <div class="col-xs-6">
                                        <label>
                                            Cantidad Alumnos
                                                <dx:ASPxComboBox ID="cmbCantidadAlumnos" Native="true" Width="100%" runat="server" ValueType="System.String">
                                                    <Items>
                                                        <dx:ListEditItem Text="1" Value="1" />
                                                        <dx:ListEditItem Text="2" Value="2" />
                                                        <dx:ListEditItem Text="3" Value="3" />
                                                        <dx:ListEditItem Text="4" Value="4" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
pnlGeneral.PerformCallback('CONSTRUIR_CODIGO|' + cmbPacks.GetValue());	
}" />
                                                </dx:ASPxComboBox>
                                        </label>
                                    </div>
                                    <div class="col-xs-6">
                                        <label>
                                            Precio del Pack
                                         <strong>
                                             <dx:ASPxLabel ID="lblValorDelPack" CssClass="font-mediano" runat="server" Text=""></dx:ASPxLabel>
                                         </strong>
                                            <dx:ASPxLabel ID="lblValorpackOculto" ClientInstanceName="lblValorpackOculto" ClientVisible="false" runat="server" Text=""></dx:ASPxLabel>
                                        </label>
                                    </div>
                                    <div class="col-xs-6">
                                        <label>
                                            Descuento
                                    <dx:ASPxTextBox ID="txtDescuento" ClientInstanceName="txtDescuento" Native="true" runat="server" Text="0" Width="100%">
                                        <ClientSideEvents TextChanged="function(s, e) {
if (ValidaDescuento(s))
	pnlGeneral.PerformCallback('CONSTRUIR_CODIGO|' + cmbPacks.GetValue());
}" />
                                    </dx:ASPxTextBox>
                                        </label>
                                    </div>
                                    <div class="col-xs-6">
                                        <label>
                                            Total Pack
                                    <dx:ASPxTextBox ID="txtTotalPack" ClientInstanceName="txtTotalPack" Native="true" runat="server" Text="0" ReadOnly="true" Width="100%"></dx:ASPxTextBox>
                                        </label>
                                    </div>
                                    <div class="col-xs-6">
                                        <label>
                                            Código Cliente
                                    <dx:ASPxTextBox ID="txtCodigoCliente" ClientInstanceName="txtCodigoCliente" Native="true" runat="server" Text="" ReadOnly="true" Width="100%"></dx:ASPxTextBox>
                                        </label>
                                    </div>

                                    <div class="col-xs-6">
                                        <!-- boton -->
                                        <dx:ASPxButton runat="server" Text="Cancelar" ID="btnCancelar" CssClass="btn btn-warning" Native="true" Width="100%" OnClick="btnCancelar_Click"></dx:ASPxButton>
                                    </div>
                                    <div class="col-xs-6">
                                        <!-- boton -->
                                        <dx:ASPxButton runat="server" Text="Guardar" ID="btnGuardar" AutoPostBack="false" CssClass="btn btn-success" Native="true" Width="100%">
                                            <ClientSideEvents Click="function(s, e) {
                        pnlGeneral.PerformCallback('GUARDAR|' + cmbPacks.GetValue());	
}" />
                                        </dx:ASPxButton>
                                    </div>
                                    <div class="col-xs-12">

                                        <%--<uc1:Mensaje ID="Mensaje1" runat="server" />--%>

                                        <uc2:MensajeBoostrap ID="MensajeBoostrap1" runat="server" />

                                    </div>
                                </div>

                            </div>
                        </section>

                    
                    

                    </section>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>
    </form>
</body>
</html>
