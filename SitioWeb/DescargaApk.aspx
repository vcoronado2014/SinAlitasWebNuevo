<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DescargaApk.aspx.cs" Inherits="DescargaApk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="description" content="." />
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development" />
    <meta name="author" content="Victor Coronado,Juan Morán" />
    <title>Condiciones</title>
    <link rel="shortcut icon" href="images/IconoMiFamilia.png" />
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/estilocliente.css" rel="stylesheet" type="text/css" />
    <link href="css/coro.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="padding-bottom:60px; padding-top:60px;">
    <form id="form1" runat="server">
    <div id="wrapper" class="container" style="padding-left:0; padding-right:0;">
        <header class="titulo-header">
            <nav class="navbar navbar-default navbar-fixed-top bg-rosa">
                <div class="container">
                    <div class="col-xs-2 fa fa-download font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                    </div>
                    <div class="col-xs-10 titulo-header">
                        <h3>Descarga</h3>
                        <%--<h5>Profesor</h5>--%>
                        <h5>Cliente</h5>
                    </div>
                </div>
            </nav>

        </header>

        <div class="col-xs-12 panel panel-info">
            Desde esta página usted puede descargar la aplicación de Sin Alitas, seleccione más abajo la opción que desea:
        </div>

        <div class="col-xs-12 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-android fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">V 1.0</div>
                            <div>Aplicación para Android</div>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer" style="cursor:pointer;">
                        <%--<span class="pull-left">Pinche aquí para Descargar</span>--%>
                        <asp:HyperLink ID="hlDescarga" runat="server" NavigateUrl="~/apk/SIN_ALITAS.apk" Target="_blank">Pinche Aquí para Descargar</asp:HyperLink>
                        <span class="pull-right"><i class="fa fa-download"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-xs-12 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-apple fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">IOS</div>
                            <div>Enlace para Iphone</div>
                        </div>
                    </div>
                </div>
                <a href="#">
                    <div class="panel-footer">
                        <asp:HyperLink ID="hlios" runat="server" NavigateUrl="~/Login.aspx" Target="_self">Pinche Aquí para ir al enlace</asp:HyperLink>
                        <span class="pull-right"><i class="fa fa-link"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>

    </div>
    </form>
</body>
</html>
