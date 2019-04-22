<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Halaman_TestCaptcha.aspx.cs" Inherits="TestCaptcha.Halaman.Halaman_TestCaptcha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test captcha</title>
    <script type="text/javascript" src='https://www.google.com/recaptcha/api.js'></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/esm/popper.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-3.0.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">

    <div id="div1" class="container" runat="server">
        <div class="form-group">
            <div class="col-sm-3">
            <asp:Label ID="Label1" Font-Bold="true" runat="server" Text="Input Data Anda"></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
                Nama : 
                <asp:TextBox ID="TxtNama" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                Username : 
                <asp:TextBox ID="TxtUsername" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                Password : 
                <asp:TextBox ID="TxtPswd" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-3">
                Email : 
                <asp:TextBox ID="TxtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
            <div class="g-recaptcha" data-sitekey="6LfYd5QUAAAAAAMCRbYOO11f_BFGJesn7DZR-WJB"></div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3">
            <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
            </div>
        </div>
        <asp:Button ID="BtnPrint" runat="server" Visible="false" Text="Print" OnClick="BtnPrint_Click" />
    </div>

    <div id="div2" class="container" runat="server">
        <table class="table">
            <tr>
                <td>
                    <asp:Label ID="LblNama" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LblPassword" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LblEmail" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LblUsername" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
        </table>
    </div>

    </form>
</body>
</html>
