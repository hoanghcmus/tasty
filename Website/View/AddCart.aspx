<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCart.aspx.cs" Inherits="View_AddCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Shopping cart</title>
    <link href="/Styles/CSS/Shopingcart.css" rel="stylesheet" />
</head>
<body style="background: url('/Design/pageing.png') repeat;">
    <form id="AddCartForm" runat="server">
        <div>
            <div class="title_producthot">
                <asp:Label ID="lbTitle" CssClass="title" runat="server">Giỏ hàng của bạn</asp:Label>
            </div>

            <asp:Label ID="lbMessage" runat="server"></asp:Label>
            <div class="content_producthot">
                <div class="cart">
                    <span id="lblStatus" class="status"></span>
                    <div>
                        <asp:Repeater ID="rptGioHang" runat="server">
                            <HeaderTemplate>
                                <table class="items" id="grid" style="border-collapse: collapse;" border="0">
                                    <tbody>
                                        <tr>
                                            <th scope="col">Tên sản phẩm</th>
                                            <th scope="col">Hình ảnh</th>
                                            <th scope="col">Đơn giá</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                            <th scope="col">Xóa</th>
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

                                        <input type="text" id="txtQuantity" name="txtQuantity" value='<%#ShowPosition(Container.DataItem,"id") %>' class="quantity" maxlength="3" />
                                    </td>
                                    <td class="smallmax">
                                        <span class="red"><%#ShowPosition(Container.DataItem,"thanhtien") %></span>
                                    </td>
                                    <td class="smalls">
                                        <input type='checkbox' name='cbDelProd' value='<%#Eval("ID") %>' />
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

                                        <input type="text" id="txtQuantity" name="txtQuantity" value='<%#ShowPosition(Container.DataItem,"id") %>' class="quantity" maxlength="3" />
                                    </td>
                                    <td class="smallmax">
                                        <span class="red"><%#ShowPosition(Container.DataItem,"thanhtien") %></span>
                                    </td>
                                    <td class="smalls">
                                        <input type='checkbox' name='cbDelProd' value='<%#Eval("ID") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>

                    </div>

                    <div class="total">
                        <asp:Label ID="lbTotal" CssClass="cartTotal" runat="server"></asp:Label>
                    </div>
                    <div class="toolbar">
                        <asp:Button ID="btnUpdate" CssClass="button" Text="Cập nhật giỏ hàng" runat="server" OnClick="btnUpdate_Click" />
                        <a id="hlOrder" class="linkbutton" href="/View/ProductCheckout.aspx" runat="server">Đặt hàng</a>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
