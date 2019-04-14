<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Master_InputStock.aspx.cs" Inherits="Halaman_Master_InputStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" Runat="Server">
    <script type="text/javascript">
      $( function() {
          $("#<%= TxtTgl.ClientID %>").datepicker({
              changeMonth: true,
              changeYear: true,
              dateFormat: "dd/mm/yy",
              yearRange: "-90:+00"
          });
          $("#<%= TxtAkhir.ClientID %>").datepicker({
              changeMonth: true,
              changeYear: true,
              dateFormat: "dd/mm/yy",
              yearRange: "-90:+00"
          });
          $("#<%= TxtAwal.ClientID %>").datepicker({
              changeMonth: true,
              changeYear: true,
              dateFormat: "dd/mm/yy",
              yearRange: "-90:+00"
          });
          $('#insert').hide();
          $('#update').hide();
          $('#btnstf').click(function () {
              $('#update').show();
              $('#insert').hide();
          });
          $('#btnbwh').click(function () {
              $('#insert').show();
              $('#update').hide();
          });

      });
      </script>
    <div class="container">
        <div class="form-group">
            <h3><asp:Label ID="Label1" runat="server" Text="Form Master Stock"></asp:Label></h3>
        </div>
        <div class="form-group">
                        <div class="row">
                            <div class="col-sm-2">Masukan Range Tanggal: </div>
                            <div class="col-sm-3"><asp:TextBox ID="TxtAwal" Class="form-control" runat="server" autocomplete="off"></asp:TextBox></div>
                            <div class="col-sm-3"><asp:TextBox ID="TxtAkhir" Class="form-control" runat="server" autocomplete="off"></asp:TextBox></div>  
                            <div class="col-sm-3">
                                <asp:Button ID="Search" runat="server" CssClass="btn btn-success" Text="Cari" OnClick="Search_Click" /></div>
                        </div>  

            <asp:ListView ID="ListViewMasterStock" runat="server" >
                <LayoutTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th  scope="col">Check</th>
                                <th  scope="col">Id Barang</th>
                                <th  scope="col">Member ID</th>
                                <th  scope="col">Nama Barang</th>
                                <th  scope="col">Tgl Datang</th>
                                <th  scope="col">Keterangan</th>
                                <th  scope="col">Status</th>
                                <th  scope="col">Jumlah</th>
                                <th  scope="col">Gambar</th>
                            </tr>
                        </thead>
                     <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </table>

                </LayoutTemplate>
                <EmptyDataTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/empty-result_shot.png"/>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:CheckBox ID="chkbar" runat="server" value='<%# Eval("id_barang") %>' /></td>
                        <td><%#Eval("Id_Barang")%></td>
                        <td><%#Eval("Member_id")%></td>
                        <td><%#Eval("Nama_Barang")%></td>
                        <td><%#Eval("TglDatang","{0:dd/MM/yyyy}")%></td>
                        <td><%#Eval("Keterangan")%></td>
                        <td><%# Eval("Status_barang").ToString() == "1" ? "Tampil" : "Tidak Tampil" %></td>
                        <td><%#Eval("Jumlah")%></td>
                        <td>
                            <img src='<%#Eval("PathFile")%>' alt="Girl in a jacket" height="150" width="150">
                            </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <%--<asp:SqlDataSource ID="SqlDataSourceStock" runat="server" ConnectionString="<%$ ConnectionStrings:KoneksiAdoNet %>" SelectCommand="SELECT [Id_Barang], [Member_ID], [Nama_Barang], [Keterangan], [TglDatang], [Status_Barang], [Jumlah], [PathFile] FROM [Stock]"></asp:SqlDataSource>--%>
        </div>
        <div class="">
            <button id="btnstf" type="button" class="btn btn-secondary" >Update</button>
            <button id="btnbwh" type="button" class="btn btn-secondary">Insert</button>
        </div>
        <div id="update" style="display: none">  <br />          
            <div class="form-group">
                <asp:Label ID="Label8" CssClass="col-sm-4" runat="server" Font-Bold="true" Text="Pilih Status Barang : "></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownListUpdateStatus" CssClass="form-control" Width="100px" runat="server">
                    <asp:ListItem Value="1">Tampil</asp:ListItem>
                    <asp:ListItem Value="2">Tidak Tampil</asp:ListItem>
                </asp:DropDownList>
                
                    <br />
                    <asp:Button ID="BtnUpdate" runat="server" CssClass="btn btn-success" Text="Update" OnClick="BtnUpdate_Click" />              
            </div>
        </div>
        <div id="insert" style="display: none">
        <div class="form-group">
        <asp:Label ID="Label5" CssClass="col-sm-4" runat="server" Font-Bold="true" Text="Nama Barang"></asp:Label>
            <div class="col-sm-8">
                <asp:TextBox ID="TxtNamaBarang" class="form-control" runat="server" autocomplete="off"></asp:TextBox>           
            </div>       
        </div>
        <div class="form-group">
        <asp:Label ID="Label2" CssClass="col-sm-4" runat="server" Font-Bold="true" Text="Tgl Barang Masuk"></asp:Label>
            <div class="col-sm-8">
                <asp:TextBox ID="TxtTgl" class="form-control" runat="server" autocomplete="off"></asp:TextBox>       
            </div>       
        </div>
        <div class="form-group">
        <asp:Label ID="Label3" CssClass="col-sm-4" runat="server" Font-Bold="true" Text="Keterangan Barang"></asp:Label>
            <div class="col-sm-8">
                <asp:TextBox ID="TxtKet" class="form-control" runat="server" autocomplete="off"></asp:TextBox>       
            </div>       
        </div>
        <div class="form-group">
        <asp:Label ID="Label4" CssClass="col-sm-4" runat="server" Font-Bold="true" Text="Status Barang"></asp:Label>
            <div class="col-sm-8">
                <asp:DropDownList ID="DropDownListStatusBarang" Class="form-control" runat="server">
                    <asp:ListItem Value="0" text="Select a Value"></asp:ListItem>
                    <asp:ListItem Value="1">Tampil</asp:ListItem>
                    <asp:ListItem Value="2">Tidak Tampil</asp:ListItem>
                </asp:DropDownList>   
            </div>       
        </div>
        <div class="form-group">
        <asp:Label ID="Label6" CssClass="col-sm-4" runat="server" Font-Bold="true" Text="Jumlah Barang"></asp:Label>
            <div class="col-sm-8">
                <asp:TextBox ID="TxtJumlah" class="form-control" runat="server" autocomplete="off"></asp:TextBox>    
            </div>       
        </div>
        <div class="form-group">
            <asp:Label ID="Label7" CssClass="col-sm-4" runat="server" Font-Bold="true" Text="Upload Gambar Barang"></asp:Label>
             <div class="col-sm-8">
                 <asp:FileUpload ID="FileUploadGambar" runat="server" />
             </div>
        </div>
        <div class="form-group">
             <div class="col-sm-8">
                 <asp:Button ID="Simpan" CssClass="btn btn-success" runat="server" Text="Simpan" OnClick="Simpan_Click" />
            </div>
        </div>
        </div>
    </div>
</asp:Content>

