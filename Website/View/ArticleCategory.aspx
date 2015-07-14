<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ArticleCategory.aspx.cs" Inherits="View_ArticleCategory" %>

<%@ Import Namespace="DataAccess.Help" %>
<asp:Content ID="Header" ContentPlaceHolderID="HeadExtender" runat="Server">
    <link href="/Styles/CSS/Desktop.Module.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content-container">

        <div class="line-fix-parent-width">
            <div class="welcome-block-title">

                <asp:label id="lbtitle" runat="server" text="Bài viết" style="float: left; font-family: Tahoma,Arial,sans-serif; color: #0066a8; font-size: 27px;" />

            </div>
        </div>

        <div class="product-container">
            <asp:updatepanel id="UpdatePanel1" runat="server" updatemode="Conditional">
                <ContentTemplate>

                    <asp:ListView ID="rptArticleList" runat="server" ItemPlaceholderID="ItemPlaceholderIDArticleList" OnDataBound="rptArticleList_DataBound">
                        <LayoutTemplate>

                            <asp:PlaceHolder runat="server" ID="ItemPlaceholderIDArticleList"></asp:PlaceHolder>
                        </LayoutTemplate>
                        <ItemTemplate>

                            <div class="item_videos">
                                <div class="url_videos">
                                    <a href='/<%#Eval("IDTheLoai") %>/<%#Eval("ID") %>/detail-acticle.html' class="link">
                                        <img src='<%#ShowInfor(Container.DataItem, "laylink") %>' alt="Hình ảnh" class="img"/>
                                    </a>
                                </div>
                                <div class="name_videos">                                    
                                     <a href='/<%#Eval("IDTheLoai") %>/<%#Eval("ID") %>/detail-acticle.html' class="link">
                                        <%#Eval("TieuDe_Vn").ToString() %>
                                     </a>                                    
                                <p class="meta">                                   
                                    <strong>Mô tả:</strong>
                                    <%#Eval("TomTat_vn") %>
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
            </asp:updatepanel>

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

