<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Vn_Contact" %>

<asp:Content ID="ContentHeader" runat="server" ContentPlaceHolderID="HeadExtender">
    <link href="/Styles/CSS/Desktop.Contact.css" rel="stylesheet" />

    <link href="/Styles/FancyBox-2.1.5/source/helpers/jquery.fancybox-buttons.css" rel="stylesheet" />
    <link href="/Styles/FancyBox-2.1.5/source/helpers/jquery.fancybox-thumbs.css" rel="stylesheet" />
    <link href="/Styles/FancyBox-2.1.5/source/jquery.fancybox.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentMain" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content-container">
        <div class="content">
            <div class="content-wrap">
                <p style="text-align: justify; font-family: Tahoma; font-size: 14px; color: #414141; line-height: 18px;">
                    Nếu quý khách hàng có thắc mắc gì về Sao hay bất cứ dịch vụ, sản phẩm gì của chúng tôi. Xin quý khách vui lòng để lại thông tin và nội dung liên hệ cho chúng tôi theo form bên dưới.
                </p>

                <div class="contact">
                    <%-- View maps --%>
                    <a class="map-direction" data-fancybox-type="iframe" href="/map.html">Xem bản đồ đường đi</a>
                    <asp:UpdatePanel ID="UpdatePanelContact" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="succesfull" runat="server" Text="Label" Visible="false" CssClass="succesfull" />
                                        <asp:Label ID="lbtitle" runat="server" Text="Label" Visible="false" CssClass="titletb" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Họ tên:</b>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtHoTen" runat="server" CssClass="txt"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtHoTen"
                                            ValidationGroup="contact" ErrorMessage="->Vui lòng nhập họ tên!" CssClass="titletb">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Email :</b>
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
                                    <td><b>Địa chỉ :</b>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDiaChi" runat="server" CssClass="txt" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDiaChi"
                                            ValidationGroup="contact" ErrorMessage="->Vui lòng nhập địa chỉ!" CssClass="titletb">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Tiêu đề :</b>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTieuDe" runat="server" CssClass="txt" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTieuDe"
                                            ValidationGroup="contact" ErrorMessage="->Vui lòng nhập tiêu đề!" CssClass="titletb">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top"><b>Nội dung:</b>
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
                                    <td valign="bottom"><b>Mã xác nhận:</b>
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
                                        <asp:Button ID="btnGui" runat="server" Text="Gửi liên hệ" CssClass="btn" OnClick="btnbtnGui_Click" ValidationGroup="contact" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
        </div>

        <div class="navigation" tabindex="5001" style="overflow: hidden; outline: none;">

            <div class="navigation-wrap" id="item1">
                <div class="navi-item navi-item1 item-link item-active1" data-lien-ket="none"><a href="javascript:void();">Vui lòng liên hệ với chúng tôi</a></div>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="ContentFooter" runat="server" ContentPlaceHolderID="FootExtender">

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

    <%--Scroll down ...px  --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(window).scrollTop(648);
        });
    </script>
</asp:Content>
