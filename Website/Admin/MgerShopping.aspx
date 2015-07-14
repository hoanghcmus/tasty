<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="MgerShopping.aspx.cs" Inherits="Admin_MgerShopping" %>

<%@ Register Src="~/Admin/Mger_UserControl/UC_PhanTrang.ascx" TagPrefix="uc1" TagName="UC_PhanTrang" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="header">
            <h1 class="page-title">
                <asp:Label ID="Label1" runat="server" Text="Không có thư nào!" /></h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="Admin.aspx">Trang chủ</a> <span class="divider">>></span></li>
            <li class="active">Quản lý sản phẩm<span class="divider">>></span></li>
            <li class="active">Đơn hàng trực tuyến<span class="divider">>></span></li>
        </ul>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="content_right">
                    <div class="toolbar">
                        Hiển thị tất cả các đơn hàng giới hạn theo ngày:<asp:Label ID="lblStatus" runat="server"
                            CssClass="red" /><br />
                        <asp:TextBox runat="server" ID="txtStartDate" CssClass="txtsmall" />
                        đến
                        <asp:TextBox runat="server" ID="txtEndDate" CssClass="txtsmall" />
                        <asp:Button Text="Hiển thị" runat="server" ID="btnGetByDate" CssClass="btnsmall" />
                        <asp:RangeValidator ID="rangeStartDate" ErrorMessage="Ngày bắt đầu không hợp lệ"
                            ControlToValidate="txtStartDate" Display="None" MinimumValue="1/1/2014" MaximumValue="1/1/2020"
                            runat="server" Type="Date" />
                        <asp:RangeValidator ID="rangeEndDate" ErrorMessage="Ngày kết thúc không hợp lệ" ControlToValidate="txtEndDate"
                            Display="None" MinimumValue="1/1/2014" MaximumValue="1/1/2020" runat="server"
                            Type="Date" />
                        <asp:CompareValidator ID="cmpDate" ErrorMessage="Ngày bắt đầu phải nhỏ hơn ngày kết thúc!"
                            Display="None" ControlToValidate="txtStartDate" ControlToCompare="txtEndDate"
                            Operator="LessThan" Type="Date" runat="server" />
                        <asp:ValidationSummary ID="validationSummary" ShowMessageBox="true" ShowSummary="false"
                            runat="server" HeaderText="Lỗi! ngày không hợp lệ:" CssClass="red" />
                        <hr />
                        <asp:DropDownList runat="server" ID="ddlCategory" AutoPostBack="true" AppendDataBoundItems="true"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CssClass="drl">
                            <asp:ListItem>Chọn xem quản lý đơn hàng</asp:ListItem>
                            <asp:ListItem Value="0">Đơn hàng đợi duyệt</asp:ListItem>
                            <asp:ListItem Value="1">Đơn hàng đã duyệt</asp:ListItem>
                            <asp:ListItem Value="2">Đơn hàng đã hủy</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button Text="Xóa đơn hàng đã chọn" runat="server" ID="btnDelete" CssClass="multidelete" />
                        <input type="button" value="Làm mới" class="btnedit" onclick="location.href = 'MgerShopping.aspx'" />
                    </div>
                    <div class="block">
                        <p class="block-heading">
                            Danh sách đơn hàng khách hàng
                        </p>
                        <div class="helpDatHang">
                            Chú ý: <span class="red">Chữ đỏ: Đơn hàng đợi duyệt </span><span>Chữ thường: Đơn hàng
                                đã duyệt</span><span class="textoverline">Chữ gạch: Đơn hàng đã hủy</span>
                        </div>
                        <table class="list">
                            <thead>
                                <tr>
                                    <th class="cid">
                                        <input type="checkbox" id="chkAll" />
                                    </th>
                                    <th class="title300">Họ tên khách hàng
                                    </th>
                                    <th class="title300">Địa chỉ
                                    </th>
                                    <th class="smallmax">Điện thoại
                                    </th>
                                    <th class="smallmax">Email
                                    </th>
                                    <th class="smallmax">Tổng hóa đơn
                                    </th>
                                    <th class="smallmax">Ngày gửi
                                    </th>
                                    <th class="small">ID
                                    </th>
                                    <th class="smallmax">Duyệt
                                    </th>
                                </tr>
                            </thead>
                            <asp:Repeater runat="server" ID="repProd">
                                <AlternatingItemTemplate>
                                    <tr class="eventop">
                                        <td>
                                            <input type="checkbox" name='cid' value='<%#Eval("ID") %>' />
                                        </td>
                                        <td class="title300">
                                            <%#ShowShopping(Container.DataItem,"Ten")%>
                                        </td>
                                        <td class="title300">
                                            <%#Eval("DiaChi")%>
                                        </td>
                                        <td class="smallmax">
                                            <%#Eval("SDT")%>
                                        </td>
                                        <td class="smallmax">
                                            <%#Eval("Email")%>
                                        </td>
                                        <td class="smallmax">
                                            <%#Eval("TongHoaDon","{0:0,0}")%> VNĐ
                                        </td>
                                        <td class="smallmax">
                                            <%#Convert.ToDateTime(Eval("NgayOrder")).ToShortDateString()%>
                                        </td>
                                        <td class="small">
                                            <%#Eval("ID")%>
                                        </td>
                                        <td class="idmax">
                                            <a href='MgerOrderDetail.aspx?orderID=<%#Eval("ID") %>' class='lnk'>
                                                <i class="icon-pencil"></i></a>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <ItemTemplate>
                                    <tr class="evenbottom">
                                        <td>
                                            <input type="checkbox" name='cid' value='<%#Eval("ID") %>' />
                                        </td>
                                        <td class="title300">
                                            <%#ShowShopping(Container.DataItem,"Ten")%>
                                        </td>
                                        <td class="title300">
                                            <%#Eval("DiaChi")%>
                                        </td>
                                        <td class="smallmax">
                                            <%#Eval("SDT")%>
                                        </td>
                                        <td class="smallmax">
                                            <%#Eval("Email")%>
                                        </td>
                                        <td class="smallmax">
                                            <%#Eval("TongHoaDon","{0:0,0}")%> VNĐ
                                        </td>
                                        <td class="smallmax">
                                            <%#Convert.ToDateTime(Eval("NgayOrder")).ToShortDateString()%>
                                        </td>
                                        <td class="small">
                                            <%#Eval("ID")%>
                                        </td>
                                        <td class="idmax">
                                            <a href='MgerOrderDetail.aspx?orderID=<%#Eval("ID") %>' class='lnk'>
                                                <i class="icon-pencil"></i></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                    <uc1:UC_PhanTrang runat="server" ID="PagerBottom" />
                    <br />
                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
    </div>
</asp:Content>

