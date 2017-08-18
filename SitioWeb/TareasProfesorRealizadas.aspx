<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TareasProfesorRealizadas.aspx.cs" Inherits="TareasProfesorRealizadas" %>

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
    <title>Profesor</title>
    <link rel="shortcut icon" href="images/IconoMiFamilia.png"/>
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/estilocliente.css" rel="stylesheet" type="text/css"/>
    <link href="css/coro.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        function PaginaMostrar(numero) {
            var url = "";
            if (numero == 'dos') {
                alert('Debe seleccionar el día para agendar sus horas.');
            }
            if (numero == 'uno') {
                url = "ContenidoProfesor.aspx";

                location.href = url;
            }
            if (numero == 'tres') {
                url = "TareasProfesor.aspx";

                location.href = url;
            }
            if (numero == 'cinco') {
                url = "CalificacionesProfesor.aspx";

                location.href = url;
            }
        }
        function ActualizarPagina() {
            var urlActual = location.href;
            location.href = urlActual;
        }
        function CerrarClase(nombreCliente, id) {
            var url = "cerrarclase.aspx?NOMBRE_CLIENTE=" + nombreCliente + "&ID=" + id;
            popupCerrarClase.SetContentUrl(url);
            popupCerrarClase.Show();
        }
    </script>

</head>
<body style="padding-bottom:60px; padding-top:60px;">
    <form id="form1" runat="server">
        <div class="container" style="padding-left:0; padding-right:0;">
            <!-- este es el menu inferior con las opciones del profesor -->
            <nav class="navbar navbar-principal-profe navbar-fixed-bottom">
                <div class="col-xs-12 container-footer">
                    <%--<div class="col-xs-1"></div>--%>
                    <div id="iconoHome" class="col-xs-2 glyphicon glyphicon-calendar font-nav-bar  height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">
                        <%--<div id="iconoHome" class="col-xs-2 font-nav-bar img-home-activo active-navbar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">--%>
                    </div>

                    <div id="iconoCitas" class="col-xs-2 glyphicon glyphicon-time font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">
                        <%--<div id="iconoCitas" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">--%>
                    </div>
                    <div id="iconoMedicamentos" class="col-xs-2 glyphicon glyphicon-tasks font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">
                        <%--<div id="iconoMedicamentos" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">--%>
                    </div>
                    <div id="iconoAlimentos" class="col-xs-2 glyphicon glyphicon-check font-nav-bar active-navbar-profe height-50 text-center cursor-pointer" aria-hidden="true">
                        <%--<div id="iconoAlimentos" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">--%>
                        <%--<div id="iconoAlimentos" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">--%>
                    </div>
                    <div id="iconoVacunas" class="col-xs-2 glyphicon glyphicon-star font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')">
                        <%--<div id="iconoVacunas" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')">--%>
                    </div>

                </div>
            </nav>

            <section id="uno">

                <header class="titulo-header">
                    <nav class="navbar navbar-default-profe navbar-fixed-top bg-rosa">
                        <div class="container">
                            <div class="col-xs-2 glyphicon glyphicon-tasks font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                            </div>
                            <div class="col-xs-10 titulo-header">
                                <h3>Mis Clases Realizadas</h3>
                                <%--<h5>Profesor</h5>--%>
                                <h5>
                                    <asp:Literal ID="litNombreUsuario" runat="server"></asp:Literal></h5>
                            </div>
                        </div>
                    </nav>

                </header>

                <dx:ASPxCallbackPanel ID="pnlPrincipal" ClientInstanceName="pnlPrincipal" runat="server" Width="100%" OnCallback="pnlPrincipal_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <!-- variables escondidas -->
                        <dx:ASPxLabel ID="lblNodIdOculto" runat="server" Text="0" ClientVisible="false" ClientInstanceName="lblNodIdOculto">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="lblProfIdOculto" runat="server" Text="0" ClientVisible="false" ClientInstanceName="lblProfIdOculto">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="lblFechaEnteraOculto" runat="server" Text="0" ClientVisible="false" ClientInstanceName="lblFechaEnteraOculto">
                        </dx:ASPxLabel>



                        <asp:Repeater ID="rptTareas" runat="server" OnItemDataBound="rptTareas_ItemDataBound">
                            <ItemTemplate>
                                <!-- contenido del repeater 1 -->
                                <%--<div class="col-xs-12" style="padding: 0.8rem; margin-bottom: 0.3rem;">--%>
                                <div class="col-xs-12" >
                                    <!-- titulo colapsado -->
                                    <div class="col-xs-12 alert alert-success" style="margin-bottom:5px;">
                                         <a data-toggle="collapse" id="accordion" href='#<%# Eval("IdPopup", "{0}")%>'>  <%# Eval("FechaTexto", "{0}")%></a> <i class="fa fa-calendar-check-o pull-right"></i>
                                        
                                    </div>

                                    <div class="col-xs-12 no-padding collapse" data-toggle="collapse" style="background:white;" data-parent="#accordion" id='<%# Eval("IdPopup", "{0}")%>'>
                                        <asp:Repeater ID="rptItems" runat="server">
                                            <ItemTemplate>
                                                <div class="col-xs-12 border-bottom-burlywood">
                                                <div class="col-xs-12 no-padding">
                                                    
                                                    <%--<span class="badge"><%# Eval("FechaHoraInicioTexto", "{0}")%> - <%# Eval("FechaHoraTerminoTexto", "{0}")%></span>--%>
                                                    <div class="huge" style="font-size:20px;"><%# Eval("FechaHoraInicioTexto", "{0}")%> - <%# Eval("FechaHoraTerminoTexto", "{0}")%></div>
                                                    
                                                    <i class="fa fa-user"></i>&nbsp;<span class="font-mediano negrita"><%# Eval("NombreCliente", "{0}")%></span><span class="font-mediano negrita"> <%# Eval("CodigoCliente", "{0}")%></span>  <br />
                                                    <%--<i class="fa fa-info-circle"></i>&nbsp;<span class="font-pequeno"><%# Eval("Descripcion", "{0}")%></span><br />--%>
                                                    <i class="fa fa-info-circle"></i>&nbsp;<dx:ASPxHyperLink ID="hlDireccion" runat="server" Text='<%# Eval("Descripcion", "{0}")%>' NavigateUrl='<%# String.Format("visorDirecciones.aspx?DIRECCION_CONSULTAR={0}", DataBinder.Eval(Container.DataItem, "DireccionCliente")) %>'>
                                                    </dx:ASPxHyperLink>
                                                </div>
                                                <i class='<%# Eval("ClaseVisible", "{0}")%>' onclick="CerrarClase('<%# Eval("NombreCliente", "{0}")%>', '<%# Eval("Id", "{0}")%>')"></i>
                                                    </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>


                        <dx:ASPxPopupControl ID="popupCerrarClase" ClientInstanceName="popupCerrarClase" Width="320px" runat="server" MaxWidth="100%" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Mulberry" HeaderText="Reagendar" MinWidth="90%" Modal="True" Style="min-width: 320px; max-width: 90%; min-width: 320px; min-height: 400px;">
                            <ClientSideEvents CloseUp="function(s, e) {
	ActualizarPagina();
}" />
                            <ContentStyle>
                                <Paddings Padding="0px" />
                            </ContentStyle>
                            <ContentCollection>
                                <dx:PopupControlContentControl runat="server">
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
            </section>

        </div>
        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="dist/js/sb-admin-2.js"></script>
            <!-- js del app -->
        <%--<script src="js/TareasProfesor.js"></script>--%>
    </form>
</body>
</html>
