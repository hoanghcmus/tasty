<%@ Page Title="" Language="C#" MasterPageFile="~/View/SubMaserPage.master" AutoEventWireup="true"
    CodeFile="Videos.aspx.cs" Inherits="View_Videos" %>

<%@ Register Src="~/UserControls/UC_Paging.ascx" TagPrefix="uc1" TagName="UC_Paging" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadExtender" runat="Server">
    <link href="/Styles/CSS/Desktop.Module.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftContent" runat="Server">
    <div class="left-wrap">
        <div class="namevideo">
            <h1>VIDEO - CLIPS</h1>
        </div>
        <div class="imgvideo">
            <img src="/Design/video.png" alt="Video" class="img" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="right-wrap">
        <div class="block-body">
            <div class="content">
                <div class="content-wrap">
                    <asp:Repeater ID="dlVideos" runat="server">
                        <ItemTemplate>
                            <div class="item_videos">
                                <div class="url_videos">
                                    <a class="fancybox-media" href="<%#Eval("ImgOrClip")%>">
                                        <img src='<%#Eval("HinhAnh") %>' alt="Hình ảnh" />
                                        <img class="play" alt="ICon here" src="/Design/play.png" /></a>
                                </div>
                                <div class="name_videos">
                                    <h4><a class="fancybox-media" href="<%#Eval("ImgOrClip")%>">
                                        <%#ShowVideo(Container.DataItem, "VideoTieuDe") %></a>
                                    </h4>

                                    <p class="meta">
                                        <strong>Mô tả:</strong>
                                        <%#ShowVideo(Container.DataItem, "VideoMoTa") %>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <uc1:UC_Paging runat="server" ID="pagerBottom" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FootExtender" runat="Server">
</asp:Content>
