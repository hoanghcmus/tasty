<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Hotline.ascx.cs" Inherits="UserControl_UC_Hotline" %>

<asp:Repeater ID="dlhotro" runat="server">
    <ItemTemplate>

        <div class="support-item">
            <div class="support-name">
                <p><%#Eval("Ten_Vn") %></p>
            </div>
            <div class="support-phone-number">
                <p><%#Eval("SDT") %></p>
            </div>
            <div class="support-avatar">
                <img src="<%#Eval("Ten_En") %>" alt="<%#Eval("Ten_Vn") %>" class="img" />
            </div>
        </div>

    </ItemTemplate>
</asp:Repeater>

