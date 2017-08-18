<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InicioCliente.aspx.cs" Inherits="InicioCliente" %>

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
    <title>Inicio</title>
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
        
        function GetSelectedFieldValuesCallback(values) {
            //selList.BeginUpdate();
            try {
                //lblIdPack.SetText(values[0][0]);
                var valor = values[0];
                pnlGeneral.PerformCallback(valor);
            } finally {
                //selList.EndUpdate();
                //lblClienteSeleccionado.SetText('');
            }
            //document.getElementById("selCount").innerHTML = grid.GetSelectedRowCount();
        }
        function onClickCrearCodigo() {
            var url = "AceptaCondicionesf.aspx?ID_PACK=";
            if (lblIdPack.GetText() == '' || lblIdPack.GetText() == '0') {
                alert('No puede entrar hasta que seleccione un Pack del Listado.');
            }
            else {
                url = url + lblIdPack.GetText();
                location.href = url;
                //location.reload(true);
                //window.open(url);
            }
        }


    </script>
</head>
<body style="padding-bottom:60px; padding-top:40px;">
    <form id="form1" runat="server">
        <div class="container" style="padding-left:0; padding-right:0;">
            <header class="titulo-header">
                <nav class="navbar navbar-default navbar-fixed-top bg-rosa">
                    <div class="container">
                        <div class="col-xs-2 fa fa-search font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Búsqueda Código</h3>
                            <%--<h5>Profesor</h5>--%>
                            <h5>
                                Cliente</h5>
                        </div>
                    </div>
                </nav>

            </header>

            <dx:ASPxCallbackPanel ID="pnlGeneral" runat="server" ClientInstanceName="pnlGeneral" Width="100%" OnCallback="pnlGeneral_Callback">
                <ClientSideEvents BeginCallback="function(s, e) {
                    btnEntrar.SetEnabled(false);
	//alert('iniciar');
}" EndCallback="function(s, e) {
	//alert('terminar');
    btnEntrar.SetEnabled(true);
}" />
                <PanelCollection>
                    <dx:PanelContent runat="server">

                        <div class="col-xs-12 alert alert-info">
                            <p class="font-pequeno">
                                Ingrese el código proporcionado por la Supervisora y luego presione "Buscar".
                            </p>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <label>
                                Ingrese Código (*)
                                <dx:ASPxTextBox ID="txtCodigo" Native="true" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </label>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="col-xs-6" style="padding-top: 15px;">
                                <dx:ASPxButton runat="server" Text="Cancelar" ID="btnCancelar" CssClass="btn btn-warning" Native="true" Width="100%" OnClick="btnCancelar_Click"></dx:ASPxButton>
                            </div>
                            <div class="col-xs-6" style="padding-top: 15px;">
                                <dx:ASPxButton runat="server" Text="Buscar" ID="btnGuardar" AutoPostBack="False" CssClass="btn btn-primary" Native="True" Width="100%">
                                    <ClientSideEvents Click="function(s, e) {
                        grilla.PerformCallback(s.GetText());	
}" />
                                </dx:ASPxButton>
                            </div>



                        </div>
                        <div class="col-xs-12 alert alert-info">
                            <p class="font-pequeno">
                                Seleccione el Pack contratado y luego presione "Entrar".
                            </p>
                        </div>

                        <div class="col-xs-12">
                            <dx:ASPxGridView ID="grillaResultados" runat="server" AutoGenerateColumns="False" ClientInstanceName="grilla" DataSourceID="odsBusqueda" EnableTheming="True" OnCustomCallback="grillaResultados_CustomCallback" Theme="Moderno" Width="100%" KeyFieldName="Id">
                                <ClientSideEvents SelectionChanged="function(s, e) {
	s.GetSelectedFieldValues(&quot;Id&quot;,GetSelectedFieldValuesCallback); 
}" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings GridLines="None" ShowColumnHeaders="False" />
                                <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Texto" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Paddings Padding="0px" />
                                <Border BorderStyle="None" />
                            </dx:ASPxGridView>
                        </div>
                        <asp:ObjectDataSource ID="odsBusqueda" runat="server" SelectMethod="ObtenerProductoCodigoGrillaCliente" TypeName="SinAlitas.Admin.Negocio.ProductoCodigo">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtCodigo" DefaultValue="0-pack" Name="nombrePackP" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <div class="col-xs-12 col-md-6">
                            <dx:ASPxButton runat="server" Text="Entrar" ID="btnEntrar" ClientInstanceName="btnEntrar" CssClass="btn btn-primary" Native="True" Width="100%" AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	onClickCrearCodigo();
}" />
                            </dx:ASPxButton>
                        </div>

                        <dx:ASPxLabel ID="lblIdPack" ClientInstanceName="lblIdPack" ClientVisible="false" runat="server" Text="0"></dx:ASPxLabel>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    </form>
</body>
</html>
