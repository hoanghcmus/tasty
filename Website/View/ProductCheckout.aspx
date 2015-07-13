<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductCheckout.aspx.cs" Inherits="View_ProductCheckout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Shopping Chackout</title>
    <link href="/Styles/CSS/Shopingcart.css" rel="stylesheet" />
</head>
<body style="background: url( '/Design/pageing.png' ) repeat;">
    <form id="formThongTinKhachHang" runat="server">
        <asp:Label ID="lbMessage" runat="server"></asp:Label>
        <div id="confirm" runat="server">
            <div class="Detail_content03">
                <!-- Place Holder 1: Shipping Info -->

                <div class="info checkout">
                    <fieldset class="address">
                        <legend class="title">Thông tin người nhận hàng: </legend>
                        <p>
                            <label for="<%=txtFullName.ClientID %>">Họ Tên</label>
                            <asp:TextBox ID="txtFullName" CssClass="textEntry" runat="server" ControlToValidate="txtFirstName"> </asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtFullName" ID="validatorTenKhachHang" runat="server" ErrorMessage="Tên không được bỏ trống"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <label for="<%=txtEmail.ClientID %>">Email</label>
                            <asp:TextBox ID="txtEmail" CssClass="textEntry" runat="server" ControlToValidate="txtEmail"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="validatorEmailRequire" runat="server" ErrorMessage="Email không được bỏ trống" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="rgValidatorEmailFormat" runat="server" ControlToValidate="txtEmail" ErrorMessage="Nhập email sai định dạng" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                        </p>
                        <p>
                            <label for="<%=txtPhone.ClientID %>">Số điện thoại</label>
                            <asp:TextBox ID="txtPhone" CssClass="textEntry" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="rgValidatorPhoneFormat" runat="server" ControlToValidate="txtPhone" ErrorMessage="Số điện thoại phải là sô nguyên" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </p>
                        <p>
                            <label for="<%=txtAddress.ClientID %>" id="AddressLabel">Địa chỉ</label>
                            <asp:TextBox ID="txtAddress" CssClass="textEntry" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rqValidatorAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Địa chỉ không được bỏ trống"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <label for="<%=txtOtherRequire.ClientID %>" id="Label1">Yêu cầu khác</label>
                            <asp:TextBox ID="txtOtherRequire" CssClass="textEntry" runat="server"></asp:TextBox>
                        </p>
                        <asp:Button ID="btnConfirm" CssClass="button02" Text="Xác nhận đặt hàng" runat="server" OnClick="btnConfirm_Click" />
                    </fieldset>
                </div>

            </div>
        </div>


        <asp:Panel ID="InforConfirmPanel" runat="server" Visible="false">
            <div>
                <div class="Detail_content03">
                    <div class="info checkout">
                        <fieldset class="address">
                            <legend class="title">Giỏ hàng </legend>
                            <asp:Repeater ID="rptGioHang" runat="server">
                                <HeaderTemplate>
                                    <table class="items" id="grid" style="border-collapse: collapse; float: left; width: 100%;" border="0">
                                        <tbody>
                                            <tr>
                                                <th scope="col">Tên sản phẩm</th>
                                                <th scope="col">Hình ảnh</th>
                                                <th scope="col">Đơn giá</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Thành tiền</th>
                                            </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td class="name"><%#Eval("ProductName") %></td>
                                        <td class="name">
                                            <img src="<%#Eval("ThumbNail") %>" alt="<%#Eval("ProductName") %>" width="50" height="30" />
                                        </td>
                                        <td class="smalls">
                                            <span class="red"><%#ShowPosition(Container.DataItem,"giatien") %></span>
                                        </td>
                                        <td class="smalls">

                                            <input type="text" id="txtQuantity" name="txtQuantity" value='<%#ShowPosition(Container.DataItem,"id") %>' class="quantity" maxlength="3" disabled="disabled" />
                                        </td>
                                        <td class="smallmax">
                                            <span class="red"><%#ShowPosition(Container.DataItem,"thanhtien") %></span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr style="background-color: #fff2ff;">
                                        <td class="name"><%#Eval("ProductName") %></td>
                                        <td class="name">
                                            <img src="<%#Eval("ThumbNail") %>" alt="<%#Eval("ProductName") %>" width="50" height="30" />
                                        </td>
                                        <td class="smalls">
                                            <span class="red"><%#ShowPosition(Container.DataItem,"giatien") %></span>
                                        </td>
                                        <td class="smalls">

                                            <input type="text" id="txtQuantity" name="txtQuantity" value='<%#ShowPosition(Container.DataItem,"id") %>' class="quantity" maxlength="3" disabled="disabled" />
                                        </td>
                                        <td class="smallmax">
                                            <span class="red"><%#ShowPosition(Container.DataItem,"thanhtien") %></span>
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                </table>
                                </FooterTemplate>
                            </asp:Repeater>
                            <div class="total">
                                <asp:Label ID="lbTotal" CssClass="cartTotal" runat="server"></asp:Label>
                            </div>
                        </fieldset>

                        <fieldset class="address">
                            <legend class="title">Thông tin người đặt hàng </legend>
                            <p>
                                <label for="<%=lbFullName.ClientID %>">Họ Tên:</label>
                                <asp:Label ID="lbFullName" CssClass="inforlabel" runat="server"> </asp:Label>

                            </p>
                            <p>
                                <label for="<%=lbEmail.ClientID %>">Email:</label>
                                <asp:Label ID="lbEmail" CssClass="inforlabel" runat="server"></asp:Label>

                            </p>
                            <p>
                                <label for="<%=lbPhone.ClientID %>">Số điện thoại:</label>
                                <asp:Label ID="lbPhone" CssClass="inforlabel" runat="server"></asp:Label>

                            </p>
                            <p>
                                <label for="<%=lbAddress.ClientID %>">Địa chỉ:</label>
                                <asp:Label ID="lbAddress" CssClass="inforlabel" runat="server"></asp:Label>

                            </p>
                            <p>
                                <label for="<%=lbOtherRequire.ClientID %>">Yêu cầu khác:</label>
                                <asp:Label ID="lbOtherRequire" CssClass="inforlabel" runat="server"></asp:Label>
                            </p>
                            <asp:HyperLink ID="btnConfirmCart" CssClass="button02" Text="Xác nhận lại đơn hàng" runat="server" NavigateUrl="/View/AddCart.aspx" />
                            <asp:Button ID="btnConfirmInfor" CssClass="button02" Text="Xác nhận lại thông tin người mua hàng" runat="server" OnClick="btnConfirmInfor_Click" />
                            <asp:Button ID="btnMuaHang" CssClass="button02" Text="Mua hàng" runat="server" OnClick="btnMuaHang_Click" />
                        </fieldset>
                    </div>

                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
