<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SeleccionHorasCliente.aspx.cs" Inherits="SeleccionHorasCliente" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado,Juan Morán" />
    <title>Generar Formulario</title>
    <link rel="shortcut icon" href="images/IconoMiFamilia.png" />
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
        function Abrir(param, param1)
        {
            panelPrincipal.PerformCallback(param + '|' + param1);
            //popupAgenda.Show();
            //$('#myModal').modal('show');
            //alert(param + ' ' + param1);
        }
        function Abrir(param) {
            var pcoId = $('#ASPxCallbackPanel1_hidPCO_ID').val();
            var url = "SeleccionarSemanasCliente.aspx?PCO_ID=";
            if (parseInt(pcoId) > 0 && parseInt(param) > 0)
            {
                url = url + pcoId + '&PROF_ID=' + param;
                location.href = url;
            }

        }
        function AbrirDos(control, param) {
            //alert(fecha);
            var fechaActual = new Date();
            var controlFecha = $('#' + control).val();

            var fechaArr = controlFecha.split('-');
            var fechaInt = fechaArr[2] + fechaArr[1] + fechaArr[0];
            

            if (control == '') {
                alert('No puede seleccionar una fecha vacia.');
            }
            else {
                
                //alert(fechaInt);
                var pcoId = $('#ASPxCallbackPanel1_hidPCO_ID').val();
                var url = "SeleccionarSemanasCliente.aspx?PCO_ID=";
                if (parseInt(pcoId) > 0 && parseInt(param) > 0) {
                    url = url + pcoId + '&PROF_ID=' + param + '&FECHA_ENTERA=' + fechaInt + '&PRIMERA_FECHA=1';
                    location.href = url;
                }
            }

        }
        function CompararFecha(control)
        {
            var fechaact = new Date();
            var fecha = control.GetDate();
            if (fecha < fechaact)
            {
                alert('fecha no corresponde.');
                control.SetDate(fechaact);
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
<body style="padding-bottom:60px; padding-top:60px;">
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

            <section id="uno">
                <header class="titulo-header">
                    <nav class="navbar navbar-default-supervisor navbar-fixed-top bg-rosa">
                        <div class="container">
                            <div class="col-xs-2 glyphicon glyphicon-user font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                                
                            </div>
                            <div class="col-xs-10 titulo-header">
                                <h3>Selección</h3>
                                <h5>Profesores de la Comuna</h5>
                            </div>
                            
                        </div>
                    </nav>

                </header>



                
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="panelPrincipal" OnCallback="ASPxCallbackPanel1_Callback">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <section style="margin-top: 4em;">
                                <asp:HiddenField ID="hidPCO_ID" runat="server" />
                                <div class="col-xs-12 no-padding" id ="accordion">
                                    <asp:Repeater ID="rptCupos" runat="server">
                                        <ItemTemplate>

                                     <div class="col-xs-12 bd-gray no-padding border-bottom-item"" style="min-height:77px;">
                                        <div class="col-xs-2 circular">
                                            <img class="circular" src='<%# Eval("Profesor.Fotografia", "{0}")%>' width="50" height="50" alt="img" />
                                        </div>
                                        <div class="col-xs-8">
                                            <div class="col-xs-12 font-mediano fg-tratamiento"><%# Eval("Profesor.Nombres", "{0}")%> <%# Eval("Profesor.PrimerApellido", "{0}")%> <%# Eval("Profesor.SegundoApellido", "{0}")%></div>
                                            <%--<div class="col-xs-12 font-pequeno"><span class="fa fa-envelope"> </span><span> <%# Eval("Profesor.Email", "{0}")%></span></div>--%>
                                            <div class="col-xs-12 font-pequeno"><span class="fa fa-phone"> </span><span> <%# Eval("Profesor.TelefonosContacto", "{0}")%></span></div>
                                
                                        </div>
                                        <div class="col-xs-2 text-center pull-right fg-white bg-primary">
                                            <div class="huge"><%# Eval("EstrellasProfesor", "{0}")%>
                                            </div>
                                            <div class="font-muypequeno">Estrellas</div>
                                        </div>
                                         <div class="col-xs-12" >
                                             <a data-toggle="collapse" data-parent="#accordion" href="#<%# Eval("Profesor.Id", "{0}")%>"> <h6>Seleccione fecha para agendar</h6></a>
                                         </div>
                                         <div class="col-xs-12" style="padding-bottom:5px;" data-toggle="collapse" data-parent="#accordion">
                                             <div class="col-xs-12 no-padding collapse cursor-pointer" id='<%# Eval("Profesor.Id", "{0}")%>'>
                                                 
                                                 <%--<%# Eval("ProximosDias", "{0}")%>--%>
                                                 <div class="col-xs-12 alert alert-danger text-justify">
                                                     Si usted desea agendar clases con el profesor en una fecha posterior, seleccionela y luego presione "Agendar", de lo contrario solo presione "Agendar" y el sistema tomará la fecha actual como inicio de agendamiento.
                                                 </div>
                                                 <div class="col-xs-9">
                                                     <dx:ASPxDateEdit ID="dtFecha" ClientInstanceName="dtFecha" Theme="Mulberry" Width="100%"  runat="server" Date='<%# Bind("PrimerCupo") %>'  ReadOnly='<%# Bind("DeshabilitarControlFecha") %>'>
                                                         <%--<ClientSideEvents DateChanged="CompararFecha(s.GetDate())" />--%>
                                                         <ClientSideEvents DateChanged="function(s, e) { 
                CompararFecha(s);
        }" />
                                                     </dx:ASPxDateEdit>
                                                     
                                                 </div>

                                                 <div class="col-xs-3 well text-center no-padding bg-coral" style="margin-bottom:0;padding:5px;" onclick="AbrirDos('<%# Eval("IdControl", "{0}")%>', '<%# Eval("Profesor.Id", "{0}")%>')">
                                                     <div class="col-xs-12 no-padding text-center font-muypequeno">****</div>
                                                     <div class="col-xs-12 no-padding text-center fg-white"><span>AGENDAR</span></div>
                                                     <div class="col-xs-12 no-padding text-center font-muypequeno">****</div>

                                                 </div>
                                             </div>
                                         </div>
                                    </div>

                                        </ItemTemplate>
                                    </asp:Repeater>



                                </div>
                                

                                

                                <dx:ASPxPanel ID="panelHoras" runat="server" Width="100%">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <div class="col-xs-12">
                                                <dx:ASPxLabel ID="lblTituloPanel" ClientInstanceName="lblTituloPanel" runat="server" Text="">
                                                </dx:ASPxLabel>
                                                <dx:ASPxRadioButtonList ID="rdbCupos" runat="server" TextField="Horas" ValueField="Id" Width="100%" RepeatColumns="2" RepeatDirection="Horizontal">
                                                </dx:ASPxRadioButtonList>
                                            </div>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxPanel>

                                

                            </section>
                            <div class="col-xs-12 col-md-6">

                                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Volver" Width="100%" Native="true" CssClass="btn btn-warning pull-right" OnClick="btnCancelar_Click">
                                </dx:ASPxButton>

                            </div>

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </section>




        </div>
    </form>

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
</body>
</html>

