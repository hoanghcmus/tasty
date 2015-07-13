<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="MgerOrderDetail.aspx.cs" Inherits="Admin_MgerOrderDetail" %>

<asp:Content ID="Header" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
        <div class="header">
            <h1 class="page-title">
                <asp:Label ID="Label1" runat="server" Text="Thông tin chi tiết đơn hàng" /></h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="Admin.aspx">Trang chủ</a> <span class="divider">>></span></li>
            <li><a href="MgerProduct.aspx">Quản lý sản phẩm</a><span class="divider">>></span></li>
            <li><a href="MgerShopping.aspx">Đơn hàng trực tuyến</a><span class="divider">>></span></li>
            <li>Chi tiết đơn hàng<span class="divider"></span></li>
        </ul>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="content_right">
                    <div class="toolbar">
                    </div>
                    <div class="block">
                        <p class="block-heading">
                            Thông tin mua hàng
                        </p>
                        <div class="toolbar">
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <table class="Edit">
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lbMess" runat="server" Visible="false" />
                                        <asp:Label ID="lblId" runat="server" Visible="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="info">
                                        <strong>Thông tin đơn hàng</strong>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="text" valign="top">Trạng thái đơn hàng:
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="drlTrangThai" AppendDataBoundItems="true" CssClass="drl" Enabled="false">
                                            <asp:ListItem Text="Đang đợi" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Đã duyệt" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Đã hủy" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr class="text">
                                    <td>Ngày order:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtNgayOrder" runat="server" Text="" CssClass="txtsmall" Enabled="false" />
                                    </td>
                                </tr>
                                <tr class="text">
                                    <td>Tổng tiền:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTongTien" runat="server" Text="" CssClass="txtsmall" Enabled="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="info">
                                        <strong>Thông tin khách hàng</strong>
                                    </td>
                                </tr>
                                <tr class="text">
                                    <td>Họ tên:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtHoTen" runat="server" Text="" CssClass="txtsmall" Enabled="false" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHoTen" CssClass="red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="text">
                                    <td>Số điện thoại:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSDT" runat="server" Text="" CssClass="txtsmall" Enabled="false" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSDT" CssClass="red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rgValidatorPhoneFormat" runat="server" ControlToValidate="txtSDT" ErrorMessage="Số điện thoại phải là con số" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr class="text">
                                    <td>Email:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" Text="" CssClass="txtsmall" Enabled="false" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" CssClass="red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rgValidatorEmailFormat" runat="server" ControlToValidate="txtEmail" ErrorMessage="Nhập email sai định dạng" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr class="text">
                                    <td>Địa chỉ:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDiaChi" runat="server" Text="" TextMode="MultiLine" CssClass="txtNew" Enabled="false" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDiaChi" CssClass="red">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="text">
                                    <td>Yêu cầu khác:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtYeuCauThem" runat="server" Text="" TextMode="MultiLine" CssClass="txtNewContent " Enabled="false" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>Chỉnh sửa thông tin</td>
                                    <td>
                                        <asp:Button ID="btnChinhSuaThongTinNguoiMuaHnag" runat="server" Text="Chỉnh sửa thông tin mua hàng" CssClass="hoangbtn" OnClick="btnChinhSuaThongTinNguoiMuaHnag_Click" />
                                        <asp:Button ID="btnLuuThongTinNguoiMuaHang" runat="server" Text="Cập nhật" CssClass="hoangbtn" Visible="false" OnClick="btnLuuThongTinNguoiMuaHang_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Xử lý hóa đơn</td>
                                    <td>
                                        <asp:Button ID="btnDanhDauDoi" runat="server" Text="Đánh dấu đợi" CssClass="hoangbtn" OnClick="btnDanhDau_Click" CommandArgument="0" />

                                        <asp:Button ID="btnDanhDauDuyet" runat="server" Text="Đánh dấu duyệt" CssClass="hoangbtn" OnClick="btnDanhDau_Click" CommandArgument="1" />

                                        <asp:Button ID="btnDanhDauHuy" runat="server" Text="Đánh dấu hủy" CssClass="hoangbtn" OnClick="btnDanhDau_Click" CommandArgument="2" />
                                        <input type="button" value="Đóng" class="hoangbtn" onclick="location.href = 'MgerShopping.aspx'" />
                                    </td>
                                </tr>

                            </table>

                        </div>
                    </div>



                    <div class="block">
                        <p class="block-heading">
                            Chi tiết mua hàng
                        </p>
                        <div class="toolbar">
                            <div>
                                <asp:Repeater ID="rptGioHang" runat="server">
                                    <HeaderTemplate>
                                        <table class="list" id="grid" style="border-collapse: collapse; width: 100%;" border="0">
                                            <tbody>
                                                <tr style="text-align: left; background-color: #2fa6f2;">
                                                    <th scope="col" class="title300">Tên sản phẩm</th>
                                                    <th scope="col" class="img">Hình ảnh</th>
                                                    <th scope="col" class="smallmax">Đơn giá (VNĐ)</th>
                                                    <th scope="col" class="smallmax">Số lượng</th>
                                                    <th scope="col" class="smallmax">Thành tiền</th>
                                                </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr class="eventop">
                                            <td class="title300"><%#Eval("TenSanPham") %></td>
                                            <td class="img">
                                                <img src="<%#Eval("HinhAnh") %>" alt="<%#Eval("TenSanPham") %>" width="50" height="30" />
                                            </td>
                                            <td class="smallmax">
                                                <span><%#showMoney(Convert.ToDecimal( Eval("DonGia"))) %></span>
                                            </td>
                                            <td class="smallmax">

                                                <input type="text" id="txtQuantity" name="txtQuantity" value='<%#Eval("SoLuong")%>' maxlength="3" disabled="disabled" style="text-align: center;" />
                                            </td>
                                            <td class="smallmax">
                                                <span class="red"><%#showMoney(Convert.ToDecimal( Eval("ThanhTien"))) %></span>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <tr class="evenbottom">
                                            <td class="title300"><%#Eval("TenSanPham") %></td>
                                            <td class="img">
                                                <img src="<%#Eval("HinhAnh") %>" alt="<%#Eval("TenSanPham") %>" width="50" height="30" />
                                            </td>
                                            <td class="smallmax">
                                                <span><%#showMoney(Convert.ToDecimal( Eval("DonGia"))) %></span>
                                            </td>
                                            <td class="smallmax">

                                                <input type="text" id="txtQuantity" name="txtQuantity" value='<%#Eval("SoLuong")%>' maxlength="3" disabled="disabled" style="text-align: center;" />
                                            </td>
                                            <td class="smallmax">
                                                <span class="red"><%#showMoney(Convert.ToDecimal( Eval("ThanhTien"))) %></span>
                                            </td>
                                        </tr>
                                    </AlternatingItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                                <div style="font-family: Tahoma; font-size: 14px; font-weight: bold; width: 100%; text-align: right;">
                                    <asp:Literal ID="ltrTongHoaDon" runat="server"></asp:Literal>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
    </div>
</asp:Content>

