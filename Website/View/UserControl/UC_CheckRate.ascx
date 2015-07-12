<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_CheckRate.ascx.cs" Inherits="En_En_Control_UC_CheckRate" %>

<div class="right-footer-reservation">
    <div class="right-footer-reservation-wraper">
        <p>
            <asp:Literal ID="ltTitle" runat="server" Text="<%$Resources:Resource,reserve_info %>"></asp:Literal></p>
        <div class="reservation-input">
            <div class="input-icon">
                <label for="ctl00_ctl00_MainContent_MainContent_UC_CheckRate_txtCheckInDate">
                    <img src="/Design/date.png" alt="Choose" class="date" />
                </label>
            </div>
            <asp:TextBox ID="txtCheckInDate" runat="server" CssClass="chose-date" placeholder="<%$Resources:Resource,check_in_date %>"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtCheckInDate" ValidationGroup="checkrate">*</asp:RequiredFieldValidator>
        </div>
        <div class="reservation-input">
            <div class="input-icon">
                <label for="ctl00_ctl00_MainContent_MainContent_UC_CheckRate_txtCheckOutDate">
                    <img src="/Design/date.png" alt="Choose" class="date" />
                </label>
            </div>

            <asp:TextBox ID="txtCheckOutDate" runat="server" CssClass="chose-date" placeholder="<%$Resources:Resource,check_out_date %>"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCheckOutDate" ValidationGroup="checkrate">*</asp:RequiredFieldValidator>
        </div>
        <div class="reservation-input half">

            <asp:DropDownList ID="drlAdult" runat="server" CssClass="select-number">
                <asp:ListItem Value="0" disabled="disabled" Selected="True" Text="<%$Resources:Resource,adult %>"></asp:ListItem>
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="drlAdult" ValidationGroup="checkrate">*</asp:RequiredFieldValidator>
        </div>
        <div class="reservation-input half" style="margin-right: 0;">

            <asp:DropDownList ID="drlChild" runat="server" CssClass="select-number">
                <asp:ListItem Value="0" Selected="True" disabled="disabled" Text="<%$Resources:Resource,child %>"></asp:ListItem>
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList>

        </div>
        <asp:Label ID="lbMess" runat="server"></asp:Label>

        <asp:Button ID="btCheckRate" runat="server" CssClass="btnCheckRate" Text="<%$Resources:Resource,reserv %>" OnClick="btCheckRate_Click" ValidationGroup="checkrate" />
    </div>
</div>

<%-- Script cho datepicker chọn ngày tháng --%>
<link href="/Styles/multies/jquery.datetimepicker.css" rel="stylesheet" />
<script src="/Styles/multies/jquery.datetimepicker.js"></script>
<script src="/Styles/multies/jquery.easyui.min.js"></script>
<script>
    jQuery('.chose-date').datetimepicker({
        lang: 'vi',
        timepicker: false,
        format: 'd/m/Y'
    });
</script>
