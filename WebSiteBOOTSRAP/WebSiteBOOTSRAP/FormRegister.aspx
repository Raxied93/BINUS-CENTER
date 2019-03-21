<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormRegister.aspx.cs" Inherits="FormRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Form Registrasi</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#myInput128").on("keyup", function () {

            var value = $(this).val().toLowerCase();

            $("#myTable128 tr").filter(function () {

                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });

        });
    });
</script>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <div class="form-group">
                <div class="col-sm-8">
                    <asp:Label ID="Label1" runat="server" Text="Nama"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox1" class="form-control" runat="server" autocomplete="off"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8">
                    <asp:Label ID="Label2" runat="server" Text="Alamat"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox2" class="form-control" runat="server" autocomplete="off"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8">
                    <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Button" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8">
                    <input id="myInput128"  type="text" placeholder="Ketik Nama yang akan di Cari!" class="form-control required" autocomplete="off"><br />
                    <div style="overflow-y:scroll; height:100px">
                    <table id="myTable128" class="table table-hover" style="margin-top:100px;margin-bottom:1%; ">
                        <thead  style="background-color:aliceblue;">
                            <tr >
                            <td>Head1</td>
                            <td>Head2</td>
                            </tr>
                        </thead>
                        <tbody style="color:red">
                            <tr>
                                <td>Val1</td>
                                <td>Val2</td>
                            </tr>
                            <tr>
                                <td>Val11</td>
                                <td>Val22</td>
                            </tr>
                            <tr>
                                <td>Val10</td>
                                <td>Val20</td>
                            </tr>
                            <tr>
                                <td>Val100</td>
                                <td>Val200</td>
                            </tr>
                        </tbody>
                    </table></div>
                </div>
            </div>
            
        </div>
    </form>
</body>
</html>
