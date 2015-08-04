<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="View_ProductDetail" %>

<%@ Register Src="~/UserControls/UC_ProductListThree.ascx" TagPrefix="uc1" TagName="UC_ProductListThree" %>

<asp:Content ID="Header" ContentPlaceHolderID="HeadExtender" runat="Server">
    <link href="/Styles/Magiczoom/magiczoom.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Background" ContentPlaceHolderID="BackGroundPlaceHolder" runat="Server">
    <div class="bg-sub"></div>
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="Server">
    <span id="a"></span>
    <div class="product product1">
        <div class="content-container">
            <div class="product-detail">
                <%--  <div class="product-detail-header">
                    <h1>
                        <asp:Literal ID="ltrTenSanPham" runat="server" Text="Tiêu đề sản phẩm"></asp:Literal>
                    </h1>
                </div>--%>
                <div class="product-detail-wrapper">
                    <%--<div class="thumms">

                        <asp:Repeater ID="rptListImg" runat="server">
                            <ItemTemplate>
                                <div class="thumb <%#Container.ItemIndex == 0 ? "thumb-active" : "" %>">
                                    <a href="<%#Eval("HinhAnh") %>" rel="zoom-id:<%=figureLarge.ClientID %>; disable-zoom: true;" rev="<%#ToThumb(Eval("HinhAnh").ToString()) %>" class="link tlink">
                                        <img src="<%#ToThumb(Eval("HinhAnh").ToString()) %>" class="img" />
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="figure">
                        <div class="figure-wrapper">
                            <a href="#" class="MagicZoom link" id="figureLarge" rel="zoom-width:0; zoom-height:0; zoom-distance:40; disable-zoom: true;" runat="server">
                                <img src="#" id="figureThumb" class="" runat="server" /></a>
                        </div>
                    </div>--%>

                    <div class="product-figure">
                        <img src="#" alt="Figure" id="figure" runat="server" />
                    </div>

                    <div class="product-infos">
                        <div class="line-fix-parent-width">
                            <div class="product-label">Tên sản phẩm:</div>
                            <div class="product-info">
                                <asp:Literal ID="ltrTenSanPham" runat="server"></asp:Literal>
                            </div>
                        </div>

                        <div class="line-fix-parent-width">
                            <div class="product-label">Giá bán:</div>
                            <div class="product-info">
                                <div class="product-under">
                                    <p class="old-price">
                                        <asp:Literal ID="ltrOldPrice" runat="server"></asp:Literal>&nbsp;VNĐ
                                    </p>

                                </div>
                            </div>
                        </div>
                        <div class="line-fix-parent-width">
                            <div class="product-label">Mô tả:</div>
                            <div class="product-info">
                                <asp:Literal ID="ltrMoTa" runat="server"></asp:Literal>
                            </div>
                        </div>

                        <div class="line-fix-parent-width">
                            <div class="product-label" style="border: none">Chi tiết:</div>
                            <div class="product-info" style="clear: both; width: 100%; text-align: justify; border: none; margin: 0;">
                                <asp:Literal ID="ltrChiTietSanPham" runat="server">
                                </asp:Literal>
                            </div>
                        </div>

                        <div class="line-fix-parent-width">
                            <div class="buy">
                                <a href="/View/AddCart.aspx?pid=<%=getPid()%>" data-fancybox-type="iframe" class="link" id="btn-shopping-cart"><span>Đặt hàng</span></a>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Footer" ContentPlaceHolderID="FootExtender" runat="Server">

    <%-- Load page content when click item on the right --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".tlink").click(function () {
                $(".thumb-active").removeClass("thumb-active");
                $(this).parent().addClass("thumb-active");
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#btn-shopping-cart").fancybox({
                maxWidth: 1349,
                maxHeight: 630,
                fitToView: false,
                width: '818px',
                height: '519px',
                autoSize: false,
                closeClick: false,
                openEffect: 'none',
                closeEffect: 'none'
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".product-infos").niceScroll();
        });

    </script>

    <script src="/Styles/Magiczoom/magiczoomplus.js"></script>
</asp:Content>

