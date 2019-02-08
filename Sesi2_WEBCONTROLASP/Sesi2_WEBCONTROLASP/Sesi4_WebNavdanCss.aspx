<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sesi4_WebNavdanCss.aspx.cs" Inherits="Sesi4_WebNavdanCss" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Tree view Menu -->
        <asp:TreeView ID="TreeView1" runat="server">
            <Nodes>
                <asp:TreeNode Text="Menu Utama" Value="Menu Utama">
                    <asp:TreeNode Text="Nama Barang" NavigateUrl="Sesi3_Validator.aspx"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="FAQ" Value="FAQ">
                    <asp:TreeNode Text="Siapa Kita"  NavigateUrl="Sesi2_WebControlASP.aspx"></asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
        </asp:TreeView>

        <!-- Menu Control static -->
        <asp:Menu ID="Menu1" runat="server">
            <Items>
                <asp:MenuItem Text="Home">
                    <asp:MenuItem Text="Katalog" NavigateUrl="Sesi2_WebControlASP.aspx"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="FAQ">
                    <asp:MenuItem Text="Pengembalian Barang" NavigateUrl="Sesi3_Validator.aspx"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>

        <!-- SiteMap Control -->
        
    </form>
</body>
</html>
