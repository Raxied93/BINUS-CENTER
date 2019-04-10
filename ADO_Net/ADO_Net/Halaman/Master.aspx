<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Master.aspx.cs" Inherits="Halaman_Master" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manu Master</title>
    <!-- Datetimepicker -->
    <script src="~/DateTimePicker/jquery-1.12.4.js"></script>
    <script src="~/DateTimePicker/jquery-ui.js"></script>
    <link href="~/DateTimePicker/jquery-ui.css" rel="stylesheet" />
    <!-- Bootsrap -->
    <script src="~/Bootstrap4/bootstrap.min.js"></script>
    <link href="~/Bootstrap4/bootstrap.min_2.css" rel="stylesheet" />
<%--    <script src="../Bootstrap4/jquery-3.2.1.slim.min.js"></script>--%>
    <script src="~/Bootstrap4/popper.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <a class="navbar-brand" href="#">Navbar</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Master.aspx">Master Hak Akses</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Master_InputStock.aspx">Master Stock</a>
              </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <asp:Button ID="Button1" Class="btn btn-danger" runat="server" Text="Logout" OnClick="Button1_Click" />
            </form>
          </div>
        </nav>
        <div class="container">
            <h1>Menu Master Hak Akses</h1>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceHakAkses" runat="server"
			ConnectionString="<%$ ConnectionStrings:KoneksiAdoNet %>"
			SelectCommand="select * from MenuMaster"
			ProviderName="<%$ ConnectionStrings:KoneksiAdoNet.ProviderName %>">
			</asp:SqlDataSource>  
            <asp:ListView ID="ListViewHakAkses" DataSourceID="SqlDataSourceHakAkses" runat="server">
                <LayoutTemplate>
                    <table  id="ListPelamarBaru" class="table table-bordered striped data" align="left">
                        <thead>
                            <th style="color:red" scope="col">Check</th>
                            <th style="text-align:center; color:red; background-color:#a9a9a9">Member ID</th>
                            <th style="text-align:center; color:red; background-color:#a9a9a9">Nama Member</th>
                            <th style="text-align:center; color:red; background-color:#a9a9a9">Status Member</th>
                            <th style="text-align:center; color:red; background-color:#a9a9a9">ID Akses</th>
                            <th style="text-align:center; color:red; background-color:#a9a9a9">Nama Akses</th>
                        </thead>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                        <tr>
                            <td>
                               <asp:CheckBox ID="ChkIDMem" runat="server" value='<%# Eval("Member_ID") %>' /> 
                            </td>
                            <td align="center" style="padding-top:40px"><center><%#Eval("Member_ID")%></center></td>
                            <td style="padding-top:40px"><center><%#Eval("Nama_Member")%></center></td>
                            <td style="padding-top:40px"><%#Eval("Status_Member")%></td>
                            <td style="padding-top:40px"><%#Eval("Id_Akses")%></td>
                            <td style="padding-top:40px"><center><%#Eval("Nama_Akses")%></center></td>
                        </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    Data Tidak Di Temukan
                </EmptyDataTemplate>
            </asp:ListView>
            <br />
            <table>
                <tr>
                    <td>
                        <asp:DropDownList ID="DropDownListHakAkses" runat="server" DataSourceID="SqlDataSourceListHakAkses" DataTextField="Nama_Akses" DataValueField="Id_Akses" >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceListHakAkses" runat="server" ConnectionString="<%$ ConnectionStrings:KoneksiAdoNet %>" SelectCommand="SELECT [Nama_Akses], [Id_Akses] FROM [List_HakAkses]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnInsert" runat="server" Text="Insert" OnClick="BtnInsert_Click" /></td>
                </tr>
            </table>
            <br />
            <asp:Button ID="BtnLogout" runat="server" Text="Logout" OnClick="BtnLogout_Click" />
        </div>
    </form>
</body>
</html>
