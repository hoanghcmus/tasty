<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Choose_Language.ascx.cs" Inherits="En_En_Control_UC_Choose_Language" %>

<div class="lang-bar">
    <div class="lang-item">
        <asp:LinkButton ID="btnVn" runat="server" OnClick="btnVn_Click">
            <div class="lang-icon">
                <img src="/Design/vi.png" class="img" alt="Việt Nam"/>
            </div>
            <div class="lang-name"><span>Việt Nam</span></div>
        </asp:LinkButton>
    </div>
    <div class="lang-item">
        <asp:LinkButton ID="btnCn" runat="server" OnClick="btnCn_Click">
            <div class="lang-icon">
                <img src="/Design/cn.png" class="img"  alt="China" />
            </div>
            <div class="lang-name"><span>中國</span></div>
        </asp:LinkButton>
    </div>

</div>

