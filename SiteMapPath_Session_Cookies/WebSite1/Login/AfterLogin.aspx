<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AfterLogin.aspx.cs" Inherits="Login_AfterLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>
                <asp:Label ID="LblGreet" runat="server" Text="Label"></asp:Label></h1>
            <br />
            <asp:Button ID="Button1" runat="server" Text="LogOut" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
