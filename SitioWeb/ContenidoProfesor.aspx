<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContenidoProfesor.aspx.cs" Inherits="ContenidoProfesor" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
        function PaginaMostrar(numero) {
            var url = "";
            if (numero == 'dos') {
                alert('Debe seleccionar el día para agendar sus horas.');
            }
            if (numero == 'tres') {
                url = "TareasProfesor.aspx";

                location.href = url;
            }
            if (numero == 'cuatro') {
                url = "TareasProfesorRealizadas.aspx";

                location.href = url;
            }
            if (numero == 'cinco') {
                url = "CalificacionesProfesor.aspx";

                location.href = url;
            }
        }
    </script>
     <script src="js/CalendarioProfesor.js"></script>
</head>
<body style="padding-bottom:60px; padding-top:60px;">
    <form id="form1" runat="server">
    <div class="container" style="padding-left:0; padding-right:0;">
        <!-- este es el menu inferior con las opciones del profesor -->
        <nav class="navbar navbar-principal-profe navbar-fixed-bottom">
            <div class="col-xs-12 container-footer">
                <%--<div class="col-xs-1"></div>--%>
                <div id="iconoHome" class="col-xs-2 glyphicon glyphicon-calendar font-nav-bar active-navbar-profe height-50 text-center cursor-pointer" aria-hidden="true">
                    <%--<div id="iconoHome" class="col-xs-2 font-nav-bar img-home-activo active-navbar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">--%>
                </div>

                <div id="iconoCitas" class="col-xs-2 glyphicon glyphicon-time font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">
                    <%--<div id="iconoCitas" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">--%>
                </div>
                <div id="iconoMedicamentos" class="col-xs-2 glyphicon glyphicon-tasks font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">
                    <%--<div id="iconoMedicamentos" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">--%>
                </div>
                <div id="iconoAlimentos" class="col-xs-2 glyphicon glyphicon-check font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">
                    <%--<div id="iconoAlimentos" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">--%>
                    <%--<div id="iconoAlimentos" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">--%>
                </div>
                <div id="iconoVacunas" class="col-xs-2 glyphicon glyphicon-star font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')">
                    <%--<div id="iconoVacunas" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')">--%>
                </div>
<%--                <div class="col-xs-2 glyphicon glyphicon-globe font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true">
                    
                </div>--%>

            </div>
        </nav>


        <section id="uno">
            <header class="titulo-header">
                <nav class="navbar navbar-default-profe navbar-fixed-top bg-rosa">
                    <div class="container">
                        <div class="col-xs-2 glyphicon glyphicon-calendar font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Agendar</h3>
                            <%--<h5>Profesor</h5>--%>
                            <h5><asp:Literal ID="litNombreUsuario" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                </nav>

            </header>

            <!-- contenido -->
            <section>
                <dx:ASPxCallbackPanel ID="pnlPrincipal" ClientInstanceName="pnlPrincipal" runat="server" Width="100%" OnCallback="pnlPrincipal_Callback">
                    <ClientSideEvents BeginCallback="function(s, e) {
                        pnlPrincipal.SetEnabled(false);
}" EndCallback="function(s, e) {
pnlPrincipal.SetEnabled(true);
}" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <!-- variables escondidas -->
                        <dx:ASPxLabel ID="lblNodIdOculto" runat="server" Text="0" ClientVisible="false" ClientInstanceName="lblNodIdOculto">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="lblProfIdOculto" runat="server" Text="0" ClientVisible="false" ClientInstanceName="lblProfIdOculto">
                        </dx:ASPxLabel>
                        <!-- titulo -->
                        <div class="col-xs-12 bg-white">

                            <dx:ASPxComboBox CssClass="titulo col-xs-10 text-right no-margin" ID="cmbMeses" runat="server" Native="True" BackColor="Transparent" TextField="Nombre" ValueField="IdMes" AutoResizeWithContainer="True" ValueType="System.Int32">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	if (s.GetText() != null){
		ActualizarCalendario(s.GetText(), '', 0);
    }
}" />
                                <ItemStyle HorizontalAlign="Right" Wrap="True" />
                                <DropDownButton Position="Left">
                                </DropDownButton>
                                <Paddings Padding="0px" />
                                <Border BorderStyle="None" />
                            </dx:ASPxComboBox>


                            <div class="col-xs-2">
                                <%--<dx:ASPxHyperLink ID="hlVolver" runat="server" Text="Volver" ImageUrl="~/img/atras.png" ImageWidth="30px">
                                    <Border BorderStyle="None" />
                                </dx:ASPxHyperLink>--%>
                            </div>


                        </div>


                        <div class="col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" id="accordion" href="#panel1">Información </a> <i class="fa fa-info-circle pull-right"></i>

                                </div>
                                <div class="panel-body collapse" data-toggle="collapse" data-parent="#accordion" id="panel1">
                                    <div class="col-xs-6 col-lg-3 margin-bottom-0">
                                        <i class="fa fa-2x fa-list pull-left"></i>

                                        <span class="font-pequeno">Permite tomar todos los cupos disponibles del día.</span>


                                    </div>
                                    <div class="col-xs-6 col-lg-3 margin-bottom-0">
                                        <i class="fa fa-2x fa-check-circle pull-left"></i>

                                        <span class="font-pequeno">Permite tomar de uno en uno los cupos disponibles del día.</span>


                                    </div>
                                    <div class="col-xs-6 col-lg-3 margin-bottom-0">
                                        <i class="fa fa-2x fa-trash pull-left"></i>

                                        <span class="font-pequeno">Permite eliminar todos los cupos disponibles.</span>


                                    </div>
                                    <div class="col-xs-6 col-lg-3 margin-bottom-0">
                                        <i class="fa fa-2x fa-eye pull-left"></i>

                                        <span class="font-pequeno">Permite mostrar los cupos disponibles del día.</span>


                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 border-top-double-burlywood">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div class='<%# Eval("ClaseBorde", "{0}")%>'>
                                        <div class="col-xs-8 no-padding">
                                            <div class="col-xs-3 col.lg-4 size-18 text-center fg-white pointer">
                                                <%-- <span class="size-12 top-text"><%# Eval("DiaSemanaInt", "{0}")%></span>--%>
                                                <span class='<%# Eval("ClaseDia", "{0}")%>' style="margin-top:4px;"><%# Eval("DiaSemanaInt", "{0}")%></span>
                                            </div>
                                            <div class="col-xs-9 col-lg-8">
                                                <span><%# Eval("DiaSemana", "{0}")%></span>
                                            </div>
                                            <div class="col-xs-9 col-lg-8 no-padding">
                                                <span class="badge"><%# Eval("HoraInicio", "{0}")%></span>
                                                <span class="badge"><%# Eval("HoraTermino", "{0}")%></span>
                                                <strong><span class="label label-default"><%# Eval("CuposDisponibles", "{0}")%></span></strong> 
                                            </div>
                                        </div>
                                        <!-- botones -->
                                        <div class="col-xs-4 no-padding">
                                            <!-- activa todos los cupos -->

                                            <div class="col-xs-6 col-lg-3 fa fa-2x fa-list size-18 text-center bg-turquesa pointer border-bottom-icono" style="padding:0.1em;" onclick='<%# "HabilitarTodos(" +Eval("NodId") + "," + Eval("ProfId") + "," + Eval("FechaEntera") + "," + Eval("DeshabilitaCrearTodo") + " );" %>'>
                                                <br class="visible-md" />
                                                <span class="size-12 top-text visible-md">Todas</span>
                                            </div>
                                            <!-- lo redirecciona a una pagina para ir activando los cupos de uno -->
                                            <div class="col-xs-6 col-lg-3 fa fa-2x fa-check-circle size-18 text-center bg-esmeralda pointer border-bottom-icono" style="padding:0.1em;" onclick='<%# "Abrir(" +Eval("NodId") + "," + Eval("ProfId") + "," + Eval("FechaEntera") + "," + Eval("DeshabilitaCrearTodo") + " );" %>'>
                                                <br class="visible-md" />
                                                <span class="size-12 top-text visible-md">Una</span>
                                            </div>
                                            <!-- elimina todos los cupos -->
                                            <div class="col-xs-6 col-lg-3 fa fa-2x fa-trash size-18 text-center bg-carrot pointer border-bottom-icono" style="padding:0.1em;" onclick='<%# "CancelarTodos(" +Eval("NodId") + "," + Eval("ProfId") + "," + Eval("FechaEntera") + "," + Eval("DeshabilitaBorrarTodo") + " );" %>'>
                                                <br class="visible-md" />
                                                <span class="size-12 top-text visible-md">Todas</span>
                                            </div>
                                            <!-- lo redirecciona a una pagina para ir eliminando los cupos de uno -->
                                            <div class="col-xs-6 col-lg-3 fa fa-2x fa-eye size-18 text-center bg-peter-river pointer border-bottom-icono" style="padding:0.1em;"  onclick='<%# "Mostrar(" +Eval("NodId") + "," + Eval("ProfId") + "," + Eval("FechaEntera") + "," + Eval("DeshabilitaCrearTodo") + " );" %>'>
                                                <br class="visible-md" />
                                                <span class="size-12 top-text visible-md">Ver</span>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
            </section>

        </section>

    
    </div>

    </form>
</body>
</html>
