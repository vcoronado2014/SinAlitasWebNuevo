<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AceptaCondicionesF.aspx.cs" Inherits="AceptaCondiciones" %>

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
    <title>Condiciones</title>
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
<body style="padding-bottom:60px; padding-top:60px;">
    <form id="form1" runat="server">
    <div id="wrapper" class="container" style="padding-left:0; padding-right:0;">
        <!-- este es el menu inferior con las opciones del profesor -->
        <nav class="navbar navbar-principal navbar-fixed-bottom">
            <div class="col-xs-12 container-footer">
                <div id="iconoHome" class="col-xs-6" aria-hidden="true">
                    <dx:ASPxButton ID="btnCancelar" runat="server" Text="NO Acepto" Native="true" CssClass="btn btn-warning" Width="100%" OnClick="btnCancelar_Click"></dx:ASPxButton>
                </div>
                <div id="iconoHome2" class="col-xs-6" aria-hidden="true">
                    <dx:ASPxButton ID="btnAceptar" runat="server" Text="Acepto" Native="true" CssClass="btn btn-primary" Width="100%" OnClick="btnAceptar_Click"></dx:ASPxButton>
                </div>
            </div>
        </nav>

        <header class="titulo-header">
            <nav class="navbar navbar-default navbar-fixed-top bg-rosa">
                <div class="container">
                    <div class="col-xs-2 fa fa-check-square font-nav-bar height-50 text-center cursor-pointer" aria-hidden="true" data-toggle="modal" data-target="#myLargeModalLabel" onclick="onModal()">
                    </div>
                    <div class="col-xs-10 titulo-header">
                        <h3>Condiciones</h3>
                        <%--<h5>Profesor</h5>--%>
                        <h5>Cliente</h5>
                    </div>
                </div>
            </nav>

        </header>



            <dx:ASPxLabel ID="lblIdPack" runat="server" ClientInstanceName="lblIdPack" ClientVisible="False" Text="0">
            </dx:ASPxLabel>
        <div class="col-xs-12 text-justify">
            <ol>
                <li>
                    <p>
                        SinAlitas garantiza que todos su staff de profesionales se encuentran en óptimas condiciones para realizar clases de natación a domicilio y trabajar con niños menores de edad, pasando por un proceso de postulación, selección y capacitación previamente.
                    </p>
                </li>
                <li>
                    <p>
                        SinAlitas se hace responsable de toda acción profesional de nuestro staff, excluyendo de toda responsabilidad legal a la empresa ante cualquier comportamiento NO profesional de nuestro staff. Toda actividad o acto no adecuado cae en plena responsabilidad de la persona que lo realice.
                    </p>
                </li>
                <li>
                    <p>
                        Nuestros clientes tendrán la posibilidad de reagendar sus clases, con el mismo profesor en los próximos 7 días.
                    </p>
                </li>
                <li>
                    <p>
                        Los clientes podrán agendar sus clases  en un periodo máximo de 3 semanas, respecto a esto, deberán agendar al menos 3 clases semanales.
                    </p>
                </li>
                <li>
                    <p>
                        El cliente deberá tomar un mínimo de 4 clases por pack (en cualquiera de los pack).
                    </p>
                </li>
                <li>
                    <p>
                        Si el cliente desea contratar mas clases, se respetara el mismo valor por clase del pack correspondiente. 
                    </p>
                </li>
                <li>
                    <p>
                        Al contratar el PACK 1 o 2 niños, el valor por clase será de $20.000.-. En caso contrario,  si el cliente desea bajar la cantidad de clases (de 1 a 7), el valor por cada una será   de $25.000.
                        Al contratar el PACK 3 o 4 niños, el valor por clase será de $27.500.-. En caso contrario,  si el cliente desea bajar la cantidad de clases (de 1 a 7), el valor por cada una será   de $35.000.

                    </p>
                </li>
                <li>
                    <p>
                        El cliente tendrán un mínimo de 4 horas previas a cada clase para reagendar o cancelar el pack, de lo contrario la clase sera considerada como realizada.
                    </p>
                </li>
                <li>
                    <p>
                        Todo cliente de Sinalitas podrá evaluar y comentar sobre el profesor de manera libre, respetando la privacidad de sus comentarios. 
                    </p>
                </li>
                <li>
                    <p>
                        Cada cliente deberá agendar un mínimo  de 3 clases por semana.
                    </p>
                </li>
                <li>
                    <p>
                        La clienta entregara información personal a la empresa SinAlitas, autorizando a la empresa a utilizar la información solamente para mejorar el servicio entregado.
                    </p>
                </li>
                <li>
                    <p>
                        La aplicación enviara notificaciones mediante correo electrónico y en su numero de contacto entregado.
                    </p>
                </li>
                <li>
                    <p>
                        Toda clase realizada los días SABADOS Y DOMINGOS tendrá un cargo adicional de $5.000 por clase, esta será sumada al total del pack contratado. Los días festivos no se realizan clases.
                    </p>
                </li>
                <li>
                    <p>
                        Es indispensable para realizar cualquier clase, que la piscina en la cual se trabaje deba estar en las mejores condiciones, por seguridad de los niños y nuestros profesionales, de lo contrario la clase se deberá realizar fuera de la piscina.
                        <br />
                        <strong>SinAlitas recomienda:</strong>
                        <ul>
                            <li>
                                Lugar cerrado donde puedan cambiarse el profesor.(idealmente baño de visita)
                            </li>
                            <li>
                                Un adulto responsable en el lugar donde se imparten las clases.
                            </li>
                            <li>
                                Piscina que cumpla con el protocolo de seguridad, evaluado por profesor Sinalitas.
                            </li>
                        </ul>
                    </p>
                </li>
                <li>
                    <p>
                        El profesor podrá esperar 15 minutos de atrasos de nuestros clientes para comenzar la clase. Si la espera es superior, la clase se va a considerar como clase realizada.
                    </p>
                </li>
                <li>
                    <p>
                        El profesor podrá llegar con un máximo de 10 minutos de atraso, si este tiempo es superado la clienta tendrá la facultad de reagendar esta clase.
                    </p>
                </li>
                <li>
                    <p>
                        Nuestros clientes tendrán acceso a una aplicación donde tendrán libre elección de elegir a los profesores que están disponibles en la comuna en la cual se realizaran las clases.
                    </p>
                </li>
                <li>
                    <p>
                        Queda completamente prohibido INCLUIR a niños que no estén inscritos al pack, de lo contrario el profesor tiene la facultad de cancelar su clase.
                    </p>
                </li>
                <li>
                    <p>
                        A la 5ta clase como máximo, deberá estar pagado la totalidad de pack, de lo contrario la sexta clase no podrá ser realizada.
                    </p>
                </li>
                <li>
                    <p>
                        Sinalitas asegura que el profesor que inicia el pack de clases será el mismo que finalice el periodo de las 8 clases, de suceder lo contrario la clienta será avisada con anterioridad, trasparentando las razones y la clienta tiene libertad de aceptar continuar con las clases o dejar hasta el N° de clases respetando el valor correspondiente a la cantidad de clases.
                    </p>
                </li>
                <li>
                    <p>
                        Es responsabilidad de Sinalitas que todo alumno deba realizar la evaluación diagnostica realizada en la primera clase, además de ser compartida con el apoderado o responsable.
                    </p>
                </li>
                <li>
                    <p>
                        Todo niño que participe de los pack de clases con SinAlitas debe tener una ficha personalizada, la cual será realizada en la App. Es responsabilidad de todos nuestros clientes entregar la información verídica al momento llenar los formularios, por la seguridad tanto de los niños como de nuestros profesionales.
                    </p>
                </li>
                <li>
                    <p>
                        El apoderado o adulto responsable debe completar un formulario de incorporación, indicando si existe alguna enfermedad o precaución que debamos tener en cuenta antes de realizar las clases. SinAlitas no se hace responsable por conflictos derivado de lo anterior, que no hayan sido declarado en el formulario.
                    </p>
                </li>
                <li>
                    <p>
                        Nuestros profesionales tendrán la facultad de cancelar sus clases con un mínimo de 6 horas de anterioridad.
                    </p>
                </li>
                <li>
                    <p>
                        El profesor deberá poner en contacto de inmediato con la clienta, en un tiempo de 30 min. antes de la clase en caso de atraso o dificultad de lo contrario, la clase será reagendada.
                    </p>
                </li>
                <li>
                    <p>
                        Queda prohibido entregar dinero en efectivo a nuestros profesionales, el sistema de pago se realiza solo a través de transferencias bancarias. (solicitar cuenta a encargado).
                    </p>
                </li>
            </ol>
            <p>
                Al acceder y utilizar este servicio, usted acepta y accede a cumplir en los términos y requerimientos de este acuerdo.
            </p>

        </div>

<%--        <div class="col-xs-12">
            <div class="col-xs-12 col-md-6">
                
            </div>
            <div class="col-xs-12 col-md-6">
                
            </div>
        </div>--%>

    </div>
    </form>
</body>
</html>
