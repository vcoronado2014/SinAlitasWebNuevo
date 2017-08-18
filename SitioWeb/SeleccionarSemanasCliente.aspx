<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeleccionarSemanasCliente.aspx.cs" Inherits="SeleccionarSemanasCliente" %>

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
    <script type="text/javascript">
         function Abrir(fecha, puedeAgendar) {
            //alert(fecha);
            var pcoId = lblPcoId.GetText();
            var profId = lblProfId.GetText();
            var url = "ReservarHorasCliente.aspx?PCO_ID=";
            if (parseInt(pcoId) > 0 && parseInt(profId) > 0) {
                if (parseInt(puedeAgendar) == 1) {
                    url = url + pcoId + '&PROF_ID=' + profId + '&FECHA_ENTERA=' + fecha;
                    location.href = url;
                }
                else
                {
                    alert('No puede agendar más de 3 clases por semana. Puede reagendar sus clases  ya agendadas.');
                }
            }

         }
         function ActualizarPagina()
         {
             var urlActual = location.href;
             location.href = urlActual;
         }
         function Reagendar(idNodo, idProfesor, pcoId, id, clieId)
         {
             var url = "MostrarOchoDias.aspx?NOD_ID=" + idNodo + "&PROF_ID=" + idProfesor + "&PCO_ID=" + pcoId + "&CUPO_ID_REAGENDAR=" + id + "&CLIE_ID=" + clieId;
             popupReagendar.SetContentUrl(url);
             popupReagendar.Show();
         }
         function Calificar(idProfesor, pcoId) {
             if (idProfesor == '0' || idProfesor == '' || pcoId == '0' || pcoId == '') {
                 alert('Error al Calificar, contacte con el Administrador.');
                 return;
             }
             else {
                 var url = "CalificarProfe.aspx?PROF_ID=" + idProfesor + "&PCO_ID=" + pcoId;
                 popupReagendar.SetContentUrl(url);
                 popupReagendar.Show();
             }
         }
        function onModal() {
            var cantidadUsu = $('#hidCantidadUsuarios').val();
            //alert(cantidadUsu);
            if (parseInt(cantidadUsu) > 1)
                $('#myModal').modal('show');
        }
        function onSalirModal() {
            $('#myModal').modal('hide');
        }
        function CancelarClase(idNodo, idProfesor, pcoId, id, nombreCliente) {

            //alert('cancelar ' + id);
            var retVal = confirm("¿Esta seguro de cancelar esta clase con " + nombreCliente + "?");
            if (retVal == true) {
                var url = "CancelarClase.aspx?NOMBRE_CLIENTE=" + nombreCliente + "&ID=" + id;
                popupReagendar.SetHeaderText('Cancelar Clase');
                popupReagendar.SetContentUrl(url);
                popupReagendar.Show();
                return true;
            }
            else {
                //document.write("User does not want to continue!");
                return false;
            }

        }
        function PaginaMostrar(numero) {
            var url = "";
            if (numero == 'uno') {
                url = "InicioSupervisor.aspx";

                location.href = url;
            }
            if (numero == 'dos') {
                url = "BuscarPack.aspx";

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
        }
    </script>
</head> 
<body style="padding-bottom:60px; padding-top:40px;">
    <form id="form1" runat="server">

        <div class="container" style="padding-left:0; padding-right:0;">

            <!-- este es el menu inferior con las opciones del profesor -->
            <nav class="navbar navbar-principal-supervisor navbar-fixed-bottom">
                <div class="col-xs-12 container-footer">
                    <%--<div class="col-xs-1"></div>--%>
                    <div id="iconoHome" class="col-xs-2  font-nav-bar fa fa-user-plus height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">
                    </div>

                    <div id="iconoCitas" class="col-xs-2 glyphicon glyphicon-search font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">
                    </div>
                    <div id="iconoMedicamentos" class="col-xs-2 glyphicon glyphicon-new-window font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">
                    </div>

                    <div id="iconoCancelarClases" class="col-xs-2 fa fa-trash-o font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">
                    </div>
                    <div id="iconoAlertas" class="col-xs-2 fa fa-database font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')">
                    </div>
                </div>
            </nav>

                <header class="titulo-header">
                    <nav class="navbar navbar-default-supervisor navbar-fixed-top bg-rosa">
                        <div class="container">
                            <div class="col-xs-2 glyphicon glyphicon-user font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                            </div>
                            <div class="col-xs-10 titulo-header">
                                <h3>Agendar</h3>
                                <h5>Semanas del Profesor</h5>
                            </div>
                        </div>
                    </nav>

                </header>
                <dx:ASPxLabel ID="lblPcoId" ClientInstanceName="lblPcoId" ClientVisible="false" runat="server" Text="0">
                </dx:ASPxLabel>
                <dx:ASPxLabel ID="lblProfId" ClientInstanceName="lblProfId" ClientVisible="false" runat="server" Text="0">
                </dx:ASPxLabel>
                <section style="margin-top: 4em;">
                    <div class="col-xs-12">
                        <!-- foto del profe -->
                        <div class="col-xs-3 circular">
                            <%--<img class="circular" src="img/foto_curriculum.png" width="50" height="50" alt="img" />--%>
                            <asp:Image ID="imgProfesor" CssClass="circular" Width="50px" Height="50px" AlternateText="img" runat="server" />
                        </div>
                        <!-- nombre del Profesor -->
                        <h4 class="col-xs-9" style="color: black; padding-left: 50px; padding-top: 7px;">
                            <asp:Literal runat="server" ID="litNombreProfesor" Text="" />
                        </h4>

                    </div>

                    <hr class="border-bottom-item" style="width: 100%; padding-top: 5px;" />
                    <ul class="chat">
                        <li class="left clearfix">
                            <span class="chat-img pull-left">
                                <i class="fa fa-3x fa-info-circle img-circle" style="margin-left: 10px;"></i>
                            </span>
                            <div class="chat-body clearfix">
                                <p>
                                    <asp:Literal ID="litClasesAgendar" runat="server"></asp:Literal>
                                </p>
                            </div>
                        </li>
                    </ul>
                    <div class="col-xs-12 alert alert-success">

                        <asp:Literal ID="litMensajeAgradecimiento" runat="server" Visible="false"></asp:Literal>
                    </div>
                    <div class="col-xs-12">

                        <uc1:MensajeBoostrap ID="MensajeBoostrap1" runat="server" />

                    </div>
                    <!-- repeater -->

                    <asp:Repeater ID="rptSemanas" runat="server">
                        <ItemTemplate>
                            <div class="col-xs-12 border-bottom-item">
                                <!-- contenido de la semana -->
                                <div class="col-xs-10">
                                    <div class="col-xs-12 font-mediano fg-tratamiento"><%# Eval("SemanaString", "{0}")%></div>
                                    <div class="col-xs-12 font-pequeno badge">Tiene <%# Eval("DiasDisponibles", "{0}")%> cupos disponibles esta semana.</div>
                                </div>
                                <!-- boton para ir a la semana -->
                                <div class='<%# Eval("ClaseBoton", "{0}")%>' onclick="Abrir('<%# Eval("FechaInicioEntera", "{0}")%>', '<%# Eval("PuedeAgendar", "{0}")%>')">
                                    <div class="huge">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <div class="font-muypequeno">Ir</div>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a data-toggle="collapse" id="accordion" href="#panel2">Ver Mis clases Agendadas</a> <i class="fa fa-calendar-check-o pull-right"></i>

                            </div>
                            <div class="panel-body collapse" data-toggle="collapse" data-parent="#accordion" id="panel2">
                                <div class="list-group">
                                    <!-- acá el contenido del repeat -->
                                    <asp:Repeater ID="rptClasesAgendadas" runat="server">
                                        <ItemTemplate>
                                            <div class="list-group-item" style="min-height: 60px;">
                                                <!-- info de la clase -->
                                                <span><%# Eval("FechaStrInicio", "{0}")%></span>
                                                <span><%# Eval("Estado", "{0}")%></span>
                                                <%-- <p>Fecha Hora de la clase, estado</p>--%>
                                                <!-- botón de reagendar -->

                                                <i class='<%# Eval("ClaseIcono", "{0}")%>' onclick="CancelarClase('<%# Eval("NodId", "{0}")%>', '<%# Eval("ProfId", "{0}")%>', '<%# Eval("PcoId", "{0}")%>', '<%# Eval("Id", "{0}")%>', '<%# Eval("NombreCliente", "{0}")%>')"><span style="font-size: 0.5em; cursor:pointer;"> Cancelar</span></i>

                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- popup reagendar -->

                    <dx:ASPxPopupControl ID="popupReagendar" ClientInstanceName="popupReagendar" Width="320px" runat="server" MaxWidth="100%" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="Mulberry" HeaderText="Acción" MinWidth="90%" Modal="True" Style="min-width: 320px; max-width: 90%; min-width: 320px; min-height: 400px;">
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



                    <div class="col-xs-12 col-md-6">

                        <dx:ASPxButton ID="btnCancelar" runat="server" Text="Volver" Width="100%" Native="true" CssClass="btn btn-warning pull-right" OnClick="btnCancelar_Click">
                        </dx:ASPxButton>

                    </div>
                    <div class="col-xs-12 col-md-6 paddin-top-1">
                        <dx:ASPxButton ID="btnCalificar" runat="server" ClientVisible="False" Text="Calificar" Width="100%" Native="True" CssClass="btn btn-success pull-left" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	Calificar(lblProfId.GetText(), lblPcoId.GetText());
}" />
                        </dx:ASPxButton>
                    </div>



                </section>


        </div>

        
    </form>
            </body>
</html>
