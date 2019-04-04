<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Datetimepicker.aspx.cs" Inherits="Datetimepicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Datetimepicker -->
  <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>
    <link href="css/jquery-ui.css" rel="stylesheet" />
<%--  <link rel="stylesheet" href="/resources/demos/style.css">--%>
<%--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script src="js/jquery-1.12.4.js"></script>
<%--  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
    <script src="js/jquery-ui.js"></script>
    <!-- Datatable -->
<%--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>--%>
    <link href="DataTable/datatables.min.css" rel="stylesheet" />
<%--<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>--%>
    <script src="DataTable/datatables.min.js"></script>
    <!-- Bootsrap -->
    <link href="Bootsrap/bootstrap.min.css" rel="stylesheet" />
<%--    <script src="Bootsrap/jquery.min.js"></script>--%>
    <script src="Bootsrap/bootstrap.min.js"></script>
    <script src="Bootsrap/popper.min.js"></script>
    <!-- Semantic UI -->
    <link href="SemanticUi/dataTables.semanticui.min.css" rel="stylesheet" />
    <script src="SemanticUi/dataTables.semanticui.min.js"></script>
    <link href="SemanticUi/semantic.min.css" rel="stylesheet" />
    <script src="SemanticUi/semantic.min.js"></script>
<script>
    $(function() {
        $("#<%= TxtTglLahir.ClientID %>").datepicker({
            changeMonth: true,
        changeYear: true
        });
});
</script>
<script>
    //$(document).ready(function () {
    //    $('#table_id').DataTable();
    //});
    $(document).ready(function () {
        $.fn.dataTable.ext.search.push(
        function (settings, data, dataIndex) {
            var min = $('#min').datepicker("getDate");
            var max = $('#max').datepicker("getDate");
            var startDate = new Date(data[4]);
            if (min == null && max == null) { return true; }
            if (min == null && startDate <= max) { return true; }
            if (max == null && startDate >= min) { return true; }
            if (startDate <= max && startDate >= min) { return true; }
            return false;
        }
        );


        $("#min").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });
        $("#max").datepicker({ onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true });
        var table = $('#table_id').DataTable();

        // Event listener to the two range filtering inputs to redraw on input
        $('#min, #max').change(function () {
            table.draw();
        });
    });
</script>

<style>
    body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
        <div style="width:100px;padding-bottom:10px" >
            <p>Date: <asp:TextBox ID="TxtTglLahir" class="form-control" runat="server" ReadOnly="true" ></asp:TextBox></p>
        </div>
        <div class="row">
            <div class="col-sm-2">Masukan Range Tanggal: </div>
            <div class="col-sm-3"><input  name="min" id="min" class="form-control" type="text" autocomplete="off"><br /></div>
            <div class="col-sm-3"><input  name="max" id="max" class="form-control" type="text"  autocomplete="off"></div>       
        </div>
        <div class="col">
            <table id="table_id" class="table-border hover">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Tiger Nixon</td>
                        <td>System Architect</td>
                        <td>Edinburgh</td>
                        <td>61</td>
                        <td>04/01/2019</td>
                        <td>$320,800</td>
                    </tr>
                    <tr>
                        <td>Garrett Winters</td>
                        <td>Accountant</td>
                        <td>Tokyo</td>
                        <td>63</td>
                        <td>04/02/2019</td>
                        <td>$170,750</td>
                    </tr>
                    </tbody>
                </table>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-sm-3">
                    <asp:DropDownList ID="DropDownList1"  class="form-control  dropdown-toggle" Width="100px" runat="server">
                        <asp:ListItem Value="1">Aktif</asp:ListItem>
                        <asp:ListItem Value="0">Non Aktif</asp:ListItem>
                    </asp:DropDownList></div>
            </div>
        </div>
        <div class="form-group">
                <div class="col=sm-3"><asp:Button ID="btnUpdate" class="btn btn-secondary" runat="server" Text="Update Status" OnClick="btnUpdate_Click" /></div>
        </div>
    </div>
    </form>
</body>
</html>
