<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleDetail.aspx.cs" Inherits="View_ArticleDetail" %>

<asp:Content ID="Header" ContentPlaceHolderID="HeadExtender" runat="Server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content-container">
        <div class="line-fix-parent-width">
            <div class="welcome-block-title">
                <h4 class="art-cat-title">
                    <asp:Label ID="lblTitle" runat="server" />
                </h4>
                <p class="meta">

                    <asp:Label ID="lbLuotXem" runat="server" Style="float: right; width: 20px; height: 20px; font-size: 14px; font-weight: bold;"/>
                    <img src="/Design/eye.png" alt="Lượt xem" style="float: right; width: 20px; height: 20px;" />
                </p>
            </div>
        </div>

        <div class="content-detail">
            <div class="text">
                <asp:Label ID="lblFullText" runat="server" />
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Footer" ContentPlaceHolderID="FootExtender" runat="Server">
    <%--Scroll down ...px  --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(window).scrollTop(648);
        });
    </script>
</asp:Content>

