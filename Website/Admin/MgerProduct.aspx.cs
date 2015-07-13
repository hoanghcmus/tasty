using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess.Classes;

public partial class Admin_MgerProduct : System.Web.UI.Page
{
    #region Load du lieu
    private int KiemTraSession()
    {
        int kq = 0;
        string chuoiQuyen = Session["QuyenHan"].ToString();
        string[] str = chuoiQuyen.Split(',');
        foreach (var item in str)
        {
            if (item.ToString() == "1" || item.ToString() == "4" || item.ToString() == "5")
                kq = 1;
        }
        return kq;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (KiemTraSession() == 1)
        {
            if (!IsPostBack)
            {
                //LoadTheLoai();
                LoadLoaiMenu();
                PopulateControls();
            }
        }
        else
            Response.Redirect("~/Admin/Admin.aspx");
    }
    private void PopulateControls()
    {
        int howManyPages = 0;
        string menuID = Request.QueryString["MenuID"] ?? "";
        string chuoiTimKiem = Request.QueryString["Search"] ?? "";
        string Trang = Request.QueryString["Page"] ?? "1";
        string firstPageUrl = "";
        string pagerUrl = "";
        if (menuID != "")
        {
            Label1.Text = "Sản phẩm theo thể loại ID là " + menuID;
            repProd.DataSource = DataAccess.Classes.Product.InMenu(menuID, Trang, out howManyPages);
            repProd.DataBind();
            firstPageUrl = DataAccess.Connect.Link.MgerProductToMenu(menuID);
            pagerUrl = DataAccess.Connect.Link.MgerProductToMenu(menuID, "{0}");
        }
        else if (chuoiTimKiem != "")
        {
            Label1.Text = "Kết quả tìm kiếm sản phẩm cho chuỗi '" + chuoiTimKiem + "'";
            txtTimKiem.Text = chuoiTimKiem.ToString();
            repProd.DataSource = DataAccess.Classes.Product.Search(chuoiTimKiem, Trang, out howManyPages);
            repProd.DataBind();
            firstPageUrl = DataAccess.Connect.Link.MgerProductToSreach(chuoiTimKiem);
            pagerUrl = DataAccess.Connect.Link.MgerProductToSreach(chuoiTimKiem, "{0}");
        }
        else
        {
            Label1.Text = "Danh sách tất cả các sản phẩm";
            repProd.DataSource = DataAccess.Classes.Product.Paging(Trang, out howManyPages);
            repProd.DataBind();
            firstPageUrl = DataAccess.Connect.Link.MgerProduct();
            pagerUrl = DataAccess.Connect.Link.MgerProduct("{0}");
        }
        PagerBottom.Show(int.Parse(Trang), howManyPages, firstPageUrl, pagerUrl, true);
    }
    private void LoadTheLoai()
    {
        ddlTheLoai.DataValueField = "ID";
        ddlTheLoai.DataTextField = "TieuDe_Vn";
        ddlTheLoai.DataSource = TheLoai.LayTheoModuleVaParentNoNull("3");
        ddlTheLoai.DataBind();
    }
    private void LoadLoaiMenu()
    {
        ddlTheLoai.DataValueField = "ID";
        ddlTheLoai.DataTextField = "TieuDe_Vn";

        List<TheLoai> listTL = TheLoai.LayTheoModule("3");
        if (listTL != null && listTL.Count > 0)
        {
            foreach (TheLoai tl in listTL)
            {
                tl.TieuDe_Vn = UCFirst(ShowTitle(tl.TieuDe_Vn).Trim().ToLower());
            }
        }

        ddlTheLoai.DataSource = listTL;
        ddlTheLoai.DataBind();
    }

    public string ShowTitle(string title)
    {
        return DecodeHTML(HttpUtility.HtmlDecode(title));
    }

    public string DecodeHTML(string chuoi)
    {
        Regex regex = new Regex("\\<[^\\>]*\\>");
        chuoi = regex.Replace(chuoi, String.Empty);
        return chuoi;
    }

    protected string UCFirst(string s)
    {
        if (string.IsNullOrEmpty(s))
        {
            return string.Empty;
        }
        return char.ToUpper(s[0]) + s.Substring(1);
    }

    #endregion

    #region Xu ly su kien
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        btnDelete.Click += new EventHandler(btnDelete_Click);
        btnTimKiem.Click += new EventHandler(btnTimKiem_Click);
        repProd.ItemCommand += new RepeaterCommandEventHandler(repProd_ItemCommand);
    }
    void btnDelete_Click(object sender, EventArgs e)
    {
        string stringid = Request.Form["cid"] ?? "";
        if (stringid != "")
        {
            foreach (string id in stringid.Split(','))
            {
                DataAccess.Classes.Product.Delete(id);
                CapNhatHanhDong("Xóa sản phẩm(id: " + id + ")");
            }
            PopulateControls();
        }
    }
    void btnTimKiem_Click(object sender, EventArgs e)
    {
        string chuoiTimKiem = txtTimKiem.Text.Trim();
        if (chuoiTimKiem != "")
        {
            CapNhatHanhDong("Tìm kiếm sản phẩm(chuổi tìm kiếm: " + chuoiTimKiem + ")");
            Response.Redirect("MgerProduct.aspx?Search=" + chuoiTimKiem);
        }
    }
    void repProd_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "UpdateTrangChu")
        {
            string[] s = e.CommandArgument.ToString().Split('_');
            CapNhatHanhDong("Sửa sản phẩm hiển thị trang chủ (id: " + Convert.ToInt32(s[0]).ToString() + ")");
            PopulateControls();
        }
    }
    protected void ddlTheLoai_SelectedIndexChanged(object sender, EventArgs e)
    {
        int chon = Convert.ToInt32(ddlTheLoai.SelectedValue);
        if (chon != 0)
            Response.Redirect("~/Admin/MgerProduct.aspx?MenuID=" + chon.ToString());
    }
    #endregion

    #region Cap nhat hanh dong
    private void CapNhatHanhDong(string hanhDong)
    {
        if (Session["IDNguoiDung"] != "" || Session["IDDangNhap"] != "")
        {
            string maDangNhap = Session["IDDangNhap"].ToString();
            string maNguoiDung = Session["IDNguoiDung"].ToString();
            string hanhDongDangNhap = Session["HanhDongDangNhap"].ToString();
            hanhDongDangNhap += "<br /> - " + hanhDong + " (giờ: " + DateTime.Now.ToShortTimeString() + ")";
            Session["HanhDongDangNhap"] = hanhDongDangNhap;
            DangNhap.SuaHanhDong(maDangNhap, maNguoiDung, hanhDongDangNhap);
        }
    }
    #endregion
}