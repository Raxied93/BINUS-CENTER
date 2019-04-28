<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Halaman_Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <!-- Bootsrap -->
    <script src="/Bootstrap4/bootstrap.min.js"></script>
    <link href="/Bootstrap4/bootstrap.min_2.css" rel="stylesheet" />
<%--    <script src="../Bootstrap4/jquery-3.2.1.slim.min.js"></script>--%>
    <script src="/Bootstrap4/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div id="print" runat="server" class="form-group">
                <h2>Contoh Struk Belanja</h2><br />
                   
                <asp:ListView ID="ListViewCekKeranjang" visible="false" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th  scope="col">Kode Barang</th>
                                <th  scope="col">Nama Barang</th>
                                <th  scope="col">Jumlah</th>
                                <th  scope="col">Tanggal Belanja</th>
                            </tr>
                        </thead>
                     <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </table>
                </LayoutTemplate>
                <EmptyDataTemplate>
                    Data Tidak Di Temukan
                </EmptyDataTemplate>
                <ItemTemplate>
                        <td><%#Eval("Id_Barang")%></td>
                        <td><%#Eval("Nama_Barang")%></td>
                        <td><%#Eval("Jumlah")%> Buah</td>
                        <td><%#Eval("Tgl", "{0:dd/MM/yyyy}")%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView><br />
                    <p>Cetak Struk Tanggal : </p>
                    <p><%= DateTime.Now %></p>
                </div>
                <div class="form-group">
                    <asp:Button ID="BtnCetak" runat="server" CssClass="btn btn-danger" Text="Cetak" OnClick="BtnCetak_Click" />
                    <asp:Button ID="BtnKembali" CssClass="btn btn-success" runat="server" Text="Kembali" OnClick="BtnKembali_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
