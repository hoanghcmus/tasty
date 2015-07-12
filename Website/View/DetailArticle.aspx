<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailArticle.aspx.cs" Inherits="View_DetailArticle" %>

<div class="figure">
    <div class="articleslide" id="articleslide">
        <ul class="slides">
            <asp:repeater id="repslideshow" runat="server">
                <ItemTemplate>
                    <li>
                        <img src='<%#Eval("HinhAnh") %>' alt='<%#Eval("Ten") %>' class="img"/>
                    </li>
                </ItemTemplate>
            </asp:repeater>
        </ul>
    </div>
</div>

<div class="content">
    <div class="content-header">
        <h1>
            <asp:literal id="lblTitle" runat="server" />
        </h1>
    </div>
    <div class="content-body">
        <asp:literal id="ltrContent" runat="server"></asp:literal>
    </div>
</div>

<%-- Script cho html scrollbar --%>
<script src="/Styles/nicescroll/jquery.nicescroll.js"></script>
<script type="text/javascript">
    $(document).ready(
    function () {
        $(".content-body").niceScroll();
    });
</script>


<%--<script type="text/javascript" src="/Styles/flexslider/js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="/Styles/flexslider/js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(window).load(function () {
        $('#articleslide').flexslider({
            animation: "slide",
            slideshowSpeed: 5000
        });
    });
</script>--%>
