<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetalleAlumnos.aspx.cs" Inherits="DetalleAlumnos" %>

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
    <title>Profesor</title>
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
<body>
    <form id="form1" runat="server">
    <div class="container" style="padding-left:0; padding-right:0;">



        <section>
            <!-- el repeater de los alumnos -->
            <div class="col-xs-12">
                <asp:Repeater ID="rptTareas" runat="server">
                    <ItemTemplate>

                        <div class="col-xs-12 no-padding border-bottom-burlywood">

                                <div class="col-xs-12">
                                    <i class="fa fa-user"></i> <span><%# Eval("NombreCompleto", "{0}")%>, <%# Eval("Edad", "{0}")%> años, <%# Eval("Sexo", "{0}")%>, número de emergencia: <%# Eval("NumeroEmergencia", "{0}")%>, en caso de urgencia llevar a  <%# Eval("DondeAcudir", "{0}")%> .</span>
                                </div>
                            <div class="col-xs-12">
                                <strong> <i class="fa fa-hospital-o"></i> <span> Antecedentes:</span></strong>
                                <ul>
                                    <li><%# Eval("DetalleProblemasCardiacos", "{0}")%></li>
                                    <li><%# Eval("DetalleAsma", "{0}")%></li>
                                    <li><%# Eval("DetalleProblemasMotores", "{0}")%></li>
                                </ul>
                            </div>

                        </div>


                    </ItemTemplate>
                </asp:Repeater>

            </div>
           

        </section>


    </div>
    </form>
</body>
</html>
