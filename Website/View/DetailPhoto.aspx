<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailPhoto.aspx.cs" Inherits="View_DetailPhoto" %>

<div class="block">
    <div class="block-head">
        <h1>
            <asp:literal runat="server" id="ltrTieuDe"></asp:literal>
        </h1>
    </div>
    <div class="block-body">
        <asp:repeater id="dlListimages" runat="server">
            <ItemTemplate>
                <div class="gallery-item">
                <a class="picture-item highslide imgshow" rel="gallery" href="<%#Eval("HinhAnh") %>">
                    <img src="<%# DataAccess.Help.Helper.ToThumb(Eval("HinhAnh").ToString())%>" alt="Thanh long Châu Hải Thịnh" class="img"/>
                </a>                      
                </div>      
            </ItemTemplate>
     </asp:repeater>
    </div>
</div>

<%-- Script cho html scrollbar --%>
<script src="/Styles/nicescroll/jquery.nicescroll.js"></script>
<script type="text/javascript">
    $(document).ready(
    function () {
        $(".block-body").niceScroll();
    });
</script>
