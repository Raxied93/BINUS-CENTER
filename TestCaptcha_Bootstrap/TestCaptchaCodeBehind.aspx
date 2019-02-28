<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestCaptchaCodeBehind.aspx.cs" Inherits="TestCaptchaCodeBehind" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Code Behind Capthcha
    </title>
    <script type="text/javascript" src='https://www.google.com/recaptcha/api.js'></script>
        <!-- Bootstrap -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="col-lg-8" style="margin-top:100px;margin-left:50px">
        <div class="form-group"><!-- Button -->
            <asp:Label ID="Label3" runat="server" Text="Form Login " Font-Bold="true"></asp:Label>
        </div>
    <table >
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Username : "></asp:Label>
            </td>
            <td><br />
                <asp:TextBox ID="TxtUsername" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Password : "></asp:Label>
            </td>
            <td><br />
                <asp:TextBox ID="TxtPassword" class="form-control" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><div class="g-recaptcha" data-sitekey="6LfYd5QUAAAAAAMCRbYOO11f_BFGJesn7DZR-WJB" style="margin-top:10px"></div></td>
        </tr>
        <tr>
            <td><br />
            <asp:Button ID="btnLogin" class="btn btn-danger" runat="server" Text="Login" OnClick="btnLogin_Click"  TabIndex ="4"/></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
