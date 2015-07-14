using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess.Help;
using DataAccess.StringUtil;

public partial class View_ProductCheckout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Customer customer = (Customer)Session["Customer"];
            if (customer != null)
            {
                txtFullName.Text = customer.FullName;
                txtAddress.Text = customer.Address;
                txtPhone.Text = customer.Phone.ToString();
                txtEmail.Text = customer.Email;
                txtOtherRequire.Text = customer.OtherRequire;
            }
        }
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        SanacoDataContext ctx = new SanacoDataContext();
        String sSessionId = Session["SID"].ToString();
        LoadDataToCartRepeater(ctx, sSessionId);

        confirm.Visible = false;
        InforConfirmPanel.Visible = true;

        GetData();
        Customer customer = (Customer)Session["Customer"];
        lbFullName.Text = customer.FullName;
        lbAddress.Text = customer.Address;
        lbPhone.Text = customer.Phone.ToString();
        lbEmail.Text = customer.Email;
        lbOtherRequire.Text = customer.OtherRequire;


    }

    public void GetData()
    {
        Customer cust = new Customer();
        cust.FullName = txtFullName.Text.Trim();
        cust.Address = txtAddress.Text.Trim();
        int phone;
        if (Int32.TryParse(txtPhone.Text.Trim(), out phone))
            cust.Phone = phone;
        cust.Email = txtEmail.Text.Trim();
        cust.OtherRequire = txtOtherRequire.Text.Trim();

        Session["Customer"] = cust;
    }

    public void LoadDataToCartRepeater(SanacoDataContext ctx, string sSessionId)
    {
        var DSCart = (from s in ctx.SessionCarts
                      where s.SessionId == sSessionId
                      select s);

        List<Product> listProductOrder = new List<Product>();
        decimal dTongTien = 0;
        if (DSCart.Count() > 0)
        {
            foreach (var item in DSCart)
            {
                var SanPham = (from sp in ctx.Products
                               where sp.ID == item.ProductId
                               select sp).First();

                decimal dPrice = (decimal)SanPham.NewPrice;
                dTongTien += dPrice * item.Quantity;

                listProductOrder.Add(SanPham);
            }
            rptGioHang.DataSource = listProductOrder;
        }

        rptGioHang.DataBind();
        lbTotal.Text = "<span style=\"color:black;\">Tổng tiền:</span> " + showMoney(dTongTien);
        Session["Total"] = dTongTien;
    }
    public string ShowPosition(object input, string colunmName)
    {
        String sSessionId = Session["SID"].ToString();
        Product data = input as Product;
        SanacoDataContext ctx = new SanacoDataContext();
        Double SoLuong = (from sc in ctx.SessionCarts
                          where sc.SessionId == sSessionId && sc.ProductId == data.ID
                          select sc.Quantity).First();
        switch (colunmName)
        {
            case "id":
                return SoLuong.ToString();
            case "thanhtien":
                String sThanhTien = "---";
                String sPrice = (from sp in ctx.Products
                                 where sp.ID == data.ID
                                 select sp.NewPrice).First().ToString();
                Double dPrice = 0f;
                if (Double.TryParse(sPrice, out dPrice))
                {
                    Double dThanhTien = SoLuong * dPrice;
                    sThanhTien = dThanhTien.ToString();
                }

                return StringUltility.createMoneyString(sThanhTien);
            case "giatien":
                if (data.NewPrice != null && data.NewPrice > 0)
                {
                    return showMoney((decimal)data.NewPrice);
                }
                else
                {
                    return "Vui lòng liên hệ";
                }
            default:
                return "";
        }
    }
    protected string showMoney(decimal input)
    {
        return StringUltility.createMoneyString(input.ToString("#"));
    }

    protected void btnConfirmInfor_Click(object sender, EventArgs e)
    {
        confirm.Visible = true;
        InforConfirmPanel.Visible = false;
    }
    protected void btnMuaHang_Click(object sender, EventArgs e)
    {
        SanacoDataContext ctx = new SanacoDataContext();

        //Theme đơn hàng mới
        Order order = new Order();
        order.SessionID = Session["SID"].ToString();
        Customer cus = (Customer)Session["Customer"];
        order.HoTen = cus.FullName;
        order.DiaChi = cus.Address;
        order.SDT = cus.Phone;
        order.Email = cus.Email;
        order.YeuCauThem = cus.OtherRequire;
        order.TongHoaDon = Convert.ToDecimal(Session["Total"].ToString());
        order.TrangThai = 0;
        order.NgayOrder = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));

        ctx.Orders.InsertOnSubmit(order);
        ctx.SubmitChanges();

        //Theme vào chi tiết order
        String sSessionId = Session["SID"].ToString();
        var oldOrder = (from ord in ctx.Orders
                        where ord.SessionID == sSessionId
                        select ord).First();

        List<OrdersDetail> listProductOrder = new List<OrdersDetail>();
        var DSCart = (from s in ctx.SessionCarts
                      where s.SessionId == sSessionId
                      select s);

        if (DSCart.Count() > 0)
        {
            foreach (var item in DSCart)
            {
                var SanPham = (from sp in ctx.Products
                               where sp.ID == item.ProductId
                               select sp).First();

                OrdersDetail orderDetail = new OrdersDetail();
                orderDetail.OrderID = oldOrder.ID;
                orderDetail.ProductID = SanPham.ID;
                orderDetail.Quantity = item.Quantity;
                orderDetail.SellPrice = SanPham.NewPrice;
                orderDetail.Total = item.Quantity * SanPham.NewPrice;
                listProductOrder.Add(orderDetail);

            }

        }
        ctx.OrdersDetails.InsertAllOnSubmit(listProductOrder);
        ctx.SubmitChanges();

        //Xóa Session cart lưu tạm       
        var DSSCToDelete = (from sc in ctx.SessionCarts
                            where sc.SessionId == sSessionId
                            select sc);

        if (DSSCToDelete.Count() > 0)
        {
            ctx.SessionCarts.DeleteAllOnSubmit(DSSCToDelete);
        }
        ctx.SubmitChanges();

        Session.Abandon();
        Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
        Session["SID"] = Session.SessionID;

        confirm.Visible = false;
        InforConfirmPanel.Visible = false;
        lbMessage.Text = "<span style=\"color:blue; text-align:center; float:left; width: 100%; font-size:15px !important; font-weight: bod; margin-top:20%;\"> Đơn hàng của bạn đã được gửi đi, chúng tôi sẽ xử lý đơn hàng và liên hệ với bạn trong thời gian sớm nhất <br/>Chân thành cảm ơn bạn đã mua sắm tại cửa hàng của chúng tôi</span>";
    }
}