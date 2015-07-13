<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_MenuBottom.ascx.cs" Inherits="UserControls_UC_MenuBottom" %>
<div class="block-wrapper">
    <h1>
        <asp:Literal ID="ltrCatTitle" runat="server"></asp:Literal></h1>
    <br />
    <asp:Repeater ID="rptArticleList" runat="server">
        <ItemTemplate>
            <p><a href="/<%#Eval("IDTheLoai") %>/<%#Eval("ID") %>/detail-acticle.html" class="link"><%#Eval("TieuDe_Vn") %></a></p>
        </ItemTemplate>
    </asp:Repeater>
</div>
