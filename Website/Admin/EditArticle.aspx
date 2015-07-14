<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true"
    CodeFile="EditArticle.aspx.cs" Inherits="Admin_EditArticle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
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
                <asp:Label ID="lbTitle01" runat="server" Text="Thêm bài viết mới" /></h1>
        </div>
        <ul class="breadcrumb">
            <li><a href="Admin.aspx">Trang chủ</a> <span class="divider">>></span></li>
            <li class="active"><a href="MgerArticle.aspx">Quản lý bài viết</a><span class="divider">>></span></li>
            <li class="active">
                <asp:Label ID="lbTitle02" runat="server" Text="Thêm bài viết mới" /></li>
        </ul>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="block">
                    <p class="block-heading">
                        Thông tin bài viết
                    </p>
                    <div class="toolbar">
                        <table class="Edit">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label1" runat="server" Text="" CssClass="red" />
                                    <asp:Label ID="label2" runat="server" Visible="false" />
                                    <asp:Label ID="lblId" runat="server" Visible="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="text" valign="top">Thể loại bài viết:
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlLoaiMenu" AppendDataBoundItems="true" CssClass="drl">
                                        <asp:ListItem Value="0">-- Chọn thể loại bài viết -- </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddlLoaiMenu"
                                        SetFocusOnError="true" Display="Static" CssClass="red" InitialValue="0" runat="server">(Chọn thể loại bài viết)</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="text" valign="top">Tiêu đề:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTieuDeVn" runat="server" Text="" TextMode="MultiLine" CssClass="txtNew"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTieuDeVn"
                                        CssClass="red">( * )</asp:RequiredFieldValidator><br />
                                    <asp:CustomValidator ID="valTieuDeVn" ControlToValidate="txtTieuDeVn" Text="(Tiêu đề 'Tiếng việt' < 100 ký tự)"
                                        runat="server" OnServerValidate="valTieuDeVn_ServerValidate" />
                                </td>
                            </tr>

                            <tr>
                                <td class="text" valign="top">Tóm tắt:
                                </td>
                                <td>

                                    <asp:TextBox ID="txtTomTatVn" runat="server" Text="" TextMode="MultiLine" CssClass="txtNewContent"></asp:TextBox>

                                </td>
                            </tr>

                            <tr class="text">
                                <td>Hình ảnh:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHinhAnh" runat="server" Text="" CssClass="txtNewMin"></asp:TextBox>
                                    <input id="btnDuyet" onclick="BrowseServer( 'Mger_Design:/','<%=txtHinhAnh.ClientID%>    ');" type="button" value="Duy&#7879;t file" class="btnedit" />
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtHinhAnh" CssClass="red">( * )</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr class="text">
                                <td colspan="2">
                                    <hr />
                                </td>
                            </tr>
                            <tr class="text">
                                <td colspan="2">Chi tiết<br />
                                    <CKEditor:CKEditorControl ID="txtckeditorVn" runat="server" Height="400" CssClass="txteditor">
                                    </CKEditor:CKEditorControl>
                                    <br />
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnLuu" runat="server" Text="Lưu" CssClass="btnedit" />
                                    <input type="button" value="Đóng" class="btnedit" onclick="location.href='MgerArticle.aspx'" /><br />
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
