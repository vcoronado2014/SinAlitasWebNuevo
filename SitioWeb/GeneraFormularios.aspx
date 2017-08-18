<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GeneraFormularios.aspx.cs" Inherits="GeneraFormularios" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

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

</head>
<body style="padding-bottom:90px; padding-top:60px;">
    <form id="form1" runat="server">
        <div id="wrapper" class="container" style="padding-left:0; padding-right:0;">
            <!-- encabezado -->

            <header class="titulo-header">
                <nav class="navbar navbar-default navbar-fixed-top bg-rosa">
                    <div class="container">
                        <div class="col-xs-2 fa fa-search font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                        </div>
                        <div class="col-xs-10 titulo-header">
                            <h3>Crear Fichas</h3>
                            <%--<h5>Profesor</h5>--%>
                            <h5>
                                Cliente</h5>
                        </div>
                    </div>
                </nav>

            </header>



            <!-- contenido -->
            <div class="page-wrapper">

                <dx:ASPxCallbackPanel ID="pnlPrincipal" ClientInstanceName="pnlPrincipal" runat="server" Width="100%" OnCallback="pnlPrincipal_Callback">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <!-- listado de alumnos del cliente -->
                            <div class="col-xs-12">


                            </div>


                            <div class="col-xs-12" id ="accordion">
                                <asp:Repeater ID="rptAlumnos" runat="server">
                                    <ItemTemplate>
                                        <div class="col-xs-12" style="padding: 0;">
                                            <div class="panel panel-default" style="margin-bottom:5px;">
                                                <div class="panel-heading">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#<%# Eval("Id", "{0}")%>">
                                                        <h6>Alumno Nro. <%# Eval("Id", "{0}")%></h6>
                                                    </a>
                                                </div>
                                                <div style="padding: 0; margin-bottom:5px;" class='<%# Eval("EstiloItem", "{0}")%>' id='<%# Eval("Id", "{0}")%>'>
                                                    <!-- aca va el estilo item -->

                                                    <div class="col-xs-12 col-md-4 no-padding">
                                                        <h5 class="col-xs-12"><a class="fa fa-info-circle"></a> Datos Básicos</h5>
                                                        <div class="col-xs-12">
                                                            <label class="font-pequeno" for="txtNombres">Nombre (*)</label>
                                                            <dx:ASPxTextBox ID="txtNombres" Native="true" runat="server" Width="100%" CssClass="text-box">
                                                                <ValidationSettings CausesValidation="True" ValidationGroup="prueba"></ValidationSettings>
                                                                <InvalidStyle BackColor="LightPink" />
                                                            </dx:ASPxTextBox>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label class="font-pequeno" for="txtEdad">Edad (*)</label>
                                                            <dx:ASPxTextBox ID="txtEdad" Native="true" runat="server" Width="100%" CssClass="text-box">
                                                                <MaskSettings Mask="&lt;1..100&gt;" />
                                                                <ValidationSettings CausesValidation="True" ValidationGroup="prueba"></ValidationSettings>
                                                                <InvalidStyle BackColor="LightPink" />
                                                            </dx:ASPxTextBox>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label class="font-pequeno" for="cmbSexo">Sexo</label>
                                                            <dx:ASPxComboBox ID="cmbSexo" runat="server" Width="100%" Native="True" SelectedIndex="0" Theme="Moderno" Height="26px">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Hombre" Value="Hombre" />
                                                                    <dx:ListEditItem Text="Mujer" Value="Mujer" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="col-xs-12 col-md-4 no-padding">
                                                        <h5 class="col-xs-12"><a class="fa fa-medkit"></a> Datos Médicos</h5>
                                                        <div class="col-xs-12">
                                                            <div class="col-xs-12">
                                                                <label class="font-pequeno">¿Tiene problemas motores?</label>
                                                            </div>
                                                            <div class="col-xs-3">
                                                                <dx:ASPxComboBox ID="cmbProblemasMotores" runat="server" Width="100%" Native="True" SelectedIndex="0" Theme="Moderno" Height="26px">
                                                                    <Items>
                                                                        <dx:ListEditItem Selected="True" Text="No" Value="0" />
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                    </Items>
                                                                </dx:ASPxComboBox>
                                                            </div>
                                                            <div class="col-xs-9">
                                                                <dx:ASPxTextBox ID="txtProblemasMotores" ClientInstanceName="txtProblemasMotores" Native="true" runat="server" Width="100%" CssClass="text-box"></dx:ASPxTextBox>
                                                            </div>

                                                            <div class="col-xs-12">
                                                                <label class="font-pequeno">¿Tiene problemas cardiacos?</label>
                                                            </div>
                                                            <div class="col-xs-3">
                                                                <dx:ASPxComboBox ID="cmbProblemasCardiacos" runat="server" Width="100%" Native="True" SelectedIndex="0" Theme="Moderno" Height="26px">
                                                                    <Items>
                                                                        <dx:ListEditItem Selected="True" Text="No" Value="0" />
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                    </Items>
                                                                </dx:ASPxComboBox>
                                                            </div>
                                                            <div class="col-xs-9">
                                                                <dx:ASPxTextBox ID="txtProblemasCardiacos" ClientInstanceName="txtProblemasCardiacos" Native="true" runat="server" Width="100%" CssClass="text-box"></dx:ASPxTextBox>
                                                            </div>

                                                            <div class="col-xs-3">
                                                                <label class="font-pequeno">¿Asma?</label>
                                                                <dx:ASPxComboBox ID="cmbAsma" runat="server" Width="100%" Native="True" SelectedIndex="0" Theme="Moderno" Height="26px">
                                                                    <Items>
                                                                        <dx:ListEditItem Selected="True" Text="No" Value="0" />
                                                                        <dx:ListEditItem Text="Si" Value="1" />
                                                                    </Items>
                                                                </dx:ASPxComboBox>
                                                            </div>
                                                            <div class="col-xs-9">
                                                                <label class="font-pequeno">Otro</label>
                                                                <dx:ASPxTextBox ID="txtOtro" ClientInstanceName="txtOtro" Native="true" runat="server" Width="100%" CssClass="text-box"></dx:ASPxTextBox>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <hr />
                                                    <div class="col-xs-12 col-md-4 no-padding">
                                                        <h5 class="col-xs-12"><a class="fa fa-user"></a> Datos Contacto</h5>
                                                        <div class="col-xs-12">
                                                            <label class="font-pequeno">Número Telefónico</label>
                                                            <dx:ASPxTextBox ID="txtNumero" ClientInstanceName="txtNumero" Native="true" runat="server" Width="100%" CssClass="text-box">
                                                                <MaskSettings Mask="000000000" />
                                                                <ValidationSettings CausesValidation="True" ValidationGroup="prueba"></ValidationSettings>
                                                                <InvalidStyle BackColor="LightPink" />
                                                            </dx:ASPxTextBox>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <label class="font-pequeno">¿Donde acudir?</label>
                                                            <dx:ASPxTextBox ID="txtDondeAcudir" ClientInstanceName="txtDondeAcudir" Native="true" runat="server" Width="100%" CssClass="text-box">
                                                                <ValidationSettings CausesValidation="True" ValidationGroup="prueba"></ValidationSettings>
                                                                <InvalidStyle BackColor="LightPink" />
                                                            </dx:ASPxTextBox>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="col-xs-12">
                                                            <label class="font-pequeno">Observación</label>
                                                            <dx:ASPxTextBox ID="txtObservacion" ClientInstanceName="txtObservacion" Native="true" runat="server" Width="100%" CssClass="text-box"></dx:ASPxTextBox>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                            <div class="col-xs-12">
                                <div class="col-xs-6">
                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Native="true" CssClass="btn btn-danger" Width="100%" OnClick="btnCancelar_Click"></dx:ASPxButton>
            </div>
            <div class="col-xs-6">
                <dx:ASPxButton ID="btnAceptar" runat="server" Text="Guardar" Native="true" CssClass="btn btn-primary" Width="100%" OnClick="btnAceptar_Click" ValidationGroup="prueba"></dx:ASPxButton>
            </div>
                            </div>

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </div>


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
