<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailPhoto.aspx.cs" Inherits="View_DetailPhoto" %>

<div class="gallery-wrapper">
    <asp:repeater id="dlListimages" runat="server">
            <ItemTemplate>
                <a class="picture-item highslide imgshow" rel="gallery" href="<%#Eval("HinhAnh") %>">
                    <img src="<%# DataAccess.Help.Helper.ToThumb(Eval("HinhAnh").ToString())%>" alt="Thanh long Châu Hải Thịnh" class="img"/>
                </a>                            
            </ItemTemplate>
     </asp:repeater>
</div>

<%-- Script cho html scrollbar --%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".gallery-wrapper").niceScroll();
    });
</script>
