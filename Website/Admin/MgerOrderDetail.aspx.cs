using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;
using DataAccess.StringUtil;

public partial class Admin_MgerOrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string orderID = Request["orderID"] ?? "0";
            Shopping sp = Shopping.LayTheoID(orderID);
            SetData(sp);
        }
    }


    protected string showMoney(decimal input)
    {
        return StringUltility.createMoneyString(input.ToString("#"));
    }

    public void SetControlEnableState(bool enable)
    {
        drlTrangThai.Enabled = enable;
        //txtNgayOrder.Enabled = enable;        
        txtHoTen.Enabled = enable;
        txtSDT.Enabled = enable;
        txtEmail.Enabled = enable;
        //txtTongTien.Enabled = enable;
        txtDiaChi.Enabled = enable;
        txtYeuCauThem.Enabled = enable;
    }

    public bool ChangeOrderState(int orderID, string state)
    {
        drlTrangThai.SelectedValue = state;
        return Shopping.SuaTrangThai(orderID, state);
    }
    protected void btnDanhDau_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string orderID = Request["orderID"] ?? "0";
        ChangeOrderState(Convert.ToInt32(orderID), btn.CommandArgument);
        SetControlEnableState(false);
    }
    protected void btnChinhSuaThongTinNguoiMuaHnag_Click(object sender, EventArgs e)
    {
        btnLuuThongTinNguoiMuaHang.Visible = true;
        btnChinhSuaThongTinNguoiMuaHnag.Visible = false;
        SetControlEnableState(true);
    }
    protected void btnLuuThongTinNguoiMuaHang_Click(object sender, EventArgs e)
    {
        Shopping sh = GetData();
        if (Shopping.Sua(sh))
        {
            btnLuuThongTinNguoiMuaHang.Visible = false;
            btnChinhSuaThongTinNguoiMuaHnag.Visible = true;
            SetControlEnableState(false);
            lbMess.Text = "<span class='red'>Đã cập nhật đơn hàng</span>";
        }
        else
        {
            lbMess.Text = "<span class='red'>Có lỗi xảy ra</span>";
        }
        lbMess.Visible = true;
    }

    protected Shopping GetData()
    {
        Shopping sp = new Shopping();
        string orderID = Request["orderID"] ?? "0";
        if (orderID != "0")
            sp = Shopping.LayTheoID(orderID);

        sp.HoTen = txtHoTen.Text.ToString().Trim();
        sp.Email = txtEmail.Text.ToString().Trim();
        sp.DiaChi = txtDiaChi.Text.ToString().Trim();
        sp.SDT = Convert.ToInt32(txtSDT.Text.ToString().Trim());
        sp.YeuCauThem = txtYeuCauThem.Text.ToString().Trim();

        sp.NgayOrder = Convert.ToDateTime(txtNgayOrder.Text.ToString().Trim());
        sp.TongHoaDon = Convert.ToDecimal(txtTongTien.Text.ToString().Trim());
        sp.TrangThai = Convert.ToInt32(drlTrangThai.SelectedValue.Trim());
        return sp;
    }
    protected void SetData(Shopping sp)
    {
        txtHoTen.Text = sp.HoTen;
        txtEmail.Text = sp.Email;
        txtDiaChi.Text = sp.DiaChi;
        txtSDT.Text = sp.SDT.ToString();
        txtYeuCauThem.Text = sp.YeuCauThem;

        txtNgayOrder.Text = sp.NgayOrder.ToShortDateString();
        txtTongTien.Text = sp.TongHoaDon.ToString("#");
        drlTrangThai.SelectedValue = sp.TrangThai.ToString();


        Decimal TongHoaDon = 0;
        SanacoDataContext ctx = new SanacoDataContext();
        List<OrdersDetail> listOrderDetail = (from orderDetail in ctx.OrdersDetails
                                              where orderDetail.OrderID == sp.ID
                                              select orderDetail).ToList();
        List<GioHang> listGH = new List<GioHang>();
        if (listOrderDetail != null && listOrderDetail.Count > 0)
        {
            foreach (OrdersDetail od in listOrderDetail)
            {
                Product pr = (from product in ctx.Products
                              where product.ID == od.ProductID
                              select product).First();
                GioHang gh = new GioHang();
                gh.TenSanPham = pr.ProductName;
                gh.HinhAnh = pr.Thumbnail;
                gh.DonGia = (Decimal)pr.NewPrice;
                gh.SoLuong = (Int32)od.Quantity;
                gh.ThanhTien = (Decimal)od.Total;

                TongHoaDon += (gh.SoLuong * gh.DonGia);

                listGH.Add(gh);

            }
        }

        ltrTongHoaDon.Text = "Tổng hóa đơn: <span style='color:red;'>" + showMoney(TongHoaDon) + "</span> VNĐ";
        rptGioHang.DataSource = listGH;
        rptGioHang.DataBind();
    }

    public class GioHang
    {
        public String TenSanPham { get; set; }
        public String HinhAnh { get; set; }
        public Decimal DonGia { get; set; }
        public Int32 SoLuong { get; set; }
        public Decimal ThanhTien { get; set; }

        public GioHang() { }
    }
}