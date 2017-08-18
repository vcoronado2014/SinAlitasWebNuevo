<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CrearNuevoProfesor.aspx.cs" Inherits="CrearNuevoProfesor" %>

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
        function EditarProfesor(idProfesor) {
            var url = "crearProfesor.aspx?ES_MODIFICADO=1&ID_PROFESOR=" + idProfesor;
            location.href = url;

        }
        function EliminarProfesor(idProfesor) {
            //var url = "crearProfesor.aspx?ES_NUEVO=1";
            //location.href = url;
            // llamada ajax
            if (confirm('¿Está seguro de eliminar al profesor este Profesor'))
            {
                //ajax

            }

        }
        function ActivarProfesor(idProfesor) {
            //var url = "crearProfesor.aspx?ES_NUEVO=1";
            //location.href = url;
            // llamada ajax
            if (confirm('¿Está seguro de Activar NUEVAMENTE a este profesor')) {
                //ajax

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
                url = "alertassupervisor.aspx";

                location.href = url;
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


        <table id="example" class="display" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th></th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Nombre</th>
                    <th></th>
                </tr>
            </tfoot>
            <tbody>
                <tr>
                    <td>Huechuraba</td>
                    <td><i class='fa fa-2x fa-user-times' style='color: red;' onclick='alert(2)'></i></td>
                </tr>
                <tr>
                    <td>Vitacura</td>
                    <td><i class='fa fa-2x fa-user-times' style='color: red;' onclick='alert(12)'></i></td>
                </tr>
                <tr>
                    <td>Lo Barnechea</td>
                    <td><i class='fa fa-2x fa-user-times' style='color: red;' onclick='alert(13)'></i></td>
                </tr>
                <tr>
                    <td>Las Condes</td>
                    <td><i class='fa fa-2x fa-user-times' style='color: red;' onclick='alert(14)'></i></td>
                </tr>
                <tr>
                    <td>Seleccione</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(0)'></i></td>
                </tr>
                <tr>
                    <td>No Informado</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(1)'></i></td>
                </tr>
                <tr>
                    <td>El Bosque</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(3)'></i></td>
                </tr>
                <tr>
                    <td>Lo Espejo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(4)'></i></td>
                </tr>
                <tr>
                    <td>Pedro Aguirre Cerda</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(5)'></i></td>
                </tr>
                <tr>
                    <td>Santiago</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(6)'></i></td>
                </tr>
                <tr>
                    <td>Estacion Central</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(7)'></i></td>
                </tr>
                <tr>
                    <td>Maipu</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(8)'></i></td>
                </tr>
                <tr>
                    <td>Cerrillos</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(9)'></i></td>
                </tr>
                <tr>
                    <td>Conchalí</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(10)'></i></td>
                </tr>
                <tr>
                    <td>Providencia</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(11)'></i></td>
                </tr>
                <tr>
                    <td>Ñuñoa</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(15)'></i></td>
                </tr>
                <tr>
                    <td>La Reina</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(16)'></i></td>
                </tr>
                <tr>
                    <td>Macul</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(17)'></i></td>
                </tr>
                <tr>
                    <td>Peñalolen</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(18)'></i></td>
                </tr>
                <tr>
                    <td>San Joaquin</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(19)'></i></td>
                </tr>
                <tr>
                    <td>La Granja</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(20)'></i></td>
                </tr>
                <tr>
                    <td>La Pintana</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(21)'></i></td>
                </tr>
                <tr>
                    <td>San Ramon</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(22)'></i></td>
                </tr>
                <tr>
                    <td>San Miguel</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(23)'></i></td>
                </tr>
                <tr>
                    <td>La Cisterna</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(24)'></i></td>
                </tr>
                <tr>
                    <td>Quinta Normal</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(25)'></i></td>
                </tr>
                <tr>
                    <td>Lo Prado</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(26)'></i></td>
                </tr>
                <tr>
                    <td>Pudahuel</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(27)'></i></td>
                </tr>
                <tr>
                    <td>Cerro Navia</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(28)'></i></td>
                </tr>
                <tr>
                    <td>Renca</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(29)'></i></td>
                </tr>
                <tr>
                    <td>Quilicura</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(30)'></i></td>
                </tr>
                <tr>
                    <td>Recoleta</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(31)'></i></td>
                </tr>
                <tr>
                    <td>Independencia</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(32)'></i></td>
                </tr>
                <tr>
                    <td>La Florida</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(33)'></i></td>
                </tr>
                <tr>
                    <td>Colina</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(298)'></i></td>
                </tr>
                <tr>
                    <td>Lampa</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(299)'></i></td>
                </tr>
                <tr>
                    <td>Tiltil</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(300)'></i></td>
                </tr>
                <tr>
                    <td>Puente Alto</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(301)'></i></td>
                </tr>
                <tr>
                    <td>Pirque</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(302)'></i></td>
                </tr>
                <tr>
                    <td>San Jose De Maipo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(303)'></i></td>
                </tr>
                <tr>
                    <td>San Bernardo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(304)'></i></td>
                </tr>
                <tr>
                    <td>Buin</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(305)'></i></td>
                </tr>
                <tr>
                    <td>Paine</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(306)'></i></td>
                </tr>
                <tr>
                    <td>Calera De Tango</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(307)'></i></td>
                </tr>
                <tr>
                    <td>Talagante</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(308)'></i></td>
                </tr>
                <tr>
                    <td>Peñaflor</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(309)'></i></td>
                </tr>
                <tr>
                    <td>El Monte</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(310)'></i></td>
                </tr>
                <tr>
                    <td>Isla De Maipo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(311)'></i></td>
                </tr>
                <tr>
                    <td>Melipilla</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(312)'></i></td>
                </tr>
                <tr>
                    <td>Maria Pinto</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(313)'></i></td>
                </tr>
                <tr>
                    <td>San Pedro</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(314)'></i></td>
                </tr>
                <tr>
                    <td>Curacavi</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(315)'></i></td>
                </tr>
                <tr>
                    <td>Alhué</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(316)'></i></td>
                </tr>
                <tr>
                    <td>Padre Hurtado</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(343)'></i></td>
                </tr>
                <tr>
                    <td>Chicureo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(348)'></i></td>
                </tr>
                <tr>
                    <td>Seleccione</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(0)'></i></td>
                </tr>
                <tr>
                    <td>Valparaíso</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(65)'></i></td>
                </tr>
                <tr>
                    <td>Viña Del Mar</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(66)'></i></td>
                </tr>
                <tr>
                    <td>Quintero</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(67)'></i></td>
                </tr>
                <tr>
                    <td>Quilpué</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(68)'></i></td>
                </tr>
                <tr>
                    <td>Villa Alemana</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(69)'></i></td>
                </tr>
                <tr>
                    <td>Casablanca</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(70)'></i></td>
                </tr>
                <tr>
                    <td>Puchuncaví</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(71)'></i></td>
                </tr>
                <tr>
                    <td>Juan Fernández</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(72)'></i></td>
                </tr>
                <tr>
                    <td>Quillota</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(73)'></i></td>
                </tr>
                <tr>
                    <td>La Cruz</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(74)'></i></td>
                </tr>
                <tr>
                    <td>Calera</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(75)'></i></td>
                </tr>
                <tr>
                    <td>Nogales</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(76)'></i></td>
                </tr>
                <tr>
                    <td>Hijuelas</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(77)'></i></td>
                </tr>
                <tr>
                    <td>Limache</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(78)'></i></td>
                </tr>
                <tr>
                    <td>Olmué</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(79)'></i></td>
                </tr>
                <tr>
                    <td>San Antonio</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(80)'></i></td>
                </tr>
                <tr>
                    <td>Cartagena</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(81)'></i></td>
                </tr>
                <tr>
                    <td>Santo Domingo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(82)'></i></td>
                </tr>
                <tr>
                    <td>El Tabo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(83)'></i></td>
                </tr>
                <tr>
                    <td>El Quisco</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(84)'></i></td>
                </tr>
                <tr>
                    <td>Algarrobo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(85)'></i></td>
                </tr>
                <tr>
                    <td>San Felipe</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(86)'></i></td>
                </tr>
                <tr>
                    <td>Panquehue</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(87)'></i></td>
                </tr>
                <tr>
                    <td>Putaendo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(88)'></i></td>
                </tr>
                <tr>
                    <td>Santa María</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(89)'></i></td>
                </tr>
                <tr>
                    <td>Catemu</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(90)'></i></td>
                </tr>
                <tr>
                    <td>Llaillay</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(91)'></i></td>
                </tr>
                <tr>
                    <td>Los Andes</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(92)'></i></td>
                </tr>
                <tr>
                    <td>San Esteban</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(93)'></i></td>
                </tr>
                <tr>
                    <td>Rinconada</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(94)'></i></td>
                </tr>
                <tr>
                    <td>Calle Larga</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(95)'></i></td>
                </tr>
                <tr>
                    <td>Petorca</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(96)'></i></td>
                </tr>
                <tr>
                    <td>La Ligua</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(97)'></i></td>
                </tr>
                <tr>
                    <td>Cabildo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(98)'></i></td>
                </tr>
                <tr>
                    <td>Zapallar</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(99)'></i></td>
                </tr>
                <tr>
                    <td>Papudo</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(100)'></i></td>
                </tr>
                <tr>
                    <td>Isla De Pascua</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(101)'></i></td>
                </tr>
                <tr>
                    <td>Concón</td>
                    <td><i class='fa fa-2x fa-user-plus' onclick='alert(338)'></i></td>
                </tr>
            </tbody>
        </table>

    </div>
    </form>
</body>
</html>
