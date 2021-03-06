﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="View_ProductList" %>

<%@ Register Src="~/UserControls/UC_ProductListTwo.ascx" TagPrefix="uc1" TagName="UC_ProductListTwo" %>


<asp:Content ID="Header" ContentPlaceHolderID="HeadExtender" runat="Server">
    <script src="/Styles/ScrollBox/jquery.scrollbox.js"></script>
</asp:Content>
<asp:Content ID="Background" ContentPlaceHolderID="BackGroundPlaceHolder" runat="Server">
    <div class="bg-sub"></div>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="Server">
    <span id="a"></span>
    <div class="product">
        <div id="sanpham" class="scroll-img">
            <ul>
                <asp:Repeater ID="rptProductList" runat="server">
                    <ItemTemplate>
                        <li>
                            <a href="/<%#Eval("ProductCategoryID") %>/<%#Eval("ID") %>/detail-product.html">
                                <img src="<%#Eval("Thumbnail") %>" alt="img" class="proimg<%#Container.ItemIndex %>" />
                                <div class="pro-title">
                                    <h1><%#Eval("ProductName") %></h1>
                                </div>
                            </a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>

            </ul>
        </div>
        <div id="sanpham-btn" class="text-center">
            <a href="javascript:void();" class="nextpre pre" id="sanpham-forward">&lsaquo; </a>
            <a href="javascript:void();" class="nextpre next" id="sanpham-backward" style="margin-right: 10px;">&rsaquo; </a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Footer" ContentPlaceHolderID="FootExtender" runat="Server">
    <script type="text/javascript">
        $('#sanpham').scrollbox({
            direction: 'h',
            distance: 140,
            autoPlay: false
        });
        $('#sanpham-backward').click(function () {
            $('#sanpham').trigger('backward');
        });
        $('#sanpham-forward').click(function () {
            $('#sanpham').trigger('forward');
        });
    

        $("document").ready(function () {
            setTimeout(function () {

                //var txt = "";
                $(".scroll-img > ul > li > a > img").each(function () {
                    var ProImgWidth = $(this).width();
                    var ParentWidth = $(this).parent().width();
                    //txt += "img width: " + ProImgWidth + "   --  a width: " + ParentWidth + "</br>";
                    var ml = (100 - ((ProImgWidth * 100) / ParentWidth)) / 2;
                    $(this).css("left", ml + "%");
                });
               // $("#a").html(txt);

            }, 10);
        });


    </script>
</asp:Content>

