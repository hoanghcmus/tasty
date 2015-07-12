<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Hotline.ascx.cs" Inherits="UserControl_UC_Hotline" %>
<div class="hotline">
    <asp:Repeater ID="dlhotro" runat="server">
        <ItemTemplate>        

            <div class="line-fix-parent-width">
                <div class="contact-item">
                    <p class="c-name"><%#ShowHotline(Container.DataItem, "HotlineName")%></p>
                    <p class="c-phone"><%#(Eval("SDT").ToString())%></p>
                    <p class="c-email"><%#(Eval("Khac").ToString())%></p>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
</div>

