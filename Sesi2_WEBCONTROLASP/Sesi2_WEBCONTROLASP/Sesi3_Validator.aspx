<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sesi3_Validator.aspx.cs" Inherits="Sesi3_Validator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script src="Js/jquery-1.12.js"></script>

<script type="text/javascript">
    function checkCheckBoxList(oSrc, args) {
        var isValid = false;
        $("#<%= CheckBoxListPendidikan.ClientID %> input[type='checkbox']:checked").each(function (i, obj) {
            isValid = true;
        });
        args.IsValid = isValid;
    }
</script>
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiViewMaster" runat="server">
            <asp:View ID="View0" runat="server"><!-- View Kontrol Input -->
     <table>
            <tr>
                <td>
                    <h3>FORM REGISTRASI PELANGGAN</h3>
                </td>
            </tr>
            <tr><!--Nama -->
                <td>
                    <asp:Label ID="LblNama" runat="server" Text="Nama:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtNama" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator2"
                    runat="server"
                    ErrorMessage="Hanya di perbolehkan mengisi huruf"
                    ControlToValidate="TxtNama"
                    ValidationExpression="^[A-Za-z]*$" ></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNama" 
                     runat="server" ErrorMessage="Nama Wajib Di Isi" ControlToValidate="TxtNama">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><!-- Alamat -->
                <td>
                    <asp:Label ID="LblAlamat" runat="server" Text="Alamat:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtAlamat" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAlamat" runat="server" ErrorMessage="Alamat Wajib Di Isi" ControlToValidate="TxtAlamat"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><!-- Jenis Kelamin -->
                <td>
                    <asp:Label ID="LblJenKel" runat="server" Text="Jenis Kelamin:"></asp:Label></td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonListJenKel" runat="server">
                        <asp:ListItem>L</asp:ListItem>
                        <asp:ListItem>P</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorJenKel" runat="server" ErrorMessage="Jenis Kelamin Wajib Di Isi" ControlToValidate="RadioButtonListJenKel"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><!-- Pendidikan -->
                <td>
                    <asp:Label ID="LblPendidikan" runat="server" Text="Pendidikan:"></asp:Label></td>
                <td>
                    <asp:CheckBoxList ID="CheckBoxListPendidikan" runat="server">
                        <asp:ListItem>SD</asp:ListItem>
                        <asp:ListItem>SMP</asp:ListItem>
                        <asp:ListItem>SMA</asp:ListItem>
                        <asp:ListItem>Sarjana</asp:ListItem>
                    </asp:CheckBoxList>
                    <asp:CustomValidator ID="CustomValidatorCheckboxList" runat="server" ErrorMessage="Pilih Salah Satu" ClientValidationFunction="checkCheckBoxList"></asp:CustomValidator>
                </td>
            </tr>
            <tr><!-- Agama -->
                <td>
                    <asp:Label ID="LblAgama" runat="server" Text="Agama:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="DropDownListAgama" runat="server">
                        <asp:ListItem Value="0">Select a Value</asp:ListItem>
                        <asp:ListItem>Islam</asp:ListItem>
                        <asp:ListItem>Kristen</asp:ListItem>
                        <asp:ListItem>Hindu</asp:ListItem>
                        <asp:ListItem>Protestan</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pilih Agama Anda" ControlToValidate="DropDownListAgama" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><!-- Status Pernikahan -->
                <td>
                    <asp:Label ID="LblStatus" runat="server" Text="Status:"></asp:Label></td>
                <td>
                    <asp:ListBox ID="ListBoxStatus" runat="server">
                        <asp:ListItem>Lajang</asp:ListItem>
                        <asp:ListItem>Menikah</asp:ListItem>
                        <asp:ListItem>Duda/Janda</asp:ListItem>
                    </asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Status Wajib DiPilih" ControlToValidate="ListBoxStatus"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><!-- Email -->
                <td>
                    <asp:Label ID="LblEmail" runat="server" Text="Email:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="TxtEmail" ErrorMessage="Email Tidak Boleh Kosong"
                            SetFocusOnError="True" ></asp:RequiredFieldValidator>
                    <!-- Validasi Format Email -->
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                 ErrorMessage="Invalid Email" ControlToValidate="TxtEmail"
                                 SetFocusOnError="True"
                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr><!-- No Telfon -->
                <td>
                    <asp:Label ID="LblTlp" runat="server" Text="Kontak:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtTlp" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Telfon Harus Di Isi" ControlToValidate="TxtTlp"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv" runat="server" ControlToValidate="TxtTlp" Type="Integer"
                       Operator="DataTypeCheck" ErrorMessage="Harus Berupa Angka!" />                    
                </td>
            </tr>
            <tr><!--  Umur -->
                <td>
                    <asp:Label ID="LblUmur" runat="server" Text="Umur Anda:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TxtUmur" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator5" runat="server" ErrorMessage="Umur Wajib Di Isi" ControlToValidate="TxtUmur"></asp:RequiredFieldValidator>
                    <asp:RangeValidator  runat="server" id="ValidaorUmur" controltovalidate="TxtUmur" type="Integer" minimumvalue="17" maximumvalue="85" errormessage="Umur Anda tidak Boleh Kurang dari 17 dan Lebih dari 85" />
                </td>
            </tr>
            <tr><!--  Penyakit -->
                <td>
                    <asp:Label ID="LblPenyakit" runat="server" Text="Riwayat Penyakit:"></asp:Label></td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Ya</asp:ListItem>
                        <asp:ListItem>Tidak</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Pilih Salah Satu"  ControlToValidate="RadioButtonList1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="BtnSubmit" runat="server" Text="Save Data" OnClick="BtnSubmit_Click" />

                </td>
            </tr>
        </table>
            </asp:View>
            <asp:View ID="View1" runat="server"><!-- View Menampilkan Hasil -->
     <table>
            <tr>
                <td>
                    <h3>DATA FORM REGISTRASI PELANGGAN</h3>
                </td>
            </tr>
            <tr><!--Nama -->
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Nama:"></asp:Label></td>
                <td></td>
            </tr>
            <tr><!-- Alamat -->
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Alamat:"></asp:Label></td>
                <td></td>
            </tr>
            <tr><!-- Jenis Kelamin -->
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Jenis Kelamin:"></asp:Label></td>
                <td></td>
            </tr>
            <tr><!-- Pendidikan -->
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                <td></td>
            </tr>
            <tr><!-- Agama -->
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Agama:"></asp:Label></td>
                <td></td>
            </tr>
            <tr><!-- Status Pernikahan -->
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Status:"></asp:Label></td>
                <td></td>
            </tr>
            <tr><!-- Email -->
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Email:"></asp:Label></td>
                <td></td>
            </tr>
            <tr><!-- No Telfon -->
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Telfon:"></asp:Label></td>
                <td></td>
            </tr>
            <tr><!-- Umur -->
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Umur :"></asp:Label></td>
                <td>


                </td>
            </tr>
            <tr><!-- Riwayat -->
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Riwayat Penyakit:"></asp:Label></td>
                <td>


                </td>
            </tr>
        </table>
            </asp:View>
        </asp:MultiView>
   
    </form>
</body>
</html>
