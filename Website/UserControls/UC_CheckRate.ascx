<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_CheckRate.ascx.cs" Inherits="En_En_Control_UC_CheckRate" %>

<div class="right-footer-reservation">
    <div class="right-footer-reservation-wraper">
        <p>Thông tin đặt phòng</p>
        <div class="reservation-input">
            <div class="input-icon">
                <label for="ctl00_ctl00_UC_CheckRate1_txtCheckInDate">
                    <img src="/Design/date.png" alt="Choose" class="date" />
                </label>
            </div>
            <asp:TextBox ID="txtCheckInDate" runat="server" CssClass="chose-date" placeholder="Ngày đến"></asp:TextBox>
            <%--<input type="text" class="chose-date" placeholder="Check-in date" id="in" />--%>
        </div>
        <div class="reservation-input">
            <div class="input-icon">
                <label for="ctl00_ctl00_UC_CheckRate1_txtCheckOutDate">
                    <img src="/Design/date.png" alt="Choose" class="date" />
                </label>
            </div>

            <asp:TextBox ID="txtCheckOutDate" runat="server" CssClass="chose-date" placeholder="Ngày đi"></asp:TextBox>
            <%--<input type="text" class="chose-date" placeholder="Check-out date" id="out" />--%>
        </div>
        <div class="reservation-input half">
            <div class="input-icon">
                <img src="/Design/down-arrow-black.png" alt="Choose" class="number" />
            </div>


            <asp:DropDownList ID="drlAdult" runat="server" CssClass="select-number">
                <asp:ListItem Value="0" disabled="disabled" Selected="True">Người lớn</asp:ListItem>
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList>


        </div>
        <div class="reservation-input half" style="margin-right: 0;">
            <div class="input-icon">
                <img src="/Design/down-arrow-black.png" alt="Choose" class="number" />
            </div>

            <asp:DropDownList ID="drlChild" runat="server" CssClass="select-number">
                <asp:ListItem Value="0" Selected="True" disabled="disabled">Trẻ em</asp:ListItem>
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList>

        </div>
        <asp:Label ID="lbMess" runat="server"></asp:Label>

        <asp:Button ID="btCheckRate" runat="server" CssClass="btnCheckRate" Text="Kiểm tra" OnClick="btCheckRate_Click" />
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
