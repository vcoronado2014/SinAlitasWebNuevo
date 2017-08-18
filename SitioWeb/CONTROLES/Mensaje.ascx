<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Mensaje.ascx.cs" Inherits="CONTROLES_Mensaje" %>
<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<dx:ASPxPanel ID="pnlPrinciapl" runat="server" Width="100%" ClientVisible ="false"><PanelCollection>
<dx:PanelContent runat="server">
    <div class="small-2 columns right">
        <dx:ASPxImage ID="imgOk" runat="server" ShowLoadingImage="true" ClientVisible="false" ImageUrl="~/img/circle-with-check-symbol.png" Width="30px"></dx:ASPxImage>
        <dx:ASPxImage ID="imgError" runat="server" ShowLoadingImage="true" ClientVisible="false" ImageUrl="~/img/cancel-button.png" Width="30px"></dx:ASPxImage>
        <dx:ASPxImage ID="imgWarning" runat="server" ShowLoadingImage="true" ClientVisible="false" ImageUrl="~/img/failed-sms.png" Width="30px"></dx:ASPxImage>
    </div>
    <div class="small-9 columns text-right">
        <dx:ASPxLabel ID="lblMensaje" runat="server" Text=""></dx:ASPxLabel>
    </div>
</dx:PanelContent>
</PanelCollection>
</dx:ASPxPanel>
