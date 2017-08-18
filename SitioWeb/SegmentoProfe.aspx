<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SegmentoProfe.aspx.cs" Inherits="SegmentoProfe" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="CONTROLES/Mensaje.ascx" tagname="Mensaje" tagprefix="uc1" %>
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
    <title>Segmento</title>
    <link rel="shortcut icon" href="images/IconoMiFamilia.png"/>
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
        function PaginaMostrar(numero)
        {
            var url = "";
            if (numero == 'uno') {
                var idMes = lblIdMes.GetText();
                url = "ContenidoProfesor.aspx?ID_MES=" + idMes + "&ID_ANNO=" + lblIdAnno.GetText();

                location.href = url;
            }
            if (numero == 'tres') {
                url = "TareasProfesor.aspx";

                location.href = url;
            }
            if (numero == 'cinco') {
                url = "CalificacionesProfesor.aspx";

                location.href = url;
            }
        }
    </script>


</head>
<body style="padding-bottom:60px; padding-top:60px;">
    <form id="form1" runat="server">
        <div class="container" style="padding-left:0; padding-right:0;">
            <dx:ASPxLabel ID="lblIdMes" ClientInstanceName="lblIdMes" runat="server" Text="" ClientVisible="false"></dx:ASPxLabel>
            <dx:ASPxLabel ID="lblIdAnno" ClientInstanceName="lblIdAnno" runat="server" Text="" ClientVisible="false"></dx:ASPxLabel>

            <!-- este es el menu inferior con las opciones del profesor -->
            <nav class="navbar navbar-principal-profe navbar-fixed-bottom">
                <div class="col-xs-12 container-footer">
                    <%--<div class="col-xs-1"></div>--%>
                    <div id="iconoHome" class="col-xs-2 glyphicon glyphicon-calendar font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" onclick="PaginaMostrar('uno')">
                     <%--  <dx:ASPxHyperLink ID="hlVolver2" runat="server" Text="" >
                                    <Border BorderStyle="None" />
                                </dx:ASPxHyperLink>--%>
                    </div>

                    <div id="iconoCitas" class="col-xs-2 glyphicon glyphicon-time active-navbar-profe font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true">
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


                </div>
            </nav>
            <%--<uc1:encabezado runat="server" id="Encabezado" />--%>
            <header class="titulo-header">
                <nav class="navbar navbar-default-profe navbar-fixed-top bg-rosa">
                    <div class="container">
                        <div class="col-xs-2 glyphicon glyphicon-time font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Horas</h3>
                            <%--<h5>Profesor</h5>--%>
                            <h5>
                                <asp:Literal ID="litNombreUsuario" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                </nav>

            </header>

            <dx:ASPxCallbackPanel ID="pnlPrincipal" ClientInstanceName="pnlPrincipal" runat="server" Width="100%" OnCallback="pnlPrincipal_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <!-- titulo -->
                        <div class="col-xs-12 bg-white">
                            <div class="col-xs-2">
<%--                                <dx:ASPxHyperLink ID="hlVolver" runat="server" Text="Volver" ImageUrl="~/img/atras.png" ImageWidth="30px">
                                    <Border BorderStyle="None" />
                                </dx:ASPxHyperLink>--%>
                            </div>
                            <span class="col-xs-10 titulo">
                                <asp:Literal ID="litFecha" runat="server"></asp:Literal>
                            </span>
                            

                        </div>

                        <!-- info -->
                        <div class="col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a data-toggle="collapse" id="accordion" href="#panel1">Información </a><i class="fa fa-info-circle pull-right"></i>

                                </div>
                                <div class="panel-body collapse" data-toggle="collapse" data-parent="#accordion" id="panel1">
                                    <div class="col-xs-12 margin-bottom-0">
                                        <i class="fa fa-2x fa-info-circle pull-left"></i>

                                        <span class="font-pequeno">Debe Seleccionar o Deseleccionar el cupo que desea agregar o quitar, si el check no está disponible mire la información del cupo.</span>


                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 border-top-double-burlywood">
                            <dx:ASPxDataView ID="ASPxDataView1" runat="server" Width="100%" AllowPaging="False" AlwaysShowPager="True" DataSourceID="odsSegmentos" Border-BorderStyle="None" Border-BorderWidth="0" BackColor="Transparent" Height="100%" ItemSpacing="0px">
                                <SettingsFlowLayout ItemsPerPage="1" />
                                <SettingsTableLayout ColumnCount="1" RowsPerPage="100" />
                                <PagerSettings ShowNumericButtons="False"></PagerSettings>
                                <ItemTemplate>
                                    <div class='<%# Eval("ClaseBorde", "{0}")%>'>
                                        
                                        <div class="col-xs-9 col-md-11 no-padding">
                                            <div class="col-xs-3 col-lg-4 size-18 text-center fg-white pointer">
                                               <span class="badge"><%# Eval("HoraInicio", "{0}")%></span>
                                                <span class="badge"><%# Eval("HoraTermino", "{0}")%></span>
                                            </div>
                                            <div class="col-xs-9 col-lg-9">
                                                <div class="col-xs-12">
                                                    <i class=" fa fa-info"></i>
                                                    <span class="font-pequeno"><%# Eval("Comentario", "{0}")%></span>
                                                </div>
                                                <div class="col-xs-12">
                                                    <%--<i class="fi-torso-business"></i>--%>
                                                    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="" CssClass="fi-torso-business" ClientVisible='<%# Eval("NombreClienteVisible")%>'>
                                                    </dx:ASPxHyperLink>
                                                    <span class="font-pequeno"><%# Eval("NombreCliente", "{0}")%></span>
                                                </div>
                                                <div class="col-xs-12">
                                                    <%--<i class="fi-mail"></i>--%>
                                                    <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Text="" CssClass="fi-mail" ClientVisible='<%# Eval("EmailClienteVisible")%>'>
                                                    </dx:ASPxHyperLink>
                                                    <span class="font-pequeno"><%# Eval("CorreoCliente", "{0}")%></span>
                                                &nbsp
                                                    <%--<i class="fi-telephone"></i>--%>
                                                    <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Text="" CssClass="fi-telephone" ClientVisible='<%# Eval("TelefonoClienteVisible")%>'>
                                                    </dx:ASPxHyperLink>
                                                    <span class="font-pequeno"><%# Eval("TelefonosCliente", "{0}")%></span>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- botones -->
                                        <div class="col-xs-3 col-md-1 no-padding-right">

                                            <div class="col-xs-6 col-lg-3 size-18 text-center pointer bg-transparent">
                                                <dx:ASPxCheckBox ID="chkSeleccione" runat="server" Width="100%" Font-Size="X-Large" ClientVisible='<%# Eval("EsDisponible")%>' Checked='<%# Eval("EsSeleccionado")%>' BackColor="Transparent" CheckBoxStyle-BackColor="Transparent">
                                                    <CheckedImage Url="img/Checked Checkbox-50.png" Width="50px" Height="50px">
                                                    </CheckedImage>
                                                    <UncheckedImage Url="img/Unchecked Checkbox-50.png" Width="50px" Height="50px">
                                                    </UncheckedImage>
                                                    <GrayedImage Url="img/Checked Checkbox-50.png" Width="50px" Height="50px">
                                                    </GrayedImage>

                                                </dx:ASPxCheckBox>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <Paddings Padding="0px" />
                                <ContentStyle Border-BorderStyle="None" Border-BorderWidth="0" BackColor="Transparent">
                                    <Paddings Padding="0px" />

<Border BorderStyle="None" BorderWidth="0px"></Border>
                                </ContentStyle>
                                <ItemStyle Height="100%" BackColor="Transparent">
                                    <Paddings Padding="0px" />
                                <Border BorderStyle="None" BorderWidth="0px" />
                                </ItemStyle>

                                <PagerStyle>
                                <Border BorderStyle="None" />
                                </PagerStyle>

<Border BorderStyle="None" BorderWidth="0px"></Border>
                                <BorderLeft BorderStyle="None" />
                                <BorderTop BorderStyle="None" />
                                <BorderRight BorderStyle="None" />
                                <BorderBottom BorderStyle="None" />
                            </dx:ASPxDataView>
                            <asp:ObjectDataSource ID="odsSegmentos" runat="server" SelectMethod="BuscarSegmentoPorFechaNuevo" TypeName="SinAlitas.Admin.Negocio.SegmentoHorario">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="fechaEntera" QueryStringField="FECHA" Type="Int32" />
                                    <asp:QueryStringParameter DefaultValue="0" Name="nodId" QueryStringField="NOD_ID" Type="Int32" />
                                    <asp:QueryStringParameter DefaultValue="0" Name="profId" QueryStringField="PROF_ID" Type="Int32" />
                                    <asp:QueryStringParameter DefaultValue="1" Name="esBloquedo" QueryStringField="BLOQUEAR" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                        <div class="small-12 columns">
                            
                            <uc1:Mensaje ID="Mensaje1" runat="server" />
                        </div>
                        <div class="small-10 columns left">
                            <div class="pull-2 columns"></div>
                            <div class="small-10 medium-8 columns">
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="button alert" Width="100%" Native="true" AutoPostBack="false">
                                    <ClientSideEvents Click="function(s, e) {
	pnlPrincipal.PerformCallback('guardar');
}" />
                                </dx:ASPxButton></div>

                        </div>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

        </div>
            <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    </form>
</body>
</html>
