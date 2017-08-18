<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CalificacionesProfesor.aspx.cs" Inherits="CalificacionesProfesor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado,Juan Morán" />
    <title>Calificaciones</title>
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
            if (numero == 'uno') {
                url = "ContenidoProfesor.aspx";

                location.href = url;
            }
            if (numero == 'cuatro') {
                url = "TareasProfesorRealizadas.aspx";

                location.href = url;
            }
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
                <div id="iconoHome" class="col-xs-2 glyphicon glyphicon-calendar font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">
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
                <div id="iconoVacunas" class="col-xs-2 glyphicon glyphicon-star active-navbar-profe font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true">
                    <%--<div id="iconoVacunas" class="col-xs-2 font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')">--%>
                </div>


            </div>
        </nav>
        <section id="uno">
            <header class="titulo-header">
                <nav class="navbar navbar-default-profe navbar-fixed-top bg-rosa">
                    <div class="container">
                        <div class="col-xs-2 glyphicon glyphicon-star font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Mis Calificaciones</h3>
                            <%--<h5>Profesor</h5>--%>
                            <h5>
                                <asp:Literal ID="litNombreUsuario" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                </nav>

            </header>
            <!-- contenido -->
            <section>
                <div class="col-xs-12">
                    <div class="col-xs-12 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-star fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">
                                            <asp:Literal ID="litPromedioCalificaciones" runat="server"></asp:Literal></div>
                                        <div>Estrellas</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">Promedio de Calificaciones</span>
                                    <span class="pull-right"><i class="fa fa-info-circle"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xs-12 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comment fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><asp:Literal ID="litCantidadComentarios" runat="server"></asp:Literal></div>
                                        <div>Comentarios</div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="panel-footer">
                                    <div class="list-group">
                                    <asp:Repeater ID="rptCupos" runat="server">
                                        <ItemTemplate>

                                            <div class="list-group-item">
                                                <i class="fa fa-comment fa-fw"></i> <%# Eval("Observacion", "{0}")%>
                                                <span class="pull-right text-muted small"><em><%# Eval("Fecha", "{0}")%></em>
                                                </span>
                                            </div>
                                          

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </section>

        </section>

    </div>
    </form>
</body>
</html>
