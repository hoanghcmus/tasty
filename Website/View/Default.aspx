<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterNoneSlide.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Vn_Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadExtender" runat="Server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="intro-box">
        <div class="intro-box-wrapper">
            <div class="intro-header">
                <h1>
                    <asp:Literal ID="ltrTieuDe" runat="server"></asp:Literal></h1>
            </div>
            <div class="intro-content">
                <asp:Literal ID="ltBaiVietGioiThieu" runat="server"></asp:Literal>
            </div>
            <div class="intro-readmore">
                <div class="read-more">
                    <asp:HyperLink ID="hlReadMore" runat="server" CssClass="link"><span><%=Resources.Resource.more %></span></asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="FootContent" ContentPlaceHolderID="FootExtender" runat="Server">
</asp:Content>

