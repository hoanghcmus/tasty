<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArticleDetail.aspx.cs" Inherits="View_ArticleDetail" %>

<div class="block">
    <div class="block-head">
        <h1>
            <asp:literal runat="server" id="ltrTieuDe"></asp:literal>
        </h1>
    </div>
    <div class="block-body">
        <asp:literal runat="server" id="ltrContent"></asp:literal>
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
