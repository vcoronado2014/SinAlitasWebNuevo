<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReservarHorasCliente.aspx.cs" Inherits="ReservarHorasCliente" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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
        function Abrir(param, param1)
        {
            panelPrincipal.PerformCallback(param + '|' + param1);
            //popupAgenda.Show();
            //$('#myModal').modal('show');
            //alert(param + ' ' + param1);
        }
        function Abrir(param) {
            //panelPrincipal.PerformCallback(param + '|' + param1);
            alert(param + ' abrir las horas del profesor');
            //popupAgenda.Show();
            //$('#myModal').modal('show');
            //alert(param + ' ' + param1);
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
        function Limpiar(item)
        {
            //alert(item);
            if (item == 'rptCupos_rpPrincipal_0_listBoxCupos_0')
            {
                var indice = rptCupos_rpPrincipal_0_listBoxCupos_0.GetSelectedIndex();
                if (indice >= 0)
                    rptCupos_rpPrincipal_0_listBoxCupos_0.SetSelectedIndex(-1);
            }
            if (item == 'rptCupos_rpPrincipal_1_listBoxCupos_1') {
                var indice = rptCupos_rpPrincipal_1_listBoxCupos_1.GetSelectedIndex();
                if (indice >= 0)
                    rptCupos_rpPrincipal_1_listBoxCupos_1.SetSelectedIndex(-1);
            }
            if (item == 'rptCupos_rpPrincipal_2_listBoxCupos_2') {
                var indice = rptCupos_rpPrincipal_2_listBoxCupos_2.GetSelectedIndex();
                if (indice >= 0)
                    rptCupos_rpPrincipal_2_listBoxCupos_2.SetSelectedIndex(-1);
            }
            if (item == 'rptCupos_rpPrincipal_3_listBoxCupos_3') {
                var indice = rptCupos_rpPrincipal_3_listBoxCupos_3.GetSelectedIndex();
                if (indice >= 0)
                    rptCupos_rpPrincipal_3_listBoxCupos_3.SetSelectedIndex(-1);
            }
            if (item == 'rptCupos_rpPrincipal_4_listBoxCupos_4') {
                var indice = rptCupos_rpPrincipal_4_listBoxCupos_4.GetSelectedIndex();
                if (indice >= 0)
                    rptCupos_rpPrincipal_4_listBoxCupos_4.SetSelectedIndex(-1);
            }
            if (item == 'rptCupos_rpPrincipal_5_listBoxCupos_5') {
                var indice = rptCupos_rpPrincipal_5_listBoxCupos_5.GetSelectedIndex();
                if (indice >= 0)
                    rptCupos_rpPrincipal_5_listBoxCupos_5.SetSelectedIndex(-1);
            }
            if (item == 'rptCupos_rpPrincipal_6_listBoxCupos_6') {
                var indice = rptCupos_rpPrincipal_6_listBoxCupos_6.GetSelectedIndex();
                if (indice >= 0)
                    rptCupos_rpPrincipal_6_listBoxCupos_6.SetSelectedIndex(-1);
            }
            if (item == 'rptCupos_rpPrincipal_7_listBoxCupos_7') {
                var indice = rptCupos_rpPrincipal_7_listBoxCupos_7.GetSelectedIndex();
                if (indice >= 0)
                    rptCupos_rpPrincipal_7_listBoxCupos_7.SetSelectedIndex(-1);
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
                        <h5>Horas del Profesor</h5>
                    </div>
                </div>
            </nav>

        </header>


        <dx:ASPxCallbackPanel ID="pnlPrincipal" runat="server" Width="100%" ClientInstanceName="pnlPrincipal" OnCallback="pnlPrincipal_Callback">
            <PanelCollection>
                <dx:PanelContent runat="server">
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
                        <div class="col-xs-12">
                        </div>
                        <div class="col-xs-12 no-padding" style="margin-left: 10px;" id="accordion">
                            <span class="badge" style="color: white;">Clases Disponibles</span>
                            <asp:Repeater ID="rptCupos" runat="server" OnItemDataBound="rptCupos_ItemDataBound">
                                <ItemTemplate>
                                    <dx:ASPxRoundPanel ID="rpPrincipal" runat="server" AllowCollapsingByHeaderClick="True" Theme="Mulberry" ShowCollapseButton="true" Width="95%" HeaderText='<%# Eval("FechaLetras", "{0}")%>' Collapsed='<%# (bool)(DataBinder.Eval(Container.DataItem, "Colapsado")) %>'>
                                        <HeaderStyle Font-Bold="True" />
                                        <ContentPaddings Padding="0" />
                                        <PanelCollection>
                                            <dx:PanelContent runat="server">
                                                <dx:ASPxRadioButtonList Border-BorderStyle="None" ID="listBoxCupos" runat="server" ValueType="System.String" TextField="TextoMostrar" ValueField="Cupo.Id" Width="100%" Height="120PX" Theme="Mulberry" RepeatColumns="2"></dx:ASPxRadioButtonList>
                                                <div class="col-xs-12 text-right"><a onclick="Limpiar('<%# Eval("NombreListBox", "{0}")%>')">Limpiar</a></div>

                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxRoundPanel>



                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                        <!-- mensaje -->
                        <div class="col-xs-12">

                            <uc1:MensajeBoostrap ID="MensajeBoostrap1" runat="server" />

                        </div>

                        <div class="col-xs-12">
                            <div class="col-xs-6">
                                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Volver" Width="100%" Native="true" CssClass="btn btn-warning" OnClick="btnCancelar_Click">
                                </dx:ASPxButton>
                            </div>
                            <div class="col-xs-6">

                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Width="100%" Native="true" CssClass="btn btn-primary" AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
	pnlPrincipal.PerformCallback('guardar');
}" />
                                </dx:ASPxButton>

                            </div>

                        </div>
                    </section>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>




    </div>
    </form>

</body>
</html>
