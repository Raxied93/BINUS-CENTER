<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                                <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Hyperlink"></asp:Label>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLinkTest" runat="server">HyperLink</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtHasil" runat="server" Text="Button" OnClick="BtHasil_Click" />
                    </td>
                </tr>
            </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
