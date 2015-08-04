<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="EditPhoto.aspx.cs" Inherits="Admin_EditPhoto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnDuyet").click(function () {
                var finder = new CKFinder();
                finder.selectActionFunction = function (fileUrl) {
                    $('#<%=txtHinhAnh.ClientID %>').val(fileUrl);
                };
                finder.popup();
            });
        });
    </script>
    <div class="content">
        <div class="header">
            <h1 class="page-title">
                <asp:Label ID="lbTitle01" runat="server" Text="Thêm album mới" /></h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="Admin.aspx">Trang chủ</a> <span class="divider">>></span></li>
            <li class="active"><a href="MgerPhoto.aspx">Quản lý Hình ảnh</a><span class="divider">>></span></li>
            <li class="active">
                <asp:Label ID="lbTitle02" runat="server" Text="Thêm hình ảnh" /></li>
        </ul>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="block">
                    <p class="block-heading">
                        <asp:Label ID="lbtitle" runat="server" Text="Edit Album" />
                    </p>
                    <div class="toolbar">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <table class="Edit">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label1" runat="server" Text="" CssClass="red" />
                                    <asp:Label ID="label2" runat="server" Visible="false" />
                                    <asp:Label ID="lblId" runat="server" Visible="false" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <h4>Thông tin album</h4>
                                </td>
                            </tr>
                            <tr>
                                <td class="text" valign="top">
                                    <br />
                                    Tên album:
                                </td>
                                <td>
                                    <asp:CustomValidator ID="valTenVn" ControlToValidate="txtTenVn" Text="(Tên 'Tiếng việt' < 100 ký tự)"
                                        runat="server" OnServerValidate="valTenVn_ServerValidate" /><br />
                                    <asp:TextBox ID="txtTenVn" runat="server" Text="" TextMode="MultiLine" CssClass="txtNewMin"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTenVn"
                                        CssClass="red">( * )</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                           
                            <tr>
                                <td class="text" valign="top">
                                    <br />
                                    Mô tả:
                                </td>
                                <td>
                                    <asp:CustomValidator ID="valmotaVn" ControlToValidate="txtmoTaVn" Text="(Mô tả 'Tiếng việt' < 150 ký tự)"
                                        runat="server" OnServerValidate="valmotaVn_ServerValidate" /><br />
                                    <asp:TextBox ID="txtmoTaVn" runat="server" Text="" TextMode="MultiLine" CssClass="txtNewMin"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmoTaVn"
                                        CssClass="red">( * )</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr class="text" valign="top">
                                <td>Hình ảnh:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHinhAnh" runat="server" Text="" CssClass="txtNewMin"></asp:TextBox>
                                    <input id="btnDuyet" onclick="BrowseServer( 'images:/','<%=txtHinhAnh.ClientID%>    ');"
                                        type="button" value="Duy&#7879;t file" class="btnedit" /><br />
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="btnaddimg" runat="server" Text="Thêm vào danh sách" CssClass="linkAddimg" /><asp:Label
                                                ID="lbhinhanh" runat="server" Text="Vui lòng duyệt để chọn ảnh" Visible="false"
                                                CssClass="red" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <h4>Danh sách ảnh cho album</h4>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:DataList ID="dlListImg" runat="server" RepeatColumns="4">
                                                <ItemTemplate>
                                                    <div class="itemimg">
                                                        <img src='<%# DataAccess.Connect.Link.Toimages(Eval("HinhAnh").ToString()) %>'>
                                                        <asp:Button Text=" " runat="server" ID="btnDelete" CommandArgument='<%#Eval("ID")%>'
                                                            CommandName="Deleteimg" CssClass="linkRemoveimg" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnLuu" runat="server" Text="Lưu album" CssClass="btnedit" />
                                    <input type="button" value="Đóng" class="btnedit" onclick="location.href='MgerPhoto.aspx'" /><br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
    </div>
</asp:Content>
