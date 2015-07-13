<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="View_Search" %>

<asp:Content ID="Header" ContentPlaceHolderID="HeadExtender" runat="Server">
    <link href="/Styles/CSS/Desktop.Module.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content-container">

        <div class="line-fix-parent-width">
            <div class="welcome-block-title">

                <asp:Label ID="lbtitle" runat="server" Text="Tìm kiếm" Style="float: left; font-family: Tahoma,Arial,sans-serif; color: #0066a8; font-size: 20px;" />

            </div>
        </div>

        <div class="product-container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <asp:ListView ID="rptArticleList" runat="server" ItemPlaceholderID="ItemPlaceholderIDArticleList" OnDataBound="rptArticleList_DataBound">
                        <LayoutTemplate>

                            <asp:PlaceHolder runat="server" ID="ItemPlaceholderIDArticleList"></asp:PlaceHolder>
                        </LayoutTemplate>
                        <ItemTemplate>

                            <div class="item_videos">
                                <div class="url_videos">
                                    <a href='<%#ShowInfor(Container.DataItem, "lienket") %>' class="link">
                                        <img src='<%#ShowInfor(Container.DataItem, "linkanh") %>' alt="<%#Eval("TieuDe") %>" class="img" />
                                    </a>
                                </div>
                                <div class="name_videos">
                                    <a href='<%#ShowInfor(Container.DataItem, "lienket") %>' class="link">
                                        <%#Eval("TieuDe")%> <%#Eval("Module").Equals("baiviet") ? " <span style='color: #00CC00;'>(Bài viết)</span>" : "<span style='color: #3399FF;'>(Sản phẩm)</span>" %>
                                    </a>
                                    <p class="meta">
                                        <strong>Mô tả:</strong>
                                        <%#Eval("MoTa") %>
                                    </p>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                    <asp:DataPager ID="ListPager" PagedControlID="rptArticleList" runat="server" PageSize="18" OnPreRender="ListPager_PreRender" class="control-pager">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                            <asp:TemplatePagerField></asp:TemplatePagerField>
                        </Fields>
                    </asp:DataPager>

                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ListPager" />
                </Triggers>
            </asp:UpdatePanel>

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

