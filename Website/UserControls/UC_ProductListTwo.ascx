<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_ProductListTwo.ascx.cs" Inherits="UserControls_ProductListTwo" %>

<div class="product-list-wrapper">
    <div class="product-list-header">
        <div class="product-cat-title">
            <h1>
                <asp:Label ID="lbCategoryTitle" runat="server"></asp:Label></h1>
        </div>
        <div class="view-all">
            <asp:HyperLink ID="lbtViewAll" runat="server" CssClass="link"><span>Xem tất cả</span></asp:HyperLink>
        </div>
    </div>
    <div class="product-list-content">


        <div class="list-item-wrapper-full">
            <asp:Repeater ID="rptProductList" runat="server" OnItemDataBound="rptProductList_ItemDataBound">
                <ItemTemplate>
                    <div class="product-item-small">
                        <asp:Literal ID="ltrIsNew" runat="server"></asp:Literal>
                        <div class="product-above">
                            <a href="/<%#Eval("ProductCategoryID") %>/<%#Eval("ID") %>/detail-product.html" class="link">
                                <img src="<%#Eval("Thumbnail") %>" alt="Product" class="img" />
                                <h1><%#Eval("ProductName") %></h1>
                            </a>
                        </div>
                        <div class="product-under">
                            <p class="old-price"><%#showMoney(Convert.ToDecimal(Eval("OldPrice")))%>&nbsp;VNĐ</p>
                            <p class="new-price"><%#showMoney(Convert.ToDecimal(Eval("NewPrice")))%>&nbsp;VNĐ</p>
                            <div class="discount">
                                <p>-<%#Eval("Discount") %>%</p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</div>
