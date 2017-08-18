<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CrearCliente.aspx.cs" Inherits="CrearCliente" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="CONTROLES/Mensaje.ascx" tagname="Mensaje" tagprefix="uc1" %>

<%@ Register Src="~/CONTROLES/Encabezado.ascx" TagPrefix="uc2" TagName="Encabezado" %>

<%@ Register src="CONTROLES/MensajeBoostrap.ascx" tagname="MensajeBoostrap" tagprefix="uc3" %>

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
            if (numero == 'uno') {
                url = "InicioSupervisor.aspx";

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

    </script>

</head>
<body style="padding-bottom:60px; padding-top:60px;">
    <form id="form1" runat="server">
    <div class="container" style="padding-left:0; padding-right:0;">
        <!-- este es el menu inferior con las opciones del profesor -->
        <nav class="navbar navbar-principal-supervisor navbar-fixed-bottom">
            <div class="col-xs-12 container-footer">
                <%--<div class="col-xs-1"></div>--%>
                <div id="iconoHome" data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Cliente" class="col-xs-2 col-md-1 fa fa-user-plus font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">
                </div>

                <div id="iconoCitas" data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Pack"  class="col-xs-2 col-md-1 glyphicon glyphicon-search font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">
                </div>
                <div id="iconoMedicamentos"  data-toggle="tooltip" data-placement="top" data-original-title="Crear Cliente" class="col-xs-2 col-md-1 glyphicon glyphicon-new-window active-navbar-supervisor font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true"">
                </div>
                <div id="iconoCancelarClases" data-toggle="tooltip" data-placement="top" data-original-title="Cancelar Clases" class="col-xs-2 col-md-1 fa fa-trash-o font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">
                </div>
                <div id="iconoAlertas" data-toggle="tooltip" data-placement="top" data-original-title="Reporte de Profesores" class="col-xs-2 col-md-1 fa fa-database font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')">
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

            
        <dx:ASPxCallbackPanel ID="pnlGeneral" ClientInstanceName="pnlGeneral" runat="server" Width="100%" OnCallback="pnlGeneral_Callback">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <section id="uno">
                        <header class="titulo-header">
                            <nav class="navbar navbar-default-supervisor navbar-fixed-top bg-rosa">
                                <div class="container">
                                    <div class="col-xs-2 glyphicon glyphicon-new-window font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                                    </div>
                                    <div class="col-xs-10 titulo-header">
                                        <h3>Crear Cliente</h3>
                                        <%--<h5>Profesor</h5>--%>
                                        <h5>
                                            <asp:Literal ID="litNombreUsuario" runat="server"></asp:Literal></h5>
                                    </div>
                                </div>
                            </nav>

                        </header>

                    </section>


                    <!-- CONTENIDO DEL PANEL -->
                    <div class="col-xs-12 panel" style="padding-top: 2px; padding-left: 2px; padding-right: 0; margin-bottom: 2px;">
                        <!-- nombres -->
                        <div class="col-xs-12 col-md-6">
                            <label style="width:100%;">
                                Nombres (*)
                                <dx:ASPxTextBox ID="txtNombres" Native="true" runat="server" Width="100%" Theme="Mulberry">
                            </dx:ASPxTextBox>
                            </label>
                        </div>
                        <!-- Primer Apellido -->
                        <div class="col-xs-12 col-md-6">
                            <label style="width:100%;">
                                Apellido Paterno (*)
                                <dx:ASPxTextBox ID="txtApellidoPaterno" Native="true" runat="server" Width="100%" Theme="Mulberry"></dx:ASPxTextBox>
                            </label>
                        </div>
                        <!-- segundo apellido -->
                        <div class="col-xs-12 col-md-6">
                            <label style="width:100%;">
                                Apellido Materno
                                <dx:ASPxTextBox ID="txtApellidoMaterno" Native="true" runat="server" Width="100%" Theme="Mulberry"></dx:ASPxTextBox>
                            </label>
                        </div>
                        <!-- región -->
                        <div class="col-xs-12 col-md-6">
                            <label style="width:100%;">
                                Región  (*)
                                <dx:ASPxComboBox ID="cmbRegion" runat="server" ValueType="System.String" Native="true" Width="100%" DataSourceID="odsRegiones" SelectedIndex="0" TextField="Nombre" ValueField="Id" Theme="Mulberry">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cmbComuna.PerformCallback(s.GetValue());
}" />
                            </dx:ASPxComboBox>
                            <asp:ObjectDataSource ID="odsRegiones" runat="server" SelectMethod="ListarRegiones" TypeName="SinAlitas.Admin.Negocio.Territorio"></asp:ObjectDataSource>
                            </label>
                        </div>
                        <!-- comuna -->
                        <div class="col-xs-12 col-md-6">
                            <label style="width:100%;">
                                Comuna (*)
                                <dx:ASPxComboBox ID="cmbComuna" runat="server" ValueType="System.String" Native="true" Width="100%" ClientInstanceName="cmbComuna" DataSourceID="odsComunas" OnCallback="cmbComuna_Callback" SelectedIndex="0" TextField="Nombre" ValueField="Id"></dx:ASPxComboBox>
                            <asp:ObjectDataSource ID="odsComunas" runat="server" SelectMethod="ListarComunasPorRegion" TypeName="SinAlitas.Admin.Negocio.Territorio">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cmbRegion" DefaultValue="0" Name="idReg" PropertyName="Value" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            </label>
                        </div>
                        <!-- Direccion -->
                        <div class="col-xs-12 col-md-6">
                            <label style="width:100%;">
                                Dirección (Calle y número) (*)
                                <dx:ASPxTextBox ID="txtDireccion" Native="true" runat="server" Width="100%" Theme="Mulberry"></dx:ASPxTextBox>
                            </label>
                        </div>
                         <!-- correo electrónico -->
                        <div class="col-xs-12 col-md-6">
                            <label style="width:100%;">
                                Correo Electrónico (*)
                                <dx:ASPxTextBox ID="txtCorreo" Native="true" runat="server" Width="100%" AutoCompleteType="Email" Theme="Mulberry"></dx:ASPxTextBox>
                            </label>
                        </div>
                        <!-- celular -->
                        <div class="col-xs-6">
                            <label style="width:100%;">
                                Celular 9 digitos ej:985006954 (*)
                                <dx:ASPxTextBox ID="txtCelular" Native="true" runat="server" Width="100%" MaxLength="9" Theme="Mulberry"></dx:ASPxTextBox>
                            </label>
                        </div>
                        <!-- celular 2 -->
                        <div class="col-xs-6">
                            <label style="width:100%;">
                                Otro Fono
                                <dx:ASPxTextBox ID="txtOtroFono" Native="true" runat="server" Width="100%" Theme="Mulberry"></dx:ASPxTextBox>
                            </label>
                        </div>
                        <hr />
                        <div class="col-xs-12">

                            <uc3:MensajeBoostrap ID="MensajeBoostrap1" runat="server" />

                            <%--<uc1:Mensaje ID="Mensaje1" runat="server" />--%>

                        </div>
                        <div class="col-xs-6">
                            <!-- boton -->
                            <dx:ASPxButton runat="server" Text="Cancelar" ID="btnCancelar" CssClass="btn btn-warning" Native="true" Width="100%" OnClick="btnCancelar_Click" ></dx:ASPxButton>
                        </div>
                        <div class="col-xs-6">
                            <!-- boton -->
                            <dx:ASPxButton runat="server" Text="Guardar" ID="btnGuardar" AutoPostBack="false" CssClass="btn btn-success" Native="true" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
                        pnlGeneral.PerformCallback('GUARDAR|' + cmbComuna.GetValue());	
}" />
                            </dx:ASPxButton>
                        </div>

                    </div>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>
    </form>
</body>
</html>
