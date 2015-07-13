<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="View_ProductList" %>

<%@ Register Src="~/UserControls/UC_ProductListTwo.ascx" TagPrefix="uc1" TagName="UC_ProductListTwo" %>


<asp:Content ID="Headẻ" ContentPlaceHolderID="HeadExtender" runat="Server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content-container">
        <uc1:UC_ProductListTwo runat="server" ID="ProductList" />
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

