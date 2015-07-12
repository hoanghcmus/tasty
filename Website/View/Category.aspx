﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterHasSlide.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="View_Category" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadExtender" runat="Server">
</asp:Content>
<asp:Content ID="LeftContent" ContentPlaceHolderID="LeftContentHolder" runat="Server">
    <asp:Literal ID="ltrItemList" runat="server"></asp:Literal>

    <div class="paging">
        <div class="paging-wrapper">
            <div class="paging-item">
                <a href="javascript:void();" class="link " id="pre" data-paging-value="1">
                    <span class="pre"></span>
                </a>
            </div>
            <div class="paging-item">
                <a href="javascript:void();" class="link " id="next" data-paging-value="2">
                    <span class="next"></span>
                </a>
            </div>
        </div>
    </div>

    <div class="body-left-under-title">
        <h1>
            <asp:Literal ID="ltrCatName" runat="server"></asp:Literal></h1>
    </div>

</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">
    <p style="font-family: 'HongHaHep'; color: #005706; text-transform: uppercase;">
        <%=Resources.Resource.updating %> ...
    </p>
</asp:Content>
<asp:Content ID="FootContent" ContentPlaceHolderID="FootExtender" runat="Server">

    <%-- Auto click the first item to get first item content to load on the page --%>
    <script>
        $("document").ready(function () {
            setTimeout(function () {
                $("#item1 .item-link:first-child").trigger('click');
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
                        $(".body-right-wrapper").html(result);
                        $('#articleslide').flexslider({
                            animation: "slide",
                            slideshowSpeed: 3500
                        });                        
                    },
                    error: function (msg) {
                        alert("Cannot load content!");
                    }
                });

            });
        });
    </script>

    <%-- Jquery for paging --%>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#next").click(function () {

                var totalItem = $(".body-left-under .left-small-wrapper").length;
                var nextValue = $("#next").attr("data-paging-value");
                var preValue = $("#pre").attr("data-paging-value");

                var selector = "#item" + nextValue.toString();
                var selectorHide = "#item" + (parseInt(nextValue) - 1).toString();

                $(selector).css("display", "block");
                if (parseInt(totalItem) > 1) {
                    $(selectorHide).css("display", "none");
                }

                if (parseInt(nextValue) < parseInt(totalItem)) {
                    $("#pre").attr("data-paging-value", parseInt(preValue) + 1);
                    $("#next").attr("data-paging-value", parseInt(nextValue) + 1);
                }
            });

            $("#pre").click(function () {

                var totalItem = $(".body-left-under .left-small-wrapper").length;
                var nextValue = $("#next").attr("data-paging-value");
                var preValue = $("#pre").attr("data-paging-value");

                var selector = "#item" + preValue.toString();
                var selectorHide = "#item" + (parseInt(preValue) + 1).toString();

                $(selector).css("display", "block");
                $(selectorHide).css("display", "none");

                if (parseInt(preValue) > 1) {
                    $("#pre").attr("data-paging-value", parseInt(preValue) - 1);
                    $("#next").attr("data-paging-value", parseInt(nextValue) - 1);
                }
            });


        });
    </script>

    <%-- Hide Paging if only one page --%>
    <script>
        $(window).load(function () {
            var totalItem = $(".body-left-under .left-small-wrapper").length;
            if (parseInt(totalItem) <= 1) {
                $(".paging").hide();
            }
        });
    </script>
</asp:Content>

