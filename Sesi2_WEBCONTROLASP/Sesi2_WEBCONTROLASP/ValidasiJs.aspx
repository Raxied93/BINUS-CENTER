<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ValidasiJs.aspx.cs" Inherits="ValidasiJs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript">       
    function userValid() {
        //textbox
           var UName= document.getElementById('<%=TextBoxNama.ClientID%>').value;    
           var Pwd= document.getElementById('<%=TextBoxPswd.ClientID%>').value;    
    
           if (UName == '')    
           {    
            alert("Please enter User Name");    
            return false;    
           }    
    
           if (Pwd == '')    
           {    
           alert("Please enter Password");    
           return false;    
           }    
        }    
     </script>   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBoxNama" runat="server"></asp:TextBox></td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBoxPswd" runat="server"></asp:TextBox></td>

            </tr>

            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClientClick="return userValid();"/></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
