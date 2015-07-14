using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.StringUtil;

public partial class View_AddCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Tạo linQ context
            SanacoDataContext ctx = new SanacoDataContext();
            string sSessionId = Session["SID"].ToString();

            // Lấy product id và session id
            string sPid = Request.QueryString["pid"] ?? "";
            if (sPid != "")
            {
                int nPid = int.Parse(sPid);

                SessionCart newSC = new SessionCart();
                newSC.ProductId = nPid;
                newSC.SessionId = sSessionId;

                // Kiểm tra giỏ hàng với sản phẩm mới
                var DSHang = (from p in ctx.SessionCarts
                              where p.SessionId == sSessionId && p.ProductId == nPid
                              select p);

                if (DSHang.Count() > 0)
                {
                    // Sản phẩm đã được đặt, cộng số lượng đặt lên 1
                    SessionCart oldCart = (SessionCart)(DSHang.First());
                    oldCart.Quantity = oldCart.Quantity + 1;

                }
                else
                {
                    // Chưa đặt sản phẩm này lần nào, thiết lập số lượng đặt là 1
                    newSC.Quantity = 1;
                    ctx.SessionCarts.InsertOnSubmit(newSC);
                }

                // Cập nhật database
                ctx.SubmitChanges();
            }
            LoadDataToCartRepeater(ctx, sSessionId);
        }
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
        else
        {
            btnUpdate.Visible = false;
            hlOrder.Visible = false;
            lbTotal.Visible = false;
            lbTitle.Text = "Giỏ hàng của bạn trống! ";
            //lbMessage.Text = "<span style=\"color:red; font-size: 17px;\"> Cập nhật giỏ hàng thành công!</span>";
        }
        rptGioHang.DataBind();
        lbTotal.Text = "<span style=\"color:black;\">Tổng tiền:</span> " + showMoney(dTongTien);
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
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SanacoDataContext ctx = new SanacoDataContext();

        string sSessionId = Session["SID"].ToString();
        string sQuantity = Request.Form["txtQuantity"] ?? "";
        var quantitys = sQuantity.Split(',').Cast<String>().ToList();

        var DSSC = (from sc in ctx.SessionCarts
                    where sc.SessionId == sSessionId
                    select sc);

        int i = 0;
        foreach (var item in DSSC)
        {
            int quantity = 0;
            if (Int32.TryParse(quantitys.ElementAt(i), out quantity))
            {
                if (quantity > 0)
                {
                    item.Quantity = quantity;
                }
                else
                {
                    ctx.SessionCarts.DeleteOnSubmit(item);
                }
                lbMessage.Text = "<span style=\"color:red; font-size: 17px;\"> Cập nhật giỏ hàng thành công!</span>";
            }
            else
            {
                lbMessage.Text = "<span style=\"color:red;\"> Vui lòng nhập số nguyên cho số lượng sản phẩm</span>";
                return;
            }

            i++;
        }

        string stringid = Request.Form["cbDelProd"] ?? "";
        var ids = stringid.Split(',').Cast<String>().ToList();

        var DSSCToDelete = (from sc in ctx.SessionCarts
                            where sc.SessionId == sSessionId && ids.Contains(sc.ProductId.ToString())
                            select sc);

        if (DSSCToDelete.Count() > 0)
        {
            ctx.SessionCarts.DeleteAllOnSubmit(DSSCToDelete);
        }

        ctx.SubmitChanges();

        LoadDataToCartRepeater(ctx, Session["SID"].ToString());
    }
}