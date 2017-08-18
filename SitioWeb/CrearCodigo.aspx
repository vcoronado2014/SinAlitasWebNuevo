<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CrearCodigo.aspx.cs" Inherits="CrearCodigo" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/CONTROLES/Encabezado.ascx" TagPrefix="uc1" TagName="Encabezado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="description" content="."/>
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development"/>
    <meta name="author" content="Victor Coronado"/>
    <title>Crear Codigo</title>
    <link rel="stylesheet" href="css/foundation.min.css" />
    <link rel="stylesheet" href="css/foundation-icons.css" />
    <link rel="stylesheet" href="css/personalizado.css" />
    <script src="js/vendor/modernizr.js"></script>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/foundation.min.js"></script>
    <script src="js/foundation/foundation.accordion.js"></script>
    

    <script type="text/javascript">
        $(document).ready(function () {
            console.log("ready!");
            $(document).foundation({
                accordion: {
                    // specify the class used for accordion panels
                    content_class: 'content',
                    // specify the class used for active (or open) accordion panels
                    active_class: 'active',
                    // allow multiple accordion panels to be active at the same time
                    multi_expand: true,
                    // allow accordion panels to be closed by clicking on their headers
                    // setting to false only closes accordion panels when another is opened
                    toggleable: true
                }
            });
                $('#myAccordion').on('toggled', function (event, accordion) {
                    console.log(accordion);
                    var flecha = $('#flecha');
                    if (accordion[0].className == 'content') {
                        flecha.removeClass('fi-arrow-up');
                        flecha.addClass('fi-arrow-down');
                        //alert('flecha abajo');
                    }
                    else
                    {
                        flecha.removeClass('fi-arrow-down');
                        flecha.addClass('fi-arrow-up');
                        //alert('flecha arriba');
                    }
                });
        });
        function Limpiar() 
        {
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
        function onClickCrearCodigo()
        {
            var url = "CreaCodigo1.aspx?ID_CLIENTE=";
            if (lblClieIdSeleccionado.GetText() == '')
            {
                alert('No puede crear código si no ha seleccionado un Cliente.');
            }
            else
            {
                url = url + lblClieIdSeleccionado.GetText();
                location.href = url;
                //location.reload(true);
                //window.open(url);
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="contained">
            <uc1:Encabezado runat="server" ID="Encabezado" />

            <div class="small-12 columns"> <i class="fi-magnifying-glass"></i> <span class="titulo"> Búsqueda de Cliente</span></div>
            <div class="small-12 columns panel">
                <div class="small-3 medium-2 columns">
                    <dx:ASPxLabel ID="lblNombre" runat="server" Text="Nombre"></dx:ASPxLabel>
                </div>
                <div class="small-9 medium-4 columns">
                    <dx:ASPxTextBox ID="txtNombreBuscar" ClientInstanceName="txtNombreBuscar" runat="server" Width="100%" Native="true">
                        <ValidationSettings ErrorDisplayMode="None" Display="None">
                            <RequiredField IsRequired="True" ErrorText="El Nombre es requerido" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="small-3 medium-2 columns">
                    <dx:ASPxLabel ID="lblApellidoBuscar" runat="server" Text="Apellido"></dx:ASPxLabel>
                </div>
                <div class="small-9 medium-4 columns">
                    <dx:ASPxTextBox ID="txtApellidoBuscar" ClientInstanceName="txtApellidoBuscar" runat="server" Width="100%" Native="true">
                        <ValidationSettings ErrorDisplayMode="None" Display="None">
                            <RequiredField IsRequired="True" ErrorText="El Primer Apellido es requerido." />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="small-12 columns text-center">
                    <dx:ASPxValidationSummary ID="ASPxValidationSummary1" CssClass="small-12 medium-10 columns" runat="server" VerticalAlign="Middle" Width="100%" BackColor="Transparent">
                        <Paddings Padding="0px" />
                        <ErrorStyle>
                        <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px" />
                        </ErrorStyle>
                        <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px" />
                    </dx:ASPxValidationSummary>
                </div>
                
                
            </div>

            <div class="small-12 columns" style="padding-left:2px;">
                <div class="small-3 columns"  style="padding: 0;">
                    <dx:ASPxButton runat="server" Text="Volver" ID="btnCancelar" CssClass="button small warning" Native="true" Width="100%" CausesValidation="False" OnClick="btnCancelar_Click"></dx:ASPxButton>
                </div>
                <div class="small-3 columns">
                    <dx:ASPxButton ID="btnCrearCliente" runat="server" Text="Crear" Native="True" CssClass="button small alert" CausesValidation="False" OnClick="btnCrearCliente_Click"></dx:ASPxButton>
                </div>
                <div class="small-3 columns">
                    <dx:ASPxButton ID="btnLimpiar" runat="server" Text="Limpiar" Native="True" CssClass="button small warning" AutoPostBack="False" CausesValidation="False">
                        <ClientSideEvents Click="function(s, e) {
	Limpiar();
}" />
                    </dx:ASPxButton>
                </div>
                <div class="small-3 columns">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Native="True" CssClass="button small" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
	grilla.PerformCallback();
}" />
                    </dx:ASPxButton>
                </div>
            </div>
            <div class="small-12 columns">
                <div class="small-12 columns destacado-azul"> 
                    <p class="font-pequeno">
                        Si el Cliente fué encontrado, seleccionelo del listado y luego presione el botón siguiente. Si no es así presione el botón Crear Cliente.
                    </p>
                </div>
                <dx:ASPxGridView ID="grillaResultados" runat="server" AutoGenerateColumns="False" ClientInstanceName="grilla" DataSourceID="ObjectDataSource1" EnableTheming="True" OnCustomCallback="grillaResultados_CustomCallback" Theme="Moderno" Width="100%" KeyFieldName="Id">
                    <ClientSideEvents SelectionChanged="function(s, e) {
	s.GetSelectedFieldValues(&quot;NombreFormateado;Id&quot;,GetSelectedFieldValuesCallback); 
}" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings GridLines="None" ShowColumnHeaders="False" />
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NombreFormateado" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Comuna" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Paddings Padding="0px" />
                    <Border BorderStyle="None" />
                </dx:ASPxGridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ObtenerClientesPorNombreYApellidoLiviano" TypeName="SinAlitas.Admin.Negocio.Cliente">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblNombre" Name="nombre" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtApellidoBuscar" Name="apellidoPaterno" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <div class="small-12 columns destacado-burlywood">
                    <div class="small-10 columns">
                        <p class="font-pequeno text-justify">
                            Cliente Seleccionado:
                            <dx:ASPxLabel ID="lblClienteSeleccionado" runat="server" Text="" ClientInstanceName="lblClienteSeleccionado"></dx:ASPxLabel>
                            <dx:ASPxLabel ID="lblClieIdSeleccionado" runat="server" Text="" ClientInstanceName="lblClieIdSeleccionado" ClientVisible ="false"></dx:ASPxLabel>
                        </p>
                    </div>
                    <div class="small-10 columns">
                        <dx:ASPxButton ID="btnCrearCodigo" runat="server" Text="Crear Código" Native="True" CssClass="button secondary fg-white" CausesValidation="False" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	onClickCrearCodigo();
}" />

                        </dx:ASPxButton>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
