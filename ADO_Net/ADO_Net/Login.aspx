<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Halaman_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Form Login</title>
            <!-- Bootstrap -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 50px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
</style>
</head>
<body>
<div class="login-form">
    <form id="form1" runat="server">
        <h2 class="text-center">Log in</h2> 
        <div class="form-group" style="margin:10px">
        <img src="img/icon.png" width="50" height="50"/>
        </div>
        <div class="form-group" style="margin:10px">
            <asp:TextBox ID="TxtUsername" autocomplete="off" class="form-control" placeholder="Username" required="required" runat="server"></asp:TextBox>
        </div>
        <div class="form-group" style="margin:10px">
            <asp:TextBox ID="TxtPasswd" autocomplete="off"  class="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group" style="margin:10px">
             <asp:Button ID="BtnLogin" Class="btn btn-danger" runat="server" Text="Masuk" OnClick="BtnLogin_Click" />
        </div>      
    <%--    <div class="container">
            <div class="form-group">
                <h3>Menu Login</h3>
            </div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtUsername" Class="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtPasswd" Class="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnLogin" Class="btn btn-danger" runat="server" Text="Masuk" OnClick="BtnLogin_Click" />
                    </td>
                </tr>
            </table>
        </div>--%>
    </form>
</div>
</body>
</html>
