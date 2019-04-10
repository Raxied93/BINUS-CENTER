<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestKoneksi.aspx.cs" Inherits="Halaman_TestKoneksi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="BtnTest" runat="server" Text="Click Me" OnClick="BtnTest_Click" style="height: 26px" />
        </div>
        <div style="margin-top:10%">
            <asp:SqlDataSource 
                ID="SqlDataSourceMenampilkanTable"
                runat="server"
				ConnectionString="<%$ ConnectionStrings:KoneksiAdoNet %>"
				SelectCommand="select *  from Login_User "
				ProviderName="<%$ ConnectionStrings:KoneksiAdoNet.ProviderName %>">
            </asp:SqlDataSource>
            <asp:ListView ID="ListViewLogin" DataSourceID="SqlDataSourceMenampilkanTable" runat="server">
                <LayoutTemplate>
                    <table>
                        <thead>
                            <th>ID</th>
                            <th>Username</th>
                        </thead>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </table>
                </LayoutTemplate>
                <EmptyDataTemplate>

                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr>
                        <td style="padding-top:40px"><%#Eval("Id_login")%></td>
                        <td style="padding-top:40px"><%#Eval("Username_login")== null?Eval("Username_login"):"<p>Data Kosong<p>"%></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div>
            <asp:Label ID="LabelJudul" runat="server" Text="Menampilkan Data dari DataTable"></asp:Label>
            <asp:ListView ID="ListViewDataLogin" runat="server">
                <LayoutTemplate>
                    <table>
                        <thead>
                            <td>Id Login</td>
                            <td>sername Login</td>
                            <td>pswd Login</td>
                        </thead>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tbody>
                        <td><%#Eval("Id_login")%></td>
                        <td><%#Eval("Username_login")%></td>
                        <td><%#Eval("Password_login")%></td>
                    </tbody>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div style="margin-top:10%">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
