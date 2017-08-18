<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MatrizProfesor.aspx.cs" Inherits="MatrizProfesor" %>

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
    <title>Cupos del Profesor</title>
    <link rel="stylesheet" href="css/foundation.min.css" />
    <link rel="stylesheet" href="css/foundation-icons.css" />
    <link rel="stylesheet" href="css/personalizado.css" />
    <script src="js/vendor/modernizr.js"></script>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/foundation.min.js"></script>
    <script src="js/foundation/foundation.accordion.js"></script>
    <script src="js/foundation/foundation.tooltip.js"></script>
    <!-- js del app -->
    <script src="js/MatrizProfe.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="contained">
            <!-- info usuario -->
            <%--<div class="small-12 columns panel-sencillo bg-dark-cyan">
                <span class="fg-white">Víctor Coronado, Administrador</span>
            </div>--%>
             <uc1:encabezado runat="server" id="Encabezado" />

            

            <dx:ASPxCallbackPanel ID="pnlPrincipal" ClientInstanceName="pnlPrincipal" runat="server" Width="100%" OnCallback="pnlPrincipal_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <!-- variables escondidas -->
                        <dx:ASPxLabel ID="lblNodIdOculto" runat="server" Text="0" ClientVisible="false" ClientInstanceName="lblNodIdOculto">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="lblProfIdOculto" runat="server" Text="0" ClientVisible="false" ClientInstanceName="lblProfIdOculto">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="lblClieIdOculto" runat="server" Text="0" ClientVisible="false" ClientInstanceName="lblClieIdOculto">
                        </dx:ASPxLabel>
                        <!-- titulo -->
                        <div class="small-12 columns bg-white">
                            <h5 class="small-12 columns titulo">Titulo</h5>
                            <div class="small-2 columns">
                                <dx:ASPxHyperLink ID="hlVolver" runat="server" Text="Volver" ImageUrl="~/img/atras.png" ImageWidth="30px">
                                    <Border BorderStyle="None" />
                                </dx:ASPxHyperLink>
                            </div>


                        </div>
                        <!-- acá un acordeon con la ayuda -->

                        <ul class="accordion bg-dark-cyan" id="myAccordion" data-accordion="">
                            <li class="accordion-navigation">

                                <a href="#cat1">
                                    <span class="small-8 columns size-18 fg-white fi-info">Información </span>
                                    <i class="small-1 columns fi-arrow-down size-18 fg-white" id="flecha"></i>

                                </a>


                                <div id="cat1" class="content" style="padding: 0;">
                                    <!-- notificaciones -->
                                    <div class="small-12 columns panel-sencillo bg-white">

                                        <div class="small-12 large-12 columns margin-bottom-0 bg-white">
                                            <div class="small-1 columns fi-eye size-18 text-center fg-esmeralda pointer">
                                            </div>
                                            <div class="small-9 columns font-pequeno">
                                                Permite tomar una hora del profesor.
                                            </div>

                                        </div>


                                    </div>


                                </div>
                            </li>

                        </ul>


                        <div class="small-12 columns border-top-double-burlywood">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div class='<%# Eval("ClaseBorde", "{0}")%>'>
                                        <div class="small-10 columns no-padding-left">
                                            <div class="small-3 large-4 columns size-18 text-center fg-white pointer">
                                                <%-- <span class="size-12 top-text"><%# Eval("DiaSemanaInt", "{0}")%></span>--%>
                                                <span class='<%# Eval("ClaseDia", "{0}")%>'><%# Eval("DiaSemanaInt", "{0}")%></span>
                                            </div>
                                            <div class="small-9 large-8 columns">
                                                <span><%# Eval("DiaSemana", "{0}")%></span>
                                            </div>
                                            <div class="small-9 large-8 columns">
                                                <span class="label success round"><%# Eval("HoraInicio", "{0}")%></span>
                                                <span class="label success round"><%# Eval("HoraTermino", "{0}")%></span>
                                                <strong><span class="label info round"><%# Eval("CuposDisponibles", "{0}")%></span></strong> 
                                            </div>
                                        </div>
                                        <!-- botones -->
                                        <div class="small-2 columns no-padding-right">
                                            <!-- lo redirecciona a una pagina para ir activando los cupos de uno -->
                                            <div class="small-12 columns fi-eye size-18 text-center bg-esmeralda fg-white pointer" onclick='<%# "Abrir(" +Eval("NodId") + "," + Eval("ProfId") + "," + Eval("FechaEntera") + "," + Eval("DeshabilitaCrearTodo") + " );" %>'>
                                                <br class="visible-for-medium-up" />
                                                <span class="size-12 top-text visible-for-medium-up">Una</span>
                                            </div>

                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <dx:ASPxPopupControl ID="popupInfo" runat="server" CssClass="small-12 columns" Width="100%" ClientInstanceName="popupInfo" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="Seleccione" Modal="True" Theme="MetropolisBlue" MinWidth="330px">
                            <ContentStyle>
                                <Paddings Padding="2px" />
                                <Border BorderStyle="None" BorderWidth="0px" />
                            </ContentStyle>
                            <ContentCollection>
                                <dx:PopupControlContentControl runat="server">

                                    <%--<dx:ASPxGridView ID="grillaSegmentos" runat="server" AutoGenerateColumns="False" ClientInstanceName="grillaSegmentos" EnableTheming="True" KeyFieldName="Id" OnBatchUpdate="grillaSegmentos_BatchUpdate" OnCustomCallback="grillaSegmentos_CustomCallback" Theme="Moderno" Width="100%" OnHtmlDataCellPrepared="grillaSegmentos_HtmlDataCellPrepared">
                                        <SettingsPager Visible="False">
                                        </SettingsPager>
                                        <SettingsEditing Mode="Batch">
                                        </SettingsEditing>
                                        <Settings GridLines="None" ShowColumnHeaders="False" ShowHeaderFilterBlankItems="False" />
                                        <SettingsBehavior AllowFocusedRow="True" AllowGroup="False" />
                                        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                        <EditFormLayoutProperties>
                                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" />
                                        </EditFormLayoutProperties>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="IdCupo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="SghId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="FechaEntera" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="HoraInicio" ShowInCustomizationForm="True" VisibleIndex="3">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="HoraTermino" ShowInCustomizationForm="True" VisibleIndex="4">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn FieldName="EsSeleccionado" ShowInCustomizationForm="True" VisibleIndex="6">
                                                <EditFormSettings Visible="True" />
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="EsDisponible" ShowInCustomizationForm="True" VisibleIndex="8" Visible="false">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>--%>
                                    <dx:ASPxCallbackPanel ID="pnlCupos" runat="server" ClientInstanceName="pnlCupos" Width="100%" OnCallback="pnlCupos_Callback">
                                        <PanelCollection>
                                            <dx:PanelContent runat="server">
                                                <asp:Repeater ID="Repeater2" runat="server">
                                                    <ItemTemplate>
                                                        <div class='<%# Eval("ClaseBorde", "{0}")%>'>
                                                            <div class="small-4 medium-4 columns no-padding-left">
                                                                <div class="small-6 columns size-18 text-center fg-white pointer">
                                                                    <span class="label round"><%# Eval("HoraInicio", "{0}")%></span>
                                                                    <span class="label round"><%# Eval("HoraTermino", "{0}")%></span>
                                                                </div>

                                                            </div>
                                                            <div class="small-4 medium-5 columns no-padding-left" style="padding-top:20px;">
                                                                <span class="label round success"><%# Eval("Descripcion", "{0}")%></span>
                                                            </div>
                                                            <div class="small-4 medium-3 columns no-padding-right text-center">
                                                                 <dx:ASPxCheckBox ID="chkSeleccione" runat="server" Width="100%" Font-Size="X-Large" ClientVisible='<%# Eval("EsDisponible")%>' Checked='<%# Eval("EsSeleccionado")%>'  BackColor="Transparent" CheckBoxStyle-BackColor="Transparent" >
                                                                     <CheckedImage Url="img/Checked Checkbox-50.png" Width="50px" Height="50px">
                                                                     </CheckedImage>
                                                                     <UncheckedImage Url="img/Unchecked Checkbox-50.png" Width="50px" Height="50px">
                                                                     </UncheckedImage>
                                                                     <GrayedImage Url="img/Checked Checkbox-50.png" Width="50px" Height="50px">
                                                                     </GrayedImage>
                                                                 </dx:ASPxCheckBox>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
<%--                                                <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" CheckState="Unchecked" Text=" ">
                                                    <CheckedImage Url="~/img/Checked Checkbox-50.png" Width="50px" Height="50px">
                                                    </CheckedImage>
                                                    <UncheckedImage Url="~/img/Unchecked Checkbox-50.png" Width="50px" Height="50px">
                                                    </UncheckedImage>
                                                    <GrayedImage Url="~/img/Checked Checkbox-50.png" Width="50px" Height="50px">
                                                    </GrayedImage>
                                                </dx:ASPxCheckBox>--%>
                                            </dx:PanelContent>
                                        </PanelCollection>
                                    </dx:ASPxCallbackPanel>
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>


                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>


        </div>

    </form>
</body>
</html>
