<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Quản trị nước khoáng Tasty
    </title>
    <link rel="Shurtcut Icon" href="/Admin/images/icon_login.png" type="image/x-icon" />
    <link rel="stylesheet" href="/Admin/LoginPage/animate.min.css">
    <link rel="stylesheet" href="/Admin/LoginPage/login.css">


    <script src="/Styles/JS/jquery-10.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var txtUserName = $("#txtTenDangNhap");
            txtUserName.blur(function () {
                $('#lbtitle').show();
                //if there is on text
                if ($('#txtTenDangNhap').val().length == 0) {
                    $('#lbtitle').html("Vui lòng nhập tên đăng nhập và mật khẩu");
                }
                else {
                    $('#lbtitle').html("Kiểm tra...");
                    $.ajax({
                        type: "POST",
                        url: "Login.asmx/KiemTraTenDangNhap",
                        data: "{tenDangNhap:'" + $('#txtTenDangNhap').val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var result = response.d;
                            if (result == true) {
                                //$('#lbtitle').css("color", "black");
                                $('#lbtitle').html("Vui lòng nhập mật khẩu!");
                                //$('#txtTenDangNhap').css("border", "1px solid #006cb2");
                            }
                            else {
                                //$('#lbtitle').css("color", "#ff0000");
                                $('#lbtitle').html("Tên đăng nhập không tồn tại!");
                                //$('#txtTenDangNhap').css("border", "1px solid red");
                            }
                        },
                        error: function (msg) {
                            $('#lbtitle').html("Không kiểm tra được");
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
    <div class="form animated flipInX">
        <h2 style="font-family: Tahoma;">Đăng nhập quản trị</h2>
        <div class="Title">
            <asp:Label ID="lbtitle" runat="server" Text="" CssClass="lbtitle" />
        </div>
        <form runat="server" id="MainForm">
            <asp:TextBox runat="server" ID="txtTenDangNhap" placeholder="Tên đăng nhập" />
            <asp:TextBox runat="server" TextMode="Password" ID="txtMatKhau" placeholder="Mật khẩu" />
            <asp:Button ID="btnDangNhap" runat="server" CssClass="animated infinite pulse" OnClick="btnDangNhap_Click" Text="Đăng nhập"></asp:Button>
        </form>
    </div>
</body>
</html>

