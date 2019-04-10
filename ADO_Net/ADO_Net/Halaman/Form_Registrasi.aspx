<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Form_Registrasi.aspx.cs" Inherits="Form_Registrasi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Form Registrasi</title>
    <!-- Datetimepicker -->
    <script src="../DateTimePicker/jquery-1.12.4.js"></script>
    <script src="../DateTimePicker/jquery-ui.js"></script>
    <link href="../DateTimePicker/jquery-ui.css" rel="stylesheet" />
    <!-- Bootsrap -->
    <script src="../Bootstrap4/bootstrap.min.js"></script>
    <link href="../Bootstrap4/bootstrap.min_2.css" rel="stylesheet" />
<%--    <script src="../Bootstrap4/jquery-3.2.1.slim.min.js"></script>--%>
    <script src="../Bootstrap4/popper.min.js"></script>
 <script>
  $( function() {
      $('#TxtTTL').datepicker({
          changeMonth: true,
          changeYear: true,
          dateFormat: "dd/mm/yy",
          yearRange: "-90:+00"
      });
  } );
  </script> 
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-group">   
            <h3>Form Input Data Member</h3><br />
             </div>
            <div class="form-group">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="LblNama" runat="server" Text="Nama : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtNama" Class="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblEmail" runat="server" Text="Email : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtEmail" Class="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblPassword" runat="server" Text="Password : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtPswd"  Class="form-control" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblTglLahir" runat="server" Text="Tanggal Lahir : "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtTTL"  Class="form-control" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnSubmit" Class="btn btn-success" runat="server" Text="Simpan Data" OnClick="BtnSubmit_Click" />
                    </td>
                </tr>
            </table>
            </div>
        </div>
    </form>
</body>
</html>
