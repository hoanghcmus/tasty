<%@ Page Title="" Language="C#" MasterPageFile="~/View/SubMaserPage.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="View_Gallery" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadExtender" runat="Server">
</asp:Content>

<asp:Content ID="Left" runat="server" ContentPlaceHolderID="LeftContent">
    <div class="left-wrap">
        <div class="hnav">
            <ul>
                <asp:Repeater runat="server" ID="rptArticleList">
                    <ItemTemplate>
                        <li data-lien-ket="<%#ShowItem(Container.DataItem, "LienKet") %>" class="item-link">
                            <a href="javascript:void()" class="link">
                                <i class="dot"></i><span><%#Eval("Ten_Vn") %></span>
                            </a>
                            <i class="sep"></i>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="right-wrap">
        Đang cập nhật ...
    </div>
</asp:Content>
<asp:Content ID="Foot" ContentPlaceHolderID="FootExtender" runat="Server">
    <%-- Auto click the first item to get first item content to load on the page --%>
    <script>
        $("document").ready(function () {
            setTimeout(function () {
                $(".item-link:first-child").trigger('click');
            }, 10);
        });
    </script>
    <%-- Load page content when click item on the right --%>
    <script type="text/javascript">
        $(document).ready(function () {

            $(".item-link").click(function () {
                $(".item-active").removeClass("item-active");
                $(this).addClass("item-active");

                $.ajax({
                    type: "POST",
                    url: $(this).attr("data-lien-ket"),
                    success: function (result) {
                        $(".right-wrap").html(result);
                    },
                    error: function (msg) {
                        alert("Cannot load content!");
                    }
                });
            });

            $(".hnav ul > li:last-child > i").hide();
        });
    </script>
</asp:Content>

