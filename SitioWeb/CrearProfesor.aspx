<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CrearProfesor.aspx.cs" Inherits="CrearProfesor" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/CONTROLES/Encabezado.ascx" TagPrefix="uc1" TagName="Encabezado" %>





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
    <title>Crear Profesor</title>
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
            $('#example_1').DataTable({
                select: {
                    style: 'single'
                },
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

        function FocusedRowChangedAsociadas() {
            grillaAsociadas.GetRowValues(grillaAsociadas.GetFocusedRowIndex(), 'Id;Nombre', OnGetRowValuesAsociadas);
        }
        function OnGetRowValuesAsociadas(Value) {
            if(confirm('¿Está seguro de quitar la comuna ' + Value[1] + ' a este Profesor?'))
            {
                //enviar el item a guardar
                pnlPrincipal.PerformCallback('quita;' + Value[0]);
                //grillaAsociadas.PerformCallback(Value[0]);
            }

        }
        function FocusedRowChangedNoAsociadas() {
            grillaNoAsociadas.GetRowValues(grillaNoAsociadas.GetFocusedRowIndex(), 'Id;Nombre', OnGetRowValuesNoAsociadas);
        }
        function OnGetRowValuesNoAsociadas(Value) {
            if (confirm('¿Está seguro de agregar la comuna ' + Value[1] + ' a este Profesor?')) {
                //enviar el item a guardar
                pnlPrincipal.PerformCallback('agrega;' + Value[0]);
                //grillaAsociadas.PerformCallback(Value[0]);
            }

        }

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
        <section id="uno">
            <header class="titulo-header">
                <nav class="navbar navbar-default-supervisor navbar-fixed-top bg-rosa">
                    <div class="container">
                        <div class="col-xs-2 fa fa-angellist font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Crear/Modificar Profesor</h3>
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
                        <div class="col-xs-12">
                            <div class="col-xs-12">
                                <div class="col-xs-12 text-center bg-primary">
                                    <h5>Datos del Profesor</h5>
                                    </div>
                            <div class="col-md-2 col-xs-12">
                                Rut (ej.12541987-K)
                                 <dx:ASPxTextBox ID="txtRut" ClientInstanceName="txtRut" Native="true" runat="server" Width="100%" Theme="Mulberry" MaxLength="10">
                                     <ValidationSettings Display="None">
                                         <RequiredField IsRequired="True" />
                                     </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                            <div class="col-md-5 col-xs-12">
                                Nombres
                                <dx:ASPxTextBox ID="txtNombres" ClientInstanceName="txtNombres" Native="true" runat="server" Width="100%" Theme="Mulberry">
                                    <ValidationSettings Display="None">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                           <div class="col-md-5 col-xs-12">
                                Primer Apellido
                                <dx:ASPxTextBox ID="txtPrimerApellido" ClientInstanceName="txtPrimerApellido" Native="true" runat="server" Width="100%" Theme="Mulberry">
                                    <ValidationSettings Display="None">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                            <div class="col-md-3 col-xs-12">
                                Segundo Apellido
                                <dx:ASPxTextBox ID="txtSegundorApellido" ClientInstanceName="txtSegundorApellido" Native="true" runat="server" Width="100%" Theme="Mulberry"></dx:ASPxTextBox>
                            </div>
                            <div class="col-md-3 col-xs-12">
                                Sexo
                                <dx:ASPxComboBox ID="cmbSexo" Native="true" Width="100%" Height="28px" Theme="Mulberry" runat="server" ValueType="System.String" SelectedIndex="0">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Masculino" Value="Masculino" />
                                        <dx:ListEditItem Text="Femenino" Value="Femenino" />
                                    </Items>
                                </dx:ASPxComboBox>
                                
                            </div>
                            <div class="col-md-3 col-xs-12">
                                Teléfono (ejemplo 56985556987)
                                <dx:ASPxTextBox ID="txtTelefono" ClientInstanceName="txtTelefono" Native="true" runat="server" Width="100%" Theme="Mulberry" MaxLength="11">
                                    <ValidationSettings Display="None">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                            <div class="col-md-3 col-xs-12">
                                Email
                                <dx:ASPxTextBox ID="txtEmail" ClientInstanceName="txtEmail" Native="true" runat="server" Width="100%" Theme="Mulberry">
                                    <ValidationSettings Display="None">
                                        <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </div>
                                <hr style="width:100%;" />
                                <div class="col-xs-12">
                                    <uc2:MensajeBoostrap ID="MensajeBoostrap1" runat="server" />
                                </div>
                                <hr style="width:100%;" />
                                <!-- botones -->
                                <div class="col-xs-12 padding-top-bottom-10" style ="padding-top:10px;">
                                    <div class="col-xs-6">
                                        <!-- boton -->
                                        <asp:Button ID="btnVolver" runat="server" Text="Cancelar" CssClass="btn btn-warning" OnClick="btnVolver_Click" Width="100%"  />
<%--                                        <dx:ASPxButton runat="server" Text="Cancelar" ID="btnCancelar" CssClass="btn btn-warning" Native="true" Width="100%" OnClick="btnCancelar_Click" PostBackUrl="~/ListarProfesores.aspx"></dx:ASPxButton>--%>
                                    </div>
                                    <div class="col-xs-6">
                                        <!-- boton -->
                                        <dx:ASPxButton runat="server" Text="Guardar" ID="btnGuardar" AutoPostBack="false" CssClass="btn btn-success" Native="true" Width="100%">
                                            <ClientSideEvents Click="function(s, e) {
                        pnlPrincipal.PerformCallback('GUARDAR');	
}" />
                                        </dx:ASPxButton>
                                    </div>

                                </div>

                                

                                </div>
                            <div class="col-xs-12 col-md-6" style="margin-top:25px;padding:1px;">
                                <div class="col-xs-12 no-footer text-center bg-primary" style="margin-bottom:15px;">
                                    <div class="col-xs-9"><h5> Listado de Comunas Asociadas</h5></div>
                                    <div class="col-xs-2 cursor-pointer" onclick="FocusedRowChangedAsociadas()"><i class="fa fa-3x fa-angle-double-right pull-right"></i></div>
                                </div>

<%--                               <table id="example" class="display" cellspacing="0" width="100%">
                                   <asp:Literal ID="litContenidoTablaAsociada" runat="server"></asp:Literal>
                                </table>--%>
                               
                                <dx:ASPxGridView ID="grillaAsociadas" runat="server" AutoGenerateColumns="False" ClientInstanceName="grillaAsociadas" DataSourceID="odsComunasAsociadas" Width="100%" Theme="Mulberry" KeyFieldName="Id">
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsSearchPanel Visible="True" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="RegId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <Styles>
                                        <SelectedRow BackColor="Silver">
                                        </SelectedRow>
                                    </Styles>
                                    <Border BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                </dx:ASPxGridView>
                                <asp:ObjectDataSource ID="odsComunasAsociadas" runat="server" SelectMethod="ObtenerComunasProfesorAsociadasLista" TypeName="SinAlitas.Admin.Negocio.CrudProfesores">
                                    <SelectParameters>
                                        <asp:Parameter Name="idComunas" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                               
                            </div>
                            <div class="col-xs-12 col-md-6" style="margin-top: 25px;padding:1px;">
                                <div class="col-xs-12 no-footer text-center bg-primary" style="margin-bottom: 15px;">
                                    
                                    <div class="col-xs-2 cursor-pointer" onclick="FocusedRowChangedNoAsociadas()"><i class="fa fa-3x fa-angle-double-left pull-left"></i></div>
                                    <div class="col-xs-9"><h5> Listado de Comunas NO Asociadas</h5></div>
                                </div>
 <%--                               <table id="example_1" class="display" cellspacing="0" width="100%">
                                    <asp:Literal ID="litContenidoTablaNOAsociada" runat="server"></asp:Literal>
                                </table>--%>

                                <dx:ASPxGridView ID="grillaNoAsociadas" runat="server" AutoGenerateColumns="False" ClientInstanceName="grillaNoAsociadas"  KeyFieldName="Id" Theme="Mulberry" Width="100%" DataSourceID="odsNoAsociadas">
                                    <SettingsPager NumericButtonCount="2" Position="Top">
                                        <Summary AllPagesText="Pag: {0} - {1} ({2} items)" Position="Inside" Text="Pag {0} of {1} ({2} items)" />
                                    </SettingsPager>
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsSearchPanel Visible="True" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="RegId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <Styles>
                                        <SelectedRow BackColor="Silver">
                                        </SelectedRow>
                                    </Styles>
                                    <Border BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                </dx:ASPxGridView>

                                <asp:ObjectDataSource ID="odsNoAsociadas" runat="server" SelectMethod="ObtenerComunasProfesorNOAsignadasLista" TypeName="SinAlitas.Admin.Negocio.CrudProfesores">
                                    <SelectParameters>
                                        <asp:Parameter Name="idComunas" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>

                            </div>
                        </div>
     

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

            
        </section>


    </div>
    </form>
</body>
</html>
