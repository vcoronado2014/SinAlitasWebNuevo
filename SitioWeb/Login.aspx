<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="description" content="."/>
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development"/>
    <meta name="author" content="Victor Coronado"/>
    <title>Ingreso</title>
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



    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row">

        <div class="medium-3 columns">&nbsp;</div>
        
        <div class="medium-6 columns">
<%--        <asp:Login ID="Login1" runat="server" MembershipProvider="MSUsuarioLunSqlMembershipProvider" Width="100%" DestinationPageUrl="~/Default.aspx">
            <LayoutTemplate>--%>
                <!-- titulo login -->
                <div class="row">
                    <div class="small-4 columns">&nbsp;</div>
                    <div class="small-4 columns">
                    <asp:Image ID="Image1"  runat="server" ImageUrl="~/img/logomisalud.png" Width="100%" />
                        </div>
                    <div class="small-4 columns">&nbsp;</div>
                </div>
                <!-- cuerpo -->
                <div class="row panel" style="background-color:white; border:none;">
                    <div class="row">
                        <div class="small-12 medium-4 columns">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuario:</asp:Label>
                        </div>
                        <div class="small-10 medium-6 columns">
                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox> 
                        </div>
                        <div class="medium-2 columns">
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" Width="100%" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="small-12 medium-4 columns">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Clave:</asp:Label>
                        </div>
                        <div class="small-10 medium-6 columns">
                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="medium-2 columns">
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="medium-4 columns">

                        </div>
                        <div class="small-12 medium-8 columns">
                            <asp:CheckBox ID="RememberMe" runat="server" Text="Recordar Usuario." />
                        </div>
                    </div>
                    <div class="row">
                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="small-12 columns">
                            <asp:Button CssClass="button" Width="100%" ID="LoginButton" runat="server" CommandName="Login" Text="INICIAR SESIÓN" ValidationGroup="Login1" OnClick="LoginButton_Click" BackColor="#C76B95" />
                        </div>
                        <div class="small-12 columns">
                            <asp:Button CssClass="button" Width="100%" ID="btnCancelar" runat="server" CommandName="Cancelar" Text="ACCESO CLIENTE" OnClick="btnCancelar_Click" />
                        </div>

                    </div>

                </div>

                
<%--            </LayoutTemplate>
        </asp:Login>--%>
        </div>

        <div class="medium-3 columns">&nbsp;</div>
    
    </div>
    </form>
</body>
</html>
