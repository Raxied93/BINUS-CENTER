<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="Form_Pengguna.aspx.cs" Inherits="Form_Pengguna" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server"> 
    <div class="container">
        <div class="form-group">
            <asp:SqlDataSource ID="SqlDataSourceHakAkses" runat="server"
			ConnectionString="<%$ ConnectionStrings:KoneksiAdoNet %>"
			SelectCommand="select * from Stock where status_barang = 1"
			ProviderName="<%$ ConnectionStrings:KoneksiAdoNet.ProviderName %>">
			</asp:SqlDataSource>  
            <asp:ListView ID="ListViewHakAkses" DataSourceID="SqlDataSourceHakAkses" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th  scope="col">Check</th>
                                <th  scope="col">Id Barang</th>
                                <th  scope="col">Nama Barang</th>
                                <th  scope="col">Keterangan</th>
                                <th  scope="col">Jumlah</th>
                                <th  scope="col">Gambar</th>
                            </tr>
                        </thead>
                     <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </table>
                </LayoutTemplate>
                <EmptyDataTemplate>
                    Data Tidak Di Temukan
                </EmptyDataTemplate>
                <ItemTemplate>
                        <td><asp:CheckBox ID="chkbar" runat="server" value='<%# Eval("id_barang") %>' /></td>
                        <td><%#Eval("Id_Barang")%></td>
                        <td><%#Eval("Nama_Barang")%></td>
                        <td><%#Eval("Keterangan")%></td>
                        <td><%#Eval("Jumlah")%></td>
                        <td>
                            <img src='<%#Eval("PathFile")%>' alt="Girl in a jacket" height="150" width="150">
                            </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-3">
                    Masukan Jumlah Barang Belanja Anda : 
                    <asp:TextBox ID="TxtJumlah" CssClass="form-control" Width="100px" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">

            <div class="row">
                <div class="col-sm-3">
                    <asp:Button ID="BtnSimpanKeranjang" CssClass="btn btn-danger" runat="server" Text="Simpan Ke Keranjang" OnClick="BtnSimpanKeranjang_Click" />
                </div>
                <div class="col-sm-3">
                     <asp:Button ID="BtnCekKeranjang" CssClass="btn btn-success" runat="server" Text="Cek Keranjang" OnClick="BtnCekKeranjang_Click" />
                </div>
                <div class="col-sm-3">
                    <asp:Button ID="Logout" CssClass="btn btn-danger" runat="server" Text="Logout" OnClick="Logout_Click" />
                </div>
            </div>
        </div>
        <div  class="form-group">
            
            <asp:TextBox ID="TxtMemID" Visible="false" runat="server"></asp:TextBox> 
            <asp:ListView ID="ListViewCekKeranjang" visible="false" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th  scope="col">Check</th>
                                <th  scope="col">Id Barang</th>
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
                        <td><asp:CheckBox ID="chkbar" runat="server" value='<%# Eval("id_barang") %>' /></td>
                        <td><%#Eval("Id_Barang")%></td>
                        <td><%#Eval("Nama_Barang")%></td>
                        <td><%#Eval("Jumlah")%> Buah</td>
                        <td><%#Eval("Tgl")%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="form-group">
                <div class="col-sm-3">
                     <asp:Button ID="BtnBatalKeranjang" CssClass="btn btn-dark" Visible="false" runat="server" Text="Batal Belanja" OnClick="BtnBatalKeranjang_Click" />
                    <asp:Button ID="BtnCetak" runat="server" CssClass="btn btn-dark" Visible="false" Text="Cetak Report" OnClick="BtnCetak_Click" />
                </div>
        </div>
    </div>
</asp:Content>

