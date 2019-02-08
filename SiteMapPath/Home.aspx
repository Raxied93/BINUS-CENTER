<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Home
    <br />
    <asp:Menu ID="Menu1" runat="server">
        <Items>
            <asp:MenuItem NavigateUrl="~/About.aspx" Text="About" Value="About"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/Services.aspx" Text="Services" Value="Services">
                <asp:MenuItem NavigateUrl="~/Consulting.aspx" Text="Consulting" Value="Consulting"></asp:MenuItem>
            </asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/Home.aspx" Text="Home" Value="Home"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>

