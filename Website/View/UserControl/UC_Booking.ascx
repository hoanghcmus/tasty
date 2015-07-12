<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Booking.ascx.cs" Inherits="En_En_Control_UC_CheckRate" %>
<div class="table-booking-block">
    <asp:UpdatePanel ID="UpdatePanelBooking" runat="server">
        <ContentTemplate>
            <asp:Label ID="lbBookingMess" runat="server" CssClass="booking-mess"></asp:Label>
            <table class="booking-table">
                <tr class="line-fix-parent-width">
                    <td class="booking-lable">
                        <asp:Label runat="server" ID="lbName" Text="<%$ Resources:Resource, name %>"></asp:Label></td>
                    <td class="booking-input">
                        <asp:TextBox ID="custumerName" runat="server" CssClass="text-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validateName" runat="server" ControlToValidate="custumerName" ValidationGroup="booking" ErrorMessage="Vui lòng nhập họ tên!" CssClass="error">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="line-fix-parent-width">
                    <td class="booking-lable">
                        <asp:Label runat="server" ID="Label1" Text="<%$ Resources:Resource, address %>"></asp:Label></td>
                    <td class="booking-input">
                        <asp:TextBox ID="Address" runat="server" CssClass="text-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validateAddress" runat="server" ControlToValidate="Address" ValidationGroup="booking" ErrorMessage="Vui lòng nhập địa chỉ!" CssClass="error">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="line-fix-parent-width">
                    <td class="booking-lable">
                        <asp:Label runat="server" ID="Label2" Text="<%$ Resources:Resource, email %>"></asp:Label></td>
                    <td class="booking-input">
                        <asp:TextBox ID="Email" runat="server" CssClass="text-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validateEmail" runat="server" ControlToValidate="Email" ValidationGroup="booking" ErrorMessage="Vui lòng nhập email!" CssClass="error">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="validateEmailExp" runat="server" ControlToValidate="Email" ValidationGroup="contact" ErrorMessage="Email Không đúng!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr class="line-fix-parent-width">
                    <td class="booking-lable">
                        <asp:Label runat="server" ID="Label3" Text="<%$ Resources:Resource, phone %>"></asp:Label></td>
                    <td class="booking-input">
                        <asp:TextBox ID="Phone" runat="server" CssClass="text-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validatePhone" runat="server" ControlToValidate="Phone" ValidationGroup="booking" ErrorMessage="Vui lòng nhập số điện thoại!" CssClass="error">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="validatePhoneExp" runat="server" CssClass="error" Operator="DataTypeCheck" ControlToValidate="Phone" ValidationGroup="booking" Type="Integer">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr class="line-fix-parent-width">
                    <td class="booking-lable">
                        <asp:Label runat="server" ID="Label4" Text="<%$ Resources:Resource, amount %>"></asp:Label></td>
                    <td class="booking-input">
                        <asp:TextBox ID="Amount" runat="server" CssClass="text-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validateAmount" runat="server" ControlToValidate="Amount" ValidationGroup="booking" ErrorMessage="Vui lòng nhập số người!" CssClass="error">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="line-fix-parent-width">
                    <td class="booking-lable">
                        <asp:Label runat="server" ID="Label5" Text="<%$ Resources:Resource, date %>"></asp:Label></td>
                    <td class="booking-input">
                        <asp:TextBox ID="Date" runat="server" CssClass="text-input chose-date" onfocus="datNgay();" onclick="datNgay();"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validateDate" runat="server" ControlToValidate="Date" ValidationGroup="booking" ErrorMessage="Vui lòng nhập ngày!" CssClass="error">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="line-fix-parent-width">
                    <td class="booking-lable">
                        <asp:Label runat="server" ID="Label6" Text="<%$ Resources:Resource, hour %>"></asp:Label></td>
                    <td class="booking-input">
                        <asp:TextBox ID="Hour" runat="server" CssClass="text-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validateHour" runat="server" ControlToValidate="Hour" ValidationGroup="booking" ErrorMessage="Vui lòng nhập giờ!" CssClass="error">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="line-fix-parent-width">
                    <td class="booking-lable"></td>
                    <td class="booking-input">

                        <asp:Button ID="btnReserv" runat="server" Text="<%$ Resources:Resource, submit %>" CssClass="btnBooking" OnClick="btnReserv_Click" ValidationGroup="booking" />
                        <asp:Button ID="btnFormat" runat="server" Text="<%$ Resources:Resource, delete %>" CssClass="btnBooking" OnClick="btnFormat_Click" />
                    </td>
                </tr>
            </table>

            <div class="booking-title-bar">
                <h3><%=Resources.Resource.table_booking_online %> <%--<asp:Label ID="lbHeadTitle" runat="server" Text="<%$ Resources:Resource, table_booking_online %>" ></asp:Label>--%></h3>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</div>


<%-- Script cho datepicker chọn ngày tháng --%>
<link href="/Styles/multies/jquery.datetimepicker.css" rel="stylesheet" />
<script src="/Styles/multies/jquery.datetimepicker.js"></script>
<script src="/Styles/multies/jquery.easyui.min.js"></script>
<script>
    $(document).ready(function () {
        $('.chose-date').datetimepicker({
            lang: 'vi',
            timepicker: false,
            format: 'd/m/Y'
        });
    });

    function datNgay() {
        $('.chose-date').datetimepicker({
            lang: 'vi',
            timepicker: false,
            format: 'd/m/Y'
        });
    }
</script>
