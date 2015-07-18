<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_BSlideShow.ascx.cs" Inherits="View_UserControl_UC_BSlideShow" %>
<div class="flexslider">
    <ul class="slides">
        <asp:Repeater ID="repslideshow" runat="server">
            <ItemTemplate>
                <li>
                    <img src='<%#ShowItem(Container.DataItem, "src")%>' alt='<%#Eval("TieuDe_Vn") %>' />
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
