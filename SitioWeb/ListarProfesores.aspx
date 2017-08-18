<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListarProfesores.aspx.cs" Inherits="ListarProfesores" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/CONTROLES/Encabezado.ascx" TagPrefix="uc1" TagName="Encabezado" %>


<%@ Register src="CONTROLES/Mensaje.ascx" tagname="Mensaje" tagprefix="uc2" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado,Juan Morán" />
    <title>Listar Profesores</title>
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
    <link href="vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="vendor/datatables/css/dataTables.material.min.css" rel="stylesheet" type="text/css"/>

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

    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/js/dataTables.material.min.js"></script>
    

    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        $(document).ready(function () {
            $('#example').DataTable({
                language: {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
                }

            });
        });
        function CrearProfesor()
        {
            var url = "crearProfesor.aspx?ES_NUEVO=1";
            location.href = url;

        }
        function EditarProfesor(idProfesor, puede) {
            if (puede == '0') {
                var url = "crearProfesor.aspx?ES_MODIFICADO=1&ID_PROFESOR=" + idProfesor;
                location.href = url;
            }
            else
            {
                alert('NO PUEDE EDITAR UN PROFESOR QUE ESTA ELIMINADO, ACTÍVELO ANTES Y LUEGO PODRÁ EDITARLO.');
            }

        }
        function EliminarProfesor(profId) {
            var opcion = 'desactivar';

            //alert('callback para habilitar todos los cupos');
            var answer = confirm("¿Está seguro de Eliminar a este profesor?")
            if (answer) {
                $.ajax({
                    type: "POST",
                    url: "CrearModificarProfesor.ashx",
                    data: { profId: profId, opcion: opcion },
                    // DO NOT SET CONTENT TYPE to json
                    // contentType: "application/json; charset=utf-8", 
                    // DataType needs to stay, otherwise the response object
                    // will be treated as a single string
                    dataType: "json",
                    success: function (response) {
                        //alert(response.d);
                        //realizar callback a la agenda
                        ActualizarProfesor(response.d, response.e);
                    }
                });
            }
            else {
                return;
            }

        }
        function ActualizarProfesor(profId, mensaje) {
            if (profId > 0)
            {
                //correcto
                alert(mensaje);
                pnlGeneral.PerformCallback(profId + ';' + mensaje);
            }
            else
            {
                alert(mensaje);
            }
            var link = 'ListarProfesores.aspx';
            window.location.href = link;

        }
        function Nuevo()
        {
            var url = "crearProfesor.aspx?ES_NUEVO=1";
            location.href = url;
        }
        function ActivarProfesor(profId) {
            var opcion = 'activar';

            //alert('callback para habilitar todos los cupos');
            var answer = confirm("¿Está seguro de Activar NUEVAMENTE a este profesor?")
            if (answer) {
                $.ajax({
                    type: "POST",
                    url: "CrearModificarProfesor.ashx",
                    data: { profId: profId, opcion: opcion },
                    // DO NOT SET CONTENT TYPE to json
                    // contentType: "application/json; charset=utf-8", 
                    // DataType needs to stay, otherwise the response object
                    // will be treated as a single string
                    dataType: "json",
                    success: function (response) {
                        //alert(response.d);
                        //realizar callback a la agenda
                        ActualizarProfesor(response.d, response.e);
                        $('#example').DataTable();
                    }
                });
            }
            else {
                return;
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
                <div id="iconoHome" data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Cliente" class="col-xs-2 col-md-1 font-nav-bar fa fa-user-plus height-50 text-center cursor-pointer" aria-hidden="true"  onclick="PaginaMostrar('uno')">
                </div>

                <div id="iconoCitas" data-toggle="tooltip" data-placement="top" data-original-title="Búsqueda de Pack" class="col-xs-2 col-md-1 glyphicon glyphicon-search  font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('dos')">
                </div>
                <div id="iconoMedicamentos" data-toggle="tooltip" data-placement="top" data-original-title="Crear Cliente" class="col-xs-2 col-md-1 glyphicon glyphicon-new-window font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('tres')">
                </div>
                <div id="iconoCancelarClases" data-toggle="tooltip" data-placement="top" data-original-title="Cancelar Clases"  class="col-xs-2 col-md-1 fa fa-trash-o font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cuatro')">
                </div>
                <div id="iconoAlertas"  data-toggle="tooltip" data-placement="top" data-original-title="Reporte de Profesores" class="col-xs-2 col-md-1 fa fa-info-circle font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('cinco')" >
                </div>
                <div id="iconoPlanillas" data-toggle="tooltip" data-placement="top" data-original-title="Disponibilidad de Profesores" class="col-xs-2 col-md-1 col-md-1 glyphicon glyphicon-equalizer font-nav-bar height-50  text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('seis')">
                </div>
                <!-- nuevos items -->
                <!-- falta crear profesor -->
                <div id="iconoListarProfesor" data-toggle="tooltip" data-placement="top" data-original-title="Editar Profesores" class="col-xs-2 col-md-1 fa fa-group font-nav-bar active-navbar-supervisor height-50  text-center cursor-pointer" aria-hidden="true">
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
                        <div class="col-xs-2 fa fa-angellist font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Listar Profesores</h3>
                            <%--<h5>Profesor</h5>--%>
                            <h5>
                                <asp:Literal ID="litNombreUsuario" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                </nav>

            </header>
        </section>
        <section>
            <div class="col-xs-12 panel destacadoSalmon">
                <div class="col-xs-9 col-md-5" >Pinche aquí si desea agregar un nuevo Profesor</div>
                <div  class="col-xs-3 col-md-7 left cursor-pointer" onclick="Nuevo()">
                    <div data-toggle="tooltip" data-placement="top" data-original-title="Nuevo Profesor" class="fa fa-3x fa-user-plus"></div>
                </div>
            </div>
        </section>
        <dx:ASPxCallbackPanel ID="pnlGeneral" ClientInstanceName="pnlGeneral" runat="server" Width="100%" OnCallback="pnlGeneral_Callback">
            <PanelCollection>
                <dx:PanelContent>
                    
                    <section class="hidden-xs">
                        <!-- contenido -->
                        <table id="example" class="display" cellspacing="0" width="100%">


                            <asp:Literal ID="litContenidoLista" runat="server"></asp:Literal>



                        </table>




                    </section>
                    <section>

                        <asp:Literal ID="litContenidoItem" runat="server"></asp:Literal>

                    </section>
                    <uc2:Mensaje ID="Mensaje1" runat="server" />
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

        
    
    </div>
    </form>
</body>
</html>
