<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="View_Default" %>

<%@ Register Src="~/UserControls/UC_ProductListOne.ascx" TagPrefix="uc1" TagName="UC_ProductListOne" %>
<%@ Register Src="~/UserControls/UC_Quang_Cao.ascx" TagPrefix="uc1" TagName="UC_Quang_Cao" %>



<asp:Content ID="Header" ContentPlaceHolderID="HeadExtender" runat="Server">
</asp:Content>
<asp:Content ID="Left" ContentPlaceHolderID="LeftContent" runat="Server">
    <div class="left-wrap">
        <div class="hnav">
            <ul>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Giới thiệu chung</span>
                    </a>
                    <i class="sep"></i>
                </li>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Lịch sử hình thành</span>
                    </a>
                    <i class="sep"></i>
                </li>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Trang thiết bị sản xuất</span>
                    </a>
                    <i class="sep"></i>
                </li>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Chính sách chất lượng</span>
                    </a>
                    <i class="sep"></i>
                </li>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Giới thiệu chung</span>
                    </a>
                    <i class="sep"></i>
                </li>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Lịch sử hình thành</span>
                    </a>
                    <i class="sep"></i>
                </li>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Trang thiết bị sản xuất</span>
                    </a>
                    <i class="sep"></i>
                </li>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Chính sách chất lượng</span>
                    </a>
                    <i class="sep"></i>
                </li>
                <li>
                    <a href="javascript:void();" class="link">
                        <i class="dot"></i><span>Danh hiệu và giải thưởng</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Body" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="right-wrap">
        <div class="block">
            <div class="block-head">
                <h1>GIỚI THIỆU</h1>
            </div>
            <div class="block-body">

                <img src="/Design/pic.jpg" alt="pic" />
                <p>
                    Được sản xuất trên nền nước khoáng thiên nhiên Tasty (đã được giảm nhẹ lượng khoáng), sản phẩm nước khoáng ngọt của Tasty là loại nước giải khát có vị ngon rất đặc trưng và khác biệt vì chứa các khoáng chất từ thiên nhiên. Thưởng thức nước khoáng ngọt của Tasty vừa đem lại cho bạn cảm giác đã khát và một hương vị không lẫn vào đâu được so với các sản phẩm cùng loại trên thị trường, vừa đáp ứng nhu cầu bổ sung khoáng chất của cơ thể, đem đến cho bạn làn da tươi sáng, cơ thể khỏe mạnh và tràn đầy sức sống mỗi ngày.
                </p>
                <p>
                </p>
                <p>
                </p>
                <p>
                </p>
                <p>
                    Được sản xuất trên nền nước khoáng thiên nhiên Tasty (đã được giảm nhẹ lượng khoáng), sản phẩm nước khoáng ngọt của Tasty là loại nước giải khát có vị ngon rất đặc trưng và khác biệt vì chứa các khoáng chất từ thiên nhiên. Thưởng thức nước khoáng ngọt của Tasty vừa đem lại cho bạn cảm giác đã khát và một hương vị không lẫn vào đâu được so với các sản phẩm cùng loại trên thị trường, vừa đáp ứng nhu cầu bổ sung khoáng chất của cơ thể, đem đến cho bạn làn da tươi sáng, cơ thể khỏe mạnh và tràn đầy sức sống mỗi ngày.
                </p>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Footer" ContentPlaceHolderID="FootExtender" runat="Server">
</asp:Content>

