<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="View_Default" %>

<%@ Register Src="~/UserControls/UC_ProductListOne.ascx" TagPrefix="uc1" TagName="UC_ProductListOne" %>
<%@ Register Src="~/UserControls/UC_Quang_Cao.ascx" TagPrefix="uc1" TagName="UC_Quang_Cao" %>
<%@ Register Src="~/UserControls/UC_SlideShow.ascx" TagPrefix="uc1" TagName="UC_SlideShow" %>
<%@ Register Src="~/UserControls/UC_BSlideShow.ascx" TagPrefix="uc1" TagName="UC_BSlideShow" %>





<asp:Content ID="Header" ContentPlaceHolderID="HeadExtender" runat="Server">
</asp:Content>



<asp:Content ID="SlideShow" ContentPlaceHolderID="SlideShowContentPlaceHolder" runat="Server">
    <div class="slideshow">
        <uc1:UC_SlideShow runat="server" ID="UC_SlideShow" />
    </div>
</asp:Content>

<asp:Content ID="Background" ContentPlaceHolderID="BackGroundPlaceHolder" runat="Server">
    <div class="bg ss">
        <%--<uc1:UC_SlideShow runat="server" ID="UC_SlideShow1" />--%>
    </div>
    <div class="bg bs">
        <%--<uc1:UC_BSlideShow runat="server" id="UC_BSlideShow" />--%>
    </div>
</asp:Content>


<asp:Content ID="Left" ContentPlaceHolderID="LeftContent" runat="Server">
</asp:Content>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="Server">
</asp:Content>
<asp:Content ID="Footer" ContentPlaceHolderID="FootExtender" runat="Server">
</asp:Content>

