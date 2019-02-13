<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AfterLogin.aspx.cs" Inherits="Cookies_AfterLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Nama"></asp:Label></td>
                    <td>
                        <asp:Label ID="LblNama" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label></td>
                    <td>
                        <asp:Label ID="LblEmail" runat="server" Text="Label"></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
