<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sesi2_WebControlASP.aspx.cs" Inherits="Sesi2_WebControlASP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sesi 2 Web Control</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Sesi 2 Web Control</h1>
        </div>


        <asp:MultiView ID="MultiViewMaster" runat="server">
            <asp:View ID="View0" runat="server">
                        <div>
            <table>
                <tr><!-- Hyperlink-->
                    <td>
                        <asp:Label ID="LblTxtHyperlink" runat="server" Text="Contoh Hyperlink"></asp:Label>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" ></asp:HyperLink>
                    </td>
                </tr>
                <tr><!-- Penjumlahan -->
                    <td>
                        <asp:Label ID="LblTxtAngka" runat="server" Text="Masukan Angka"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtAngka1Form" runat="server" Height="10px"></asp:TextBox>
                        
                        <br />
                        <asp:TextBox ID="TxtAngka2Form" runat="server" Height="10px"></asp:TextBox>
                        <br />
                        <asp:Label ID="LblHasil" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblTxtPswd" runat="server" Text="Masukan Password" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPasswordForm" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblImageBtn" runat="server" Text="Image Button"></asp:Label>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButtonForm" runat="server" Height="90px" Width="70px" OnClick="ImageButtonForm_Click" />
                        <asp:ImageButton ID="ImageButton1" runat="server" visible="false"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblImage" runat="server" Text="Image" ></asp:Label>
                    </td>
                    <td>
                        <asp:Image ID="ImageForm" runat="server" Height="300px" Width="500px"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblCheckbox" runat="server" >CheckBox dan CheckBox List</asp:Label>

                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBoxForm" runat="server" Value="CheckBox"/>
                        <asp:HiddenField ID="HiddenFieldCheckBoxForm" runat="server" Value="RED"/>
                        <br />
                        <asp:CheckBoxList ID="CheckBoxListForm" runat="server">
                            <asp:ListItem Value="CL1">Pilihan 1</asp:ListItem>
                            <asp:ListItem Value="CL2">Pilihan 2 </asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblRadioButton" runat="server" >Radio Button dan Radio Button List</asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="RadioButtonForm" runat="server" Value="BLUE"/>
                        <asp:HiddenField ID="HiddenFieldRadioButtonForm" runat="server" Value="BLUE"/>
                        <br />
                        <asp:RadioButtonList ID="RadioButtonListForm" runat="server">
                            <asp:ListItem Value="RL1">Pilihan 1</asp:ListItem>
                            <asp:ListItem Value="RL2">Pilihan 2</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblDropdownList" runat="server" >DropDown List</asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListForm" runat="server">
                            <asp:ListItem Value="">Pilih Salah Satu</asp:ListItem>
                            <asp:ListItem Value="DD1">Pilihan 1</asp:ListItem>
                            <asp:ListItem Value="DD2">Pilihan 2</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblListBox" runat="server" Text="List Box"></asp:Label>
                    </td>
                    <td>
                        <asp:ListBox ID="ListBoxForm" runat="server" SelectionMode="Single">
                            <asp:ListItem Value="LB1">Pilihan 1</asp:ListItem>
                            <asp:ListItem Value="LB2">Pilihan 2</asp:ListItem>
                            <asp:ListItem Value="LB3">Pilihan 3</asp:ListItem>
                            <asp:ListItem Value="LB4">Pilihan 4</asp:ListItem>
                            <asp:ListItem Value="LB5">Pilihan 5</asp:ListItem>
                            <asp:ListItem Value="LB6">Pilihan 6</asp:ListItem>
                        </asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LblFileUploader" runat="server" Text="File Uploader"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUploadForm" runat="server" />
                        <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server"
                        ControlToValidate="FileUploadForm"
                        ErrorMessage="Only .jpg,.png,.jpeg,.gif Files are allowed" Font-Bold="True"
                        Font-Size="Medium"
                        ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnSubmitForm" runat="server" Text="Submit" OnClick="BtnSubmitForm_Click" />
                    </td>
                </tr>
            </table>
        </div>
            </asp:View>
            <asp:View ID="View1" runat="server">
                <table>
                    <tr>
                        <td>
                            Hasil Operasi : 
                            <asp:Label ID="LblHasilOperasi" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasil Password:
                            <asp:Label ID="LblHasilPswd" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasil Checkbox :
                            <asp:Label ID="LblHasilChk" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasil List Checkbox :
                            <asp:Label ID="LblHasilChkList" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasil Rb :
                            <asp:Label ID="LblHasilRadio" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasil RB List :
                            <asp:Label ID="LblHasilRadioList" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasi DD:
                            <asp:Label ID="LblHasilDropD" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasil LB:
                            <asp:Label ID="LblHasilListButton" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hasil FileUp:
                            <asp:Label ID="LblHasilFileUp" runat="server" Text="No Value"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="BtnBack" runat="server" Text="Kembali" OnClick="BtnBack_Click" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>

    </form>
</body>
</html>
