<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterHasSlide.master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Vn_Contact" %>

<%@ Register Src="~/View/UserControl/UC_Paging.ascx" TagName="UC_Paging" TagPrefix="uc1" %>

<asp:Content ID="ContentHeader" runat="server" ContentPlaceHolderID="HeadExtender">
    <link href="/Styles/CSS/Desktop.Contact.css" rel="stylesheet" />

    <link href="/Styles/FancyBox-2.1.5/source/helpers/jquery.fancybox-buttons.css" rel="stylesheet" />
    <link href="/Styles/FancyBox-2.1.5/source/helpers/jquery.fancybox-thumbs.css" rel="stylesheet" />
    <link href="/Styles/FancyBox-2.1.5/source/jquery.fancybox.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Left" runat="server" ContentPlaceHolderID="LeftContentHolder">
    <div class="contact-info">
        <asp:Literal ID="ltBaiVietGioiThieu" runat="server"></asp:Literal>
    </div>
    <div class="body-left-under-title">
        <h1>
            <asp:Literal ID="ltrCatName" runat="server"></asp:Literal></h1>
    </div>

</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="contact-wrapper">

        <p style="line-height: 130%;">
            <%=Resources.Resource.contact_message %>
        </p>

        <div class="contact">
            <%-- View maps --%>
            <a class="map-direction" data-fancybox-type="iframe" href="/<%=Session["lang"].ToString() %>/map.html"><%=Resources.Resource.view_map %></a>
            <asp:UpdatePanel ID="UpdatePanelContact" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lbtitle" runat="server" Text="Label" Visible="false" CssClass="titletb" />
                            </td>
                        </tr>
                        <tr>
                            <td><b><%=Resources.Resource.fullname %> :</b>
                            </td>
                            <td>
                                <asp:TextBox ID="txtHoTen" runat="server" CssClass="txt"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHoTen"
                                    ValidationGroup="contact" ErrorMessage="->Vui lòng nhập họ tên!" CssClass="titletb">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><b><%=Resources.Resource.email %> :</b>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                    ValidationGroup="contact" ErrorMessage="Email Không đúng!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    CssClass="titletb">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail"
                                    ValidationGroup="contact" ErrorMessage="->Vui lòng nhập email!" CssClass="titletb">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><b><%=Resources.Resource.address %> :</b>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="txt" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDiaChi"
                                    ValidationGroup="contact" ErrorMessage="->Vui lòng nhập địa chỉ!" CssClass="titletb">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td><b><%=Resources.Resource.title %> :</b>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTieuDe" runat="server" CssClass="txt" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTieuDe"
                                    ValidationGroup="contact" ErrorMessage="->Vui lòng nhập tiêu đề!" CssClass="titletb">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top"><b><%=Resources.Resource.content %>:</b>
                            </td>
                            <td valign="top">
                                <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" CssClass="txtnd"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNoiDung"
                                    ValidationGroup="contact" ErrorMessage="->Vui lòng nhập nội dung!" CssClass="titletb">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lbcapcha" runat="server" Text="Label" Visible="false" CssClass="titletb" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="bottom"><b><%=Resources.Resource.confirm_code %>:</b>
                            </td>
                            <td style="position: relative;">
                                <asp:TextBox ID="txtInputString" runat="server" CssClass="txtmin"></asp:TextBox>
                                <asp:Image ID="captchaImage" runat="server" CssClass="capcha" />
                                <asp:Button ID="btnRedefine" runat="server" Text="" CssClass="btnrefresh" OnClick="btnRedefine_Click" />

                            </td>
                        </tr>
                        <tr>
                            <td class="td"></td>
                            <td colspan="2">
                                <asp:Button ID="btnGui" runat="server" Text="<%$Resources:Resource,submit %>" CssClass="btn" OnClick="btnbtnGui_Click" ValidationGroup="contact" />
                                <asp:Label ID="succesfull" runat="server" Text="Label" Visible="false" CssClass="succesfull" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>


    </div>

</asp:Content>

<asp:Content ID="ContentFooter" runat="server" ContentPlaceHolderID="FootExtender">
    <script src="/Styles/FancyBox-2.1.5/lib/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>
    <script src="/Styles/FancyBox-2.1.5/source/jquery.fancybox.pack.js" type="text/javascript"></script>
    <script src="/Styles/FancyBox-2.1.5/source/jquery.fancybox.js" type="text/javascript"></script>
    <script src="/Styles/FancyBox-2.1.5/source/helpers/jquery.fancybox-buttons.js" type="text/javascript"></script>
    <script src="/Styles/FancyBox-2.1.5/source/helpers/jquery.fancybox-media.js" type="text/javascript"></script>
    <script src="/Styles/FancyBox-2.1.5/source/helpers/jquery.fancybox-thumbs.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".map-direction").fancybox({
                maxWidth: 1349,
                maxHeight: 630,
                fitToView: false,
                width: '818px',
                height: '519px',
                autoSize: false,
                closeClick: false,
                openEffect: 'none',
                closeEffect: 'none'
            });
        });

    </script>

    <script type="text/javascript">
        $(document).ready(
        function () {
            $(".contact-wrapper").niceScroll();
        });

    </script>
</asp:Content>
